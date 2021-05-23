package main

import (
	"context"
	"log"

	"github.com/mopeneko/line-selfbot/linebot/pkg/config"
	"github.com/mopeneko/line-selfbot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-selfbot/linebot/pkg/linetoken/androidlite"
	"github.com/mopeneko/line-selfbot/linebot/poll"
	"golang.org/x/xerrors"
)

func main() {
	conf := config.NewConfig()

	ctx := context.Background()

	accessToken, certificate, err := androidlite.QRLogin(ctx, conf)
	if err != nil {
		log.Fatalf("failed to login: %+v\n", err)
	}

	log.Println("AccessToken:", accessToken)
	log.Println("Certificate:", certificate)

	// LINEクライアントの生成
	client, err := generateLINEClient(conf, accessToken)
	if err != nil {
		log.Fatalf("failed to generate LINE client: %+v\n", err)
	}

	log.Println("Bot starting...")
	poll.Poll(ctx, client)
}

func generateLINEClient(conf config.Config, accessToken string) (*lineclient.LINEClient, error) {
	cfg := lineclient.Config{
		Host:                      conf.Host,
		TalkServicePath:           conf.TalkServicePath,
		TalkServicePathForPolling: conf.TalkServicePathForPolling,
		UserAgent:                 conf.UserAgent,
		LINEApp:                   conf.LINEApp,
		AccessToken:               accessToken,
	}

	client, err := lineclient.NewLINEClient(cfg)
	if err != nil {
		return nil, xerrors.Errorf("failed to generate LINE client: %w", err)
	}

	return client, nil
}
