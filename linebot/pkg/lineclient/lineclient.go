package lineclient

import (
	"context"

	"github.com/mopeneko/line-selfbot/linethrift/talkservice"
	"golang.org/x/xerrors"
)

// LINEClient - LINEクライアントを一元管理する構造体
type LINEClient struct {
	Profile *talkservice.Profile

	talkServiceThriftClient           *ThriftClient
	talkServiceThriftClientForPolling *ThriftClient

	TalkServiceClient           *talkservice.TalkServiceClient // TalkServiceのクライアント
	TalkServiceClientForPolling *talkservice.TalkServiceClient // TalkServiceのクライアント(Polling用)
}

// Config - LINEClientの設定
type Config struct {
	Host                      string // LINEのホスト(スキームも含む)
	TalkServicePath           string // TalkServiceのパス
	TalkServicePathForPolling string // TalkServiceのパス(Polling用)
	UserAgent                 string // User-Agentヘッダ
	LINEApp                   string // X-Line-Applicationヘッダ
	AccessToken               string // X-Line-Accessヘッダ
}

// NewLINEClient - LINEClientのコンストラクタ
func NewLINEClient(config Config) (*LINEClient, error) {
	client := new(LINEClient)

	// Thriftクライアントを生成

	{
		url := config.Host + config.TalkServicePath

		tClient, err := NewThriftClient(url)
		if err != nil {
			return nil, xerrors.Errorf("failed to generate thrift client: %w", err)
		}

		serviceClient := talkservice.NewTalkServiceClient(tClient.StandardClient)

		client.talkServiceThriftClient = tClient
		client.TalkServiceClient = serviceClient
	}

	{
		url := config.Host + config.TalkServicePathForPolling

		tClient, err := NewThriftClient(url)
		if err != nil {
			return nil, xerrors.Errorf("failed to generate thrift client: %w", err)
		}

		serviceClient := talkservice.NewTalkServiceClient(tClient.StandardClient)

		client.talkServiceThriftClientForPolling = tClient
		client.TalkServiceClientForPolling = serviceClient
	}

	// リクエストヘッダを設定

	client.talkServiceThriftClient.SetHeader("User-Agent", config.UserAgent)
	client.talkServiceThriftClient.SetHeader("X-Line-Application", config.LINEApp)
	client.talkServiceThriftClient.SetHeader("X-Line-Access", config.AccessToken)

	client.talkServiceThriftClientForPolling.SetHeader("User-Agent", config.UserAgent)
	client.talkServiceThriftClientForPolling.SetHeader("X-Line-Application", config.LINEApp)
	client.talkServiceThriftClientForPolling.SetHeader("X-Line-Access", config.AccessToken)

	profile, err := client.TalkServiceClient.GetProfile(context.Background(), talkservice.SyncReason_UNKNOWN)
	if err != nil {
		return nil, err
	}

	client.Profile = profile

	return client, nil
}
