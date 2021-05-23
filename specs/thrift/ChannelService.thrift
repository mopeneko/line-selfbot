enum ChannelErrorCode {
    ILLEGAL_ARGUMENT = 0,
    INTERNAL_ERROR = 1,
    CONNECTION_ERROR = 2,
    AUTHENTICATIONI_FAILED = 3,
    NEED_PERMISSION_APPROVAL = 4,
    COIN_NOT_USABLE = 5,
    WEBVIEW_NOT_ALLOWED = 6
}

exception ChannelException {
    1: ChannelErrorCode code;
    2: string reason;
    3: map<string, string> parameterMap;
}

struct ChannelToken {
    1: string token;
    2: string obsToken;
    3: i64 expiration;
    4: string refreshToken;
    5: string channelAccessToken;
}

struct WebLoginResponse {
    1: string returnUrl;
    2: string optionalReturnUrl;
    3: string redirectConfirmationPageUrl;
}

struct WebLoginRequest {
    1: string hookedFullUrl;
    2: string sessionString;
    3: bool fromIAB;
    4: string sourceApplication;
}

service ChannelService {
    // SECTION TimelineService

    ChannelToken issueChannelToken(
        1: string channelId, // ChannelId
    ) throws(1: ChannelException e);


    // SECTION LiteChannelService

    WebLoginResponse getReturnUrlWithRequestTokenForAutoLogin(
        2: WebLoginRequest webLoginRequest,
    ) throws(1: ChannelException e);
}
