package config

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
)

type Config struct {
	AutoLeaveRoom bool `json:"autoLeaveRoom"`
}

func initConfig(mid string) (*Config, error) {
	// TODO: 初期値が全てGoのデフォルトになってしまうので、NewConfig のようなイニシャライザ関数を作って、それを呼び出すようにする
	cfg := new(Config)
	b, err := json.Marshal(cfg)
	if err != nil {
		return nil, err
	}

	file, err := os.Create(fmt.Sprintf("./data/%s.json", mid))
	if err != nil {
		return nil, err
	}

	defer file.Close()

	_, err = file.Write(b)
	if err != nil {
		return nil, err
	}

	return cfg, nil
}

func LoadConfig(mid string) (*Config, error) {
	file, err := os.Open(fmt.Sprintf("./data/%s.json", mid))
	if err != nil {
		cfg, err := initConfig(mid)
		if err != nil {
			return nil, err
		}

		return cfg, nil
	}

	defer file.Close()

	b, err := io.ReadAll(file)
	if err != nil {
		return nil, err
	}

	cfg := new(Config)

	err = json.Unmarshal(b, cfg)
	if err != nil {
		return nil, err
	}

	return cfg, nil
}

func SaveConfig(cfg *Config, mid string) error {
	b, err := json.Marshal(cfg)
	if err != nil {
		return err
	}

	file, err := os.OpenFile(fmt.Sprintf("./data/%s.json", mid), os.O_WRONLY, 0644)
	if err != nil {
		return err
	}

	defer file.Close()

	_, err = file.Write(b)
	if err != nil {
		return err
	}

	return nil
}
