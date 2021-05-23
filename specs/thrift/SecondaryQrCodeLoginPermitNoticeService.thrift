include "SecondaryQrCodeLoginService.thrift"

struct CheckQrCodeVerifiedResponse {

}

struct CheckQrCodeVerifiedRequest {
    1: string authSessionId;
}

struct CheckPinCodeVerifiedResponse {

}

struct CheckPinCodeVerifiedRequest {
    1: string authSessionId;
}

service SecondaryQrCodeLoginPermitNoticeService {
    // SECTION SecondaryLoginViewModel

    CheckQrCodeVerifiedResponse checkQrCodeVerified(
        1: CheckQrCodeVerifiedRequest request,
    ) throws(1: SecondaryQrCodeLoginService.SecondaryQrCodeException e);

    CheckPinCodeVerifiedResponse checkPinCodeVerified(
        1: CheckPinCodeVerifiedRequest request,
    ) throws(1: SecondaryQrCodeLoginService.SecondaryQrCodeException e);
}
