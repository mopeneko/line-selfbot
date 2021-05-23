include "SecondaryQrCodeLoginService.thrift"

struct VerifyQrCodeResponse {

}

struct VerifyQrCodeRequest {
    1: string authSessionId;
    2: map<string, string> metaData;
}

struct CancelPinCodeResponse {

}

struct CancelPinCodeRequest {
    1: string authSessionId;
}

struct VerifyPinCodeResponse {

}

struct VerifyPinCodeRequest {
    1: string authSessionId;
    2: string pinCode;
}

struct GetLoginActorContextResponse {
    1: string appType;
    2: string accessLocation;
}

struct GetLoginActorContextRequest {
    1: string authSessionId;
}

service SecondaryQrCodeLoginPermitService {
    // SECTION SecondaryLoginPermitViewModel

    VerifyQrCodeResponse verifyQrCode(
        1: VerifyQrCodeRequest request,
    ) throws(1: SecondaryQrCodeLoginService.SecondaryQrCodeException e);

    CancelPinCodeResponse cancelPinCode(
        1: CancelPinCodeRequest request,
    ) throws(1: SecondaryQrCodeLoginService.SecondaryQrCodeException e);

    VerifyPinCodeResponse verifyPinCode(
        1: VerifyPinCodeRequest request,
    ) throws(1: SecondaryQrCodeLoginService.SecondaryQrCodeException e);

    GetLoginActorContextResponse getLoginActorContext(
        1: GetLoginActorContextRequest request,
    ) throws(1: SecondaryQrCodeLoginService.SecondaryQrCodeException e);
}
