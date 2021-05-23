package tmpl

import (
	"context"
	"embed"
	"fmt"
	"html/template"
	"strings"

	"github.com/mopeneko/line-selfbot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-selfbot/linethrift/talkservice"
)

//go:embed templates/*.tmpl
var templates embed.FS

func SendTemplate(ctx context.Context, to, filename string, params interface{}, client *lineclient.LINEClient) error {
	var builder strings.Builder

	path := fmt.Sprintf("templates/%s", filename)

	err := template.Must(template.ParseFS(templates, path)).Execute(&builder, params)
	if err != nil {
		return err
	}

	text := strings.Trim(builder.String(), "\n")

	msg := new(talkservice.Message)
	msg.To = to
	msg.Text = text

	_, err = client.TalkServiceClient.SendMessage(ctx, 0, msg)
	if err != nil {
		return err
	}

	return nil
}
