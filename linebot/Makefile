GOCMD=go
GOBUILD=$(GOCMD) build
GOTEST=$(GOCMD) test

GOLINTCMD=golangci-lint
GOLINT=$(GOLINTCMD) run

TARGET_PKG=./cmd/linebot
OUTFILE=linebot

.PHONY: all
all: test build

.PHONY: build
build:
	$(GOBUILD) -o $(OUTFILE) $(TARGET_PKG)

.PHONY: test
test:
	$(GOTEST) -v ./...

.PHONY: lint
lint:
	$(GOLINT) --fast

.PHONY: clean
clean:
	$(RM) $(OUTFILE)
