enum ErrorCode {
    INTERNAL_ERROR = 0,
    ILLEGAL_ARGUMENT = 1,
    VERIFICATION_FAILED = 2,
    NOT_ALLOWED_QR_CODE_LOGIN = 3,
    VERIFICATION_NOTICE_FAILED = 4,
    RETRY_LATER = 5,
    INVALID_CONTEXT = 100,
    APP_UPGRADE_REQUIRED = 101
}

exception SecondaryQrCodeException {
    1: ErrorCode code;
    2: string alertMessage;
}

struct CreateQrSessionResponse {
    1: string authSessionId;
}

struct CreateQrSessionRequest {

}

struct CreateQrCodeResponse {
    1: string callbackUrl;
}

struct CreateQrCodeRequest {
    1: string authSessionId;
}

struct CreatePinCodeResponse {
    1: string pinCode;
}

struct CreatePinCodeRequest {
    1: string authSessionId;
}

struct VerifyCertificateResponse {

}

struct VerifyCertificateRequest {
    1: string authSessionId;
    2: string certificate;
}

struct QrCodeLoginResponse {
    1: string certificate;
    2: string accessToken;
    3: i64 lastBindTimestamp; // Timestamp
    4: map<string, string> metaData;
}

struct QrCodeLoginRequest {
    1: string authSessionId;
    2: string systemName;
    3: bool autoLoginIsRequired;
}

service SecondaryQrCodeLoginService {
    // SECTION SecondaryLoginViewModel

    CreateQrSessionResponse createSession(
        1: CreateQrSessionRequest request,
    ) throws(1: SecondaryQrCodeException e);

    CreateQrCodeResponse createQrCode(
        1: CreateQrCodeRequest request,
    ) throws(1: SecondaryQrCodeException e);

    CreatePinCodeResponse createPinCode(
        1: CreatePinCodeRequest request,
    ) throws(1: SecondaryQrCodeException e);

    VerifyCertificateResponse verifyCertificate(
        1: VerifyCertificateRequest request,
    ) throws(1: SecondaryQrCodeException e);

    QrCodeLoginResponse qrCodeLogin(
        1: QrCodeLoginRequest request,
    ) throws(1: SecondaryQrCodeException e);
}
