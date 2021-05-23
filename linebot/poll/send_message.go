package poll

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/mopeneko/line-selfbot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-selfbot/linebot/pkg/tmpl"
	"github.com/mopeneko/line-selfbot/linethrift/talkservice"
)

func sendMessage(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient) error {
	message := op.Message

	// Global commands
	if message.Text == "help" {
		err := helpCommand(ctx, op, client)
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
		err := urlCommand(ctx, op, client)
		if err != nil {
			return err
		}

	case "speed":
		err := speedCommand(ctx, op, client)
		if err != nil {
			return err
		}
	}

	return nil
}

func helpCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient) error {
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

func urlCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient) error {
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

func speedCommand(ctx context.Context, op *talkservice.Operation, client *lineclient.LINEClient) error {
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
		return nil
	}

	msg.Text = fmt.Sprintf("%d ms", end.Sub(start).Milliseconds())
	_, err = client.TalkServiceClient.SendMessage(ctx, 0, msg)
	if err != nil {
		return nil
	}

	return nil
}
