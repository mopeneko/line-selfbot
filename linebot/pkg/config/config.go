package config

// Config - LINE botの設定
type Config struct {
	Host                      string // LINEのホスト(スキームも含む)
	TalkServicePath           string // TalkServiceのパス
	TalkServicePathForPolling string // TalkServiceのパス(Polling用)
	QrPath                    string // QRログインのパス
	PermitNoticePath          string // クライアントへログイン処理させるためのパス
	UserAgent                 string // User-Agentヘッダ
	LINEApp                   string // X-Line-Applicationヘッダ
}

// NewConfig - Configのコンストラクタ
func NewConfig() Config {
	return Config{
		Host:                      "https://legy-jp.line.naver.jp",
		TalkServicePath:           "/S4",
		TalkServicePathForPolling: "/P4",
		QrPath:                    "/acct/lgn/sq/v1",
		PermitNoticePath:          "/acct/lp/lgn/sq/v1",
		UserAgent:                 "LLA/2.13.2 Nexus 7 10.0.0",
		LINEApp:                   "ANDROIDLITE\t2.13.2\tAndroid OS\t10;SECONDARY",
	}
}
