package poll

import (
	"context"
	"fmt"
	"log"
	"strconv"
	"strings"
	"time"

	"github.com/mopeneko/line-selfbot/linebot/config"
	"github.com/mopeneko/line-selfbot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-selfbot/linebot/pkg/tmpl"
	"github.com/mopeneko/line-selfbot/linethrift/talkservice"
)

func sendMessage(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message

	// Global commands
	switch message.Text {
	case "help":
		err := helpCommand(ctx, op, client, cfg)
		if err != nil {
			return err
		}

	case "speed":
		err := speedCommand(ctx, op, client, cfg)
		if err != nil {
			return err
		}

	case "setting":
		err := settingCommand(ctx, op, client, cfg)
		if err != nil {
			return err
		}

	case "autoleaveroom:on":
		err := autoLeaveRoomOnCommand(ctx, op, client, cfg)
		if err != nil {
			return err
		}

	case "autoleaveroom:off":
		err := autoLeaveRoomOffCommand(ctx, op, client, cfg)
		if err != nil {
			return err
		}
	}

	if strings.HasPrefix(message.Text, "macro:") {
		err := macroCommand(ctx, op, client, cfg)
		if err != nil {
			return err
		}
	}

	// Group commands
	if message.ToType != talkservice.MIDType_GROUP {
		return nil
	}

	switch message.Text {
	case "url":
		err := urlCommand(ctx, op, client, cfg)
		if err != nil {
			return err
		}

	case "set":
		err := setPoint(ctx, op, client, cfg)
		if err != nil {
			return err
		}

	case "read":
		err := readPoint(ctx, op, client, cfg)
		if err != nil {
			return err
		}
	}

	return nil
}

func helpCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message
	to := message.To
	if message.ToType == talkservice.MIDType_USER {
		to = message.Get_from()
	}

	params := &tmpl.HelpParams{}
	err := tmpl.SendTemplate(ctx, to, "help.tmpl", params, client)
	if err != nil {
		return err
	}

	return nil
}

func urlCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message

	chats, err := client.TalkServiceClient.GetChats(ctx, &talkservice.GetChatsRequest{
		ChatMids: []string{message.To},
	})
	if err != nil {
		return err
	}

	chat := chats.Chats[0]
	if chat.Extra.GroupExtra.PreventedJoinByTicket {
		chat.Extra.GroupExtra.PreventedJoinByTicket = false
		_, err = client.TalkServiceClient.UpdateChat(ctx, &talkservice.UpdateChatRequest{
			UpdatedAttribute: talkservice.ChatAttribute_PREVENTED_JOIN_BY_TICKET,
			Chat:             chat,
		})
		if err != nil {
			log.Printf("%+v\n", err)
			return err
		}
	}

	ticket, err := client.TalkServiceClient.ReissueChatTicket(ctx, &talkservice.ReissueChatTicketRequest{
		ReqSeq:   0,
		GroupMid: message.To,
	})
	if err != nil {
		return err
	}

	url := fmt.Sprintf("https://line.me/ti/g/%s", ticket.TicketId)

	params := &tmpl.InvitationLinkParams{
		URL: url,
	}
	err = tmpl.SendTemplate(ctx, message.To, "invitation_link.tmpl", params, client)
	if err != nil {
		return err
	}

	return nil
}

func speedCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message
	to := message.To
	if message.ToType == talkservice.MIDType_USER {
		to = message.Get_from()
	}

	msg := new(talkservice.Message)
	msg.To = to
	msg.Text = "Measuring..."

	start := time.Now()
	_, err := client.TalkServiceClient.SendMessage(ctx, 0, msg)
	end := time.Now()
	if err != nil {
		return err
	}

	msg.Text = fmt.Sprintf("%d ms", end.Sub(start).Milliseconds())
	_, err = client.TalkServiceClient.SendMessage(ctx, 0, msg)
	if err != nil {
		return err
	}

	return nil
}

func settingCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message
	to := message.To
	if message.ToType == talkservice.MIDType_USER {
		to = message.Get_from()
	}

	params := &tmpl.SettingParams{
		AutoLeaveRoom: cfg.AutoLeaveRoom,
	}

	err := tmpl.SendTemplate(ctx, to, "setting.tmpl", params, client)
	if err != nil {
		return err
	}

	return nil
}

func autoLeaveRoomOnCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message
	to := message.To
	if message.ToType == talkservice.MIDType_USER {
		to = message.Get_from()
	}

	cfg.AutoLeaveRoom = true
	err := config.SaveConfig(cfg, client.Profile.Mid)
	if err != nil {
		return err
	}

	msg := new(talkservice.Message)
	msg.To = to
	msg.Text = "オンにしました。"

	_, err = client.TalkServiceClient.SendMessage(ctx, 0, msg)
	if err != nil {
		return err
	}

	return nil
}

func autoLeaveRoomOffCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message
	to := message.To
	if message.ToType == talkservice.MIDType_USER {
		to = message.Get_from()
	}

	cfg.AutoLeaveRoom = false
	err := config.SaveConfig(cfg, client.Profile.Mid)
	if err != nil {
		return err
	}

	msg := new(talkservice.Message)
	msg.To = to
	msg.Text = "オフにしました。"

	_, err = client.TalkServiceClient.SendMessage(ctx, 0, msg)
	if err != nil {
		return err
	}

	return nil
}

func macroCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message
	to := message.To
	if message.ToType == talkservice.MIDType_USER {
		to = message.Get_from()
	}

	texts := strings.SplitN(message.Text, ":", 3)

	count, err := strconv.Atoi(texts[1])
	if err != nil {
		return err
	}

	text := texts[2]

	msg := new(talkservice.Message)
	msg.To = to
	msg.Text = text

	for i := 0; i < count; i++ {
		_, err = client.TalkServiceClient.SendMessage(ctx, 0, msg)
		if err != nil {
			return err
		}
	}

	return nil
}

func setPoint(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message

	cfg.ReadPoint[message.To] = make([]string, 0)

	msg := new(talkservice.Message)
	msg.To = message.To
	msg.Text = "セットしたよ"

	_, err := client.TalkServiceClient.SendMessage(ctx, 0, msg)
	if err != nil {
		return err
	}

	return nil
}

func readPoint(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient, cfg *config.Config) error {
	message := op.Message
	msg := new(talkservice.Message)
	msg.To = message.To

	readers, ok := cfg.ReadPoint[message.To]
	if !ok {
		msg.Text = "既読ポイントが設定されていません"
		_, err := client.TalkServiceClient.SendMessage(ctx, 0, msg)
		if err != nil {
			return err
		}
		return nil
	}

	readersContact, err := client.TalkServiceClient.GetContacts(ctx, readers)
	if err != nil {
		return err
	}

	for _, contact := range readersContact {
		msg.Text += fmt.Sprintf("%s\n", contact.DisplayName)
	}

	if msg.Text == "" {
		msg.Text = "誰もいないよ"
	}

	strings.TrimRight(msg.Text, "\n")

	_, err = client.TalkServiceClient.SendMessage(ctx, 0, msg)
	if err != nil {
		return err
	}

	return nil
}
