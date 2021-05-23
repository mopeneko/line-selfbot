include "TalkService.thrift"

enum CallFlowType {
    NEW = 1,
    PLANET = 2
}

struct CallRoute {
    10: string toMid; // MID
    11: string tunneling;
    12: string commParam;
    1: string fromToken;
    2: CallFlowType callFlowType;
    3: string voipAddress;
    4: i32 voipUdpPort;
    5: i32 voipTcpPort;
    6: string fromZone;
    7: string toZone;
    8: bool fakeCall;
    9: string ringbackTone;
}

enum FreeCallType {
    AUDIO = 1,
    VIDEO = 2,
    FACEPLAY = 3
}

enum GroupCallProtocol {
    STANDARD = 1,
    CONSTELLA = 2
}

struct GroupCallRoute {
    7: string voipAddress;
    8: i32 voipUdpPort;
    9: i32 voipTcpPort;
    10: string fromZone;
    11: string commParam;
    12: string polarisAddress;
    13: i32 polarisUdpPort;
    14: string polarisZone;
    15: string orionAddress;
    1: string token;
    2: CallHost cscf;
    3: CallHost mix;
    4: string hostMid; // MID
    5: list<string> capabilities;
    6: GroupCallProtocol proto;
}

enum GroupCallMediaType {
    AUDIO = 1,
    VIDEO = 2,
    LIVE = 3
}

struct GroupCall {
    1: bool online;
    2: string chatMid; // MID
    3: string hostMid; // MID
    4: list<string> memberMids // MID
    5: i64 started; // Timestamp
    6: GroupCallMediaType mediaType;
    7: GroupCallProtocol protocol;
}

struct CallHost {
    2: i32 port;
    3: string zone;
}

service CallService {
    // SECTION CallService

    CallRoute acquireCallRoute(
        2: string to,
        3: FreeCallType callType,
        4: map<string, string> fromEnvInfo,
    ) throws(1: TalkService.TalkException e);

    GroupCallRoute acquireGroupCallRoute(
        2: string chatMid, // MID
        3: GroupCallMediaType mediaType,
        4: bool isInitialHost,
        5: list<string> capabilities,
    ) throws(1: TalkService.TalkException e);

    GroupCall getGroupCall(
        2: string chatMid,
    ) throws(1: TalkService.TalkException e);
}
