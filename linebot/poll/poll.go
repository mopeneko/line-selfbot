package poll

import (
	"context"
	"log"
	"math"
	"strconv"
	"strings"

	"github.com/go-utils/cont"
	"github.com/mopeneko/line-selfbot/linebot/config"
	"github.com/mopeneko/line-selfbot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-selfbot/linethrift/talkservice"
)

// Poll - Polling
func Poll(ctx context.Context, client *lineclient.LINEClient, cfg *config.Config) {
	const (
		count = 100
		sep   = "\x1e"
	)
	var (
		localRev      int64
		globalRev     int64
		individualRev int64
	)

	for {
		operations, err := client.TalkServiceClientForPolling.FetchOps(ctx, localRev, count, globalRev, individualRev)
		if err != nil {
			if strings.Contains(err.Error(), "server sent GOAWAY and closed the connection") {
				continue
			}
			log.Fatalf("failed to call fetchOps: %+v\n", err)
		}

		for _, op := range operations {
			switch op.Type {
			case talkservice.OpType_END_OF_OPERATION:
				if op.Param1 != "" {
					individualRevString, err := strconv.Atoi(strings.Split(op.Param1, sep)[0])
					if err != nil {
						log.Fatalf("failed to get individualRev: %+v\n", err)
					}
					individualRev = int64(individualRevString)
				}

				if op.Param2 != "" {
					globalRevString, err := strconv.Atoi(strings.Split(op.Param2, sep)[0])
					if err != nil {
						log.Fatalf("failed to get individualRev: %+v\n", err)
					}
					globalRev = int64(globalRevString)
				}

				continue

			case talkservice.OpType_SEND_MESSAGE:
				err := sendMessage(ctx, op, client, cfg)
				if err != nil {
					log.Printf("%+v\n", err)
				}

			case talkservice.OpType_NOTIFIED_INVITE_INTO_ROOM:
				if cfg.AutoLeaveRoom {
					err := client.TalkServiceClient.LeaveRoom(ctx, 0, op.Param1)
					if err != nil {
						log.Printf("%+v\n", err)
					}
				}

			case talkservice.OpType_NOTIFIED_READ_MESSAGE:
				readPoint, ok := cfg.ReadPoint[op.Param1]
				if !ok {
					continue
				}

				if cont.Contains(readPoint, op.Param2) {
					continue
				}

				cfg.ReadPoint[op.Param1] = append(readPoint, op.Param2)
			}

			localRev = int64(math.Max(float64(localRev), float64(op.Revision)))
		}
	}
}
