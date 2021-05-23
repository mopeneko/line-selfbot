enum ErrorCode {
    INTERNAL_ERROR = 0,
    ILLEGAL_ARGUMENT = 1,
    VERIFICATION_FAILED = 2,
    NOT_FOUND = 3,
    RETRY_LATER = 4,
    HUMAN_VERIFICATION_REQUIRED = 5,
    INVALID_CONTEXT = 100,
    APP_UPGRADE_REQUIRED = 101
}

exception AuthException {
    1: ErrorCode code;
    2: string alertMessage;
    11: WebAuthDetails webAuthDetails;
}

struct OpenSessionRequest {
    1: map<string, string> metaData;
}

enum AccountVerifMethod {
    UNKNOWN = 0,
    SKIP = 1,
    PASSWORD = 2,
    WEB_BASED = 3
}

struct GetAcctVerifMethodResponse {
    1: AccountVerifMethod availableMethod;
    2: bool sameAccountFromAuthFactor;
}

enum AccountIdentifierType {
    UNKNOWN = 0,
    PHONE_NUMBER = 1,
    EMAIL = 2
}

struct AccountIdentifier {
    1: AccountIdentifierType type;
    2: string identifier;
    11: string countryCode;
}

struct RegisterPrimaryResponse {
    1: string authToken;
}

struct MigratePrimaryResponse {
    1: string authToken;
}

enum PhoneVerifMethod {
    UNKNOWN = 0,
    UNAVAILABLE = 1,
    SMS = 2,
    TTS = 3
}

struct GetPhoneVerifMethodResponse {
    1: list<PhoneVerifMethod> availableMethods;
    3: string prettifiedPhoneNumber;
}

struct Device {
    1: string udid;
    2: string deviceModel;
}

struct UserPhoneNumber {
    1: string phoneNumber;
    2: string countryCode;
}

struct UserProfile {
    1: string displayName;
    2: string profileImageUrl;
}

struct VerifyPhoneResponse {
    2: bool accountExist;
    3: bool sameUdidFromAccount;
    11: UserProfile userProfile;
}

struct VerifyAccountUsingPwdResponse {
    2: UserProfile userProfile;
}

enum EncryptionKeyVersion {
    UNKNOWN = 0,
    V1 = 1
}

struct EncryptedPassword {
    1: EncryptionKeyVersion encryptionKeyVersion;
    2: string cipherText;
}

struct ValidateProfileResponse {

}

struct GetUserProfileResponse {
    1: UserProfile userProfile;
}

struct WebAuthDetails {
    1: string baseUrl;
    2: string token;
}

struct IssueWebAuthDetailsForAcctVerifResponse {
    1: WebAuthDetails webAuthDetails;
}

struct IssueWebAuthDetailsForSecondAuthResponse {
    1: WebAuthDetails webAuthDetails;
}

struct ExchangeEncryptionKeyResponse {
    1: string publicKey;
    2: string nonce;
}

struct ExchangeEncryptionKeyRequest {
    1: EncryptionKeyVersion authKeyVersion;
    2: string publicKey;
    3: string nonce;
}

struct SetPasswordResponse {

}

struct SendPinCodeForPhoneResponse {
    1: list<PhoneVerifMethod> availableMethods;
}

enum SecondAuthMethod {
    UNKNOWN = 0,
    SKIP = 1,
    WEB_BASED = 2
}

struct GetSecondAuthMethodResponse {
    1: SecondAuthMethod secondAuthMethod;
}

service PrimaryAccountInitService {
    // SECTION PrimaryAccountInitService

    string openSession(
        1: OpenSessionRequest request,
    ) throws(1: AuthException e);

    GetAcctVerifMethodResponse getAcctVerifMethod(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier,
    ) throws(1: AuthException e);


    // SECTION RegisterViewModel

    RegisterPrimaryResponse registerPrimaryUsingPhone(
        2: string authSessionId,
    ) throws(1: AuthException e);

    MigratePrimaryResponse migratePrimaryUsingPhone(
        1: string authSessionId,
    ) throws(1: AuthException e);

    GetPhoneVerifMethodResponse getPhoneVerifMethod(
        1: string authSessionId,
        2: Device device,
        3: UserPhoneNumber userPhoneNumber,
    ) throws(1: AuthException e);

    VerifyPhoneResponse verifyPhone(
        1: string authSessionId,
        2: Device device,
        3: UserPhoneNumber userPhoneNumber,
        4: string pinCode,
    ) throws(1: AuthException e);

    VerifyAccountUsingPwdResponse verifyAccountUsingPwd(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier,
        3: EncryptedPassword encryptedPassword,
    ) throws(1: AuthException e);

    ValidateProfileResponse validateProfile(
        1: string authSessionId,
        2: string displayName,
    ) throws(1: AuthException e);

    GetUserProfileResponse getUserProfile(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier,
    ) throws(1: AuthException e);

    IssueWebAuthDetailsForAcctVerifResponse issueWebAuthDetailsForAcctVerif(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier,
    ) throws(1: AuthException e);

    IssueWebAuthDetailsForSecondAuthResponse issueWebAuthDetailsForSecondAuth(
        1: string authSessionId,
    ) throws(1: AuthException e);


    // SECTION PrimaryLoginSession

    ExchangeEncryptionKeyResponse exchangeEncryptionKey(
        1: string authSessionId,
        2: ExchangeEncryptionKeyRequest request,
    ) throws(1: AuthException e);

    SetPasswordResponse setPassword(
        1: string authSessionId,
        2: EncryptedPassword encryptedPassword,
    ) throws(1: AuthException e);

    SendPinCodeForPhoneResponse sendPinCodeForPhone(
        1: string authSessionId,
        2: Device device,
        3: UserPhoneNumber userPhoneNumber,
        4: PhoneVerifMethod verifMethod,
    ) throws(1: AuthException e);

    GetSecondAuthMethodResponse getSecondAuthMethod(
        1: string authSessionId,
    ) throws(1: AuthException e);
}
