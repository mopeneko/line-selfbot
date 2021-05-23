package androidlite

import (
	"context"
	"errors"
	"fmt"

	"github.com/skip2/go-qrcode"

	"github.com/mopeneko/line-selfbot/linebot/pkg/config"
	"github.com/mopeneko/line-selfbot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-selfbot/linethrift/secondaryqrcodeloginpermitnoticeservice"
	"github.com/mopeneko/line-selfbot/linethrift/secondaryqrcodeloginservice"
	"golang.org/x/xerrors"
)

// QRLogin logins with QR via LINE Lite
func QRLogin(ctx context.Context, conf config.Config) (accessToken string, certificate string, err error) {
	qrThriftClient, err := lineclient.NewThriftClient(conf.Host + conf.QrPath)
	if err != nil {
		return "", "", xerrors.Errorf("failed to create new Thrift client: %w", err)
	}

	qrThriftClient.SetHeader("User-Agent", conf.UserAgent)
	qrThriftClient.SetHeader("X-Line-Application", conf.LINEApp)

	qrClient := secondaryqrcodeloginservice.NewSecondaryQrCodeLoginServiceClient(qrThriftClient.StandardClient)

	session, err := qrClient.CreateSession(ctx, &secondaryqrcodeloginservice.CreateQrSessionRequest{})
	if err != nil {
		return "", "", xerrors.Errorf("failed to create session: %w", err)
	}

	authSessionID := session.AuthSessionId

	qr, err := qrClient.CreateQrCode(ctx, &secondaryqrcodeloginservice.CreateQrCodeRequest{
		AuthSessionId: authSessionID,
	})
	if err != nil {
		return "", "", xerrors.Errorf("failed to create QR code: %w", err)
	}

	fmt.Println(qr.CallbackUrl)

	encodedQR, err := qrcode.New(qr.CallbackUrl, qrcode.Medium)
	if err != nil {
		return "", "", xerrors.Errorf("failed to encode QR code: %w", err)
	}

	qrString := encodedQR.ToSmallString(false)
	fmt.Println(qrString)

	pnThriftClient, err := lineclient.NewThriftClient(conf.Host + conf.PermitNoticePath)
	if err != nil {
		return "", "", xerrors.Errorf("failed to create new Thrift client: %w", err)
	}

	pnThriftClient.SetHeader("User-Agent", conf.UserAgent)
	pnThriftClient.SetHeader("X-Line-Application", conf.LINEApp)

	pnClient := secondaryqrcodeloginpermitnoticeservice.NewSecondaryQrCodeLoginPermitNoticeServiceClient(
		pnThriftClient.StandardClient,
	)

	_, err = checkQrCodeVerified(ctx, pnClient, pnThriftClient, authSessionID)
	if err != nil {
		return "", "", errors.New("timeout")
	}

	pnThriftClient.DelHeader("X-Line-Access")

	_, err = qrClient.VerifyCertificate(ctx, &secondaryqrcodeloginservice.VerifyCertificateRequest{
		AuthSessionId: authSessionID,
	})

	if err == nil {
		loginResult, err := qrClient.QrCodeLogin(ctx, &secondaryqrcodeloginservice.QrCodeLoginRequest{
			AuthSessionId:       authSessionID,
			SystemName:          "line-selfbot",
			AutoLoginIsRequired: true,
		})
		if err != nil {
			return "", "", xerrors.Errorf("failed to login: %w", err)
		}
		return loginResult.AccessToken, loginResult.Certificate, nil
	}

	pin, err := qrClient.CreatePinCode(ctx, &secondaryqrcodeloginservice.CreatePinCodeRequest{
		AuthSessionId: authSessionID,
	})
	if err != nil {
		return "", "", xerrors.Errorf("failed to create pin code: %w", err)
	}

	fmt.Println("Insert PIN code:", pin.PinCode)

	_, err = checkPinCodeVerified(ctx, pnClient, pnThriftClient, authSessionID)
	if err != nil {
		return "", "", errors.New("timeout")
	}

	loginResult, err := qrClient.QrCodeLogin(ctx, &secondaryqrcodeloginservice.QrCodeLoginRequest{
		AuthSessionId:       authSessionID,
		SystemName:          "line-selfbot",
		AutoLoginIsRequired: true,
	})
	if err != nil {
		return "", "", xerrors.Errorf("failed to login: %w", err)
	}
	return loginResult.AccessToken, loginResult.Certificate, nil
}

func checkQrCodeVerified(
	ctx context.Context,
	client *secondaryqrcodeloginpermitnoticeservice.SecondaryQrCodeLoginPermitNoticeServiceClient,
	thriftClient *lineclient.ThriftClient,
	authSessionID string) (*secondaryqrcodeloginpermitnoticeservice.CheckQrCodeVerifiedResponse, error) {
	thriftClient.SetHeader("X-Line-Access", authSessionID)

	res, err := client.CheckQrCodeVerified(ctx, &secondaryqrcodeloginpermitnoticeservice.CheckQrCodeVerifiedRequest{
		AuthSessionId: authSessionID,
	})

	thriftClient.DelHeader("X-Line-Access")
	return res, err
}

func checkPinCodeVerified(
	ctx context.Context,
	client *secondaryqrcodeloginpermitnoticeservice.SecondaryQrCodeLoginPermitNoticeServiceClient,
	thriftClient *lineclient.ThriftClient,
	authSessionID string) (*secondaryqrcodeloginpermitnoticeservice.CheckPinCodeVerifiedResponse, error) {
	thriftClient.SetHeader("X-Line-Access", authSessionID)

	res, err := client.CheckPinCodeVerified(ctx, &secondaryqrcodeloginpermitnoticeservice.CheckPinCodeVerifiedRequest{
		AuthSessionId: authSessionID,
	})

	thriftClient.DelHeader("X-Line-Access")
	return res, err
}
