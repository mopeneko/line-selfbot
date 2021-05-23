package ywt

import (
	"crypto/hmac"
	"crypto/sha1"
	"encoding/base64"
	"time"
)

// GenerateIssuedAt - YAML Web Tokenのiatを生成する
func GenerateIssuedAt() int64 {
	return time.Now().UnixNano() / int64(time.Millisecond)
}

// SignYWT - keyを用いてYAML Web Tokenをハッシュする
func SignYWT(iat string, key []byte) string {
	hasher := hmac.New(sha1.New, key)
	hasher.Write([]byte(iat))
	mac := base64.StdEncoding.EncodeToString(hasher.Sum(nil))
	return mac
}
