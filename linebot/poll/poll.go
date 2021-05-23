package poll

import (
	"context"
	"log"
	"math"
	"strconv"
	"strings"

	"github.com/mopeneko/line-selfbot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-selfbot/linethrift/talkservice"
)

// Poll - Polling
func Poll(ctx context.Context, client *lineclient.LINEClient) {
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
				err := sendMessage(ctx, op, client)
				if err != nil {
					log.Printf("%+v\n", err)
				}
			}

			localRev = int64(math.Max(float64(localRev), float64(op.Revision)))
		}
	}
}
