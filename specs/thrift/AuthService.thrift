include "TalkService.thrift"

enum LoginResultType {
    SUCCESS = 1,
    REQUIRE_QRCODE = 2,
    REQUIRE_DEVICE_CONFIRM = 3,
    REQUIRE_SMS_CONFIRM = 4
}

struct TokenIssueResult {
    1: string accessToken;
    2: string refreshToken;
    3: string appId;
}

struct LoginResult {
    1: string authToken;
    2: string certificate;
    3: string verifier;
    4: string pinCode;
    5: LoginResultType type;
    6: i64 lastPrimaryBindTime; // Timestamp
    7: string displayMessage;
    8: TalkService.VerificationSessionData sessionForSMSConfirm;
    9: TokenIssueResult tokenIssueResult;
}

enum LoginType {
    ID_CREDENTIAL = 0,
    QRCODE = 1,
    ID_CREDENTIAL_WITH_E2EE = 2
}

struct LoginRequest {
    11: i32 e2eeVersion;
    1: LoginType type;
    2: TalkService.IdentityProvider identityProvider;
    3: string identifier;
    4: string password;
    5: bool keepLoggedIn;
    6: string accessLocation;
    7: string systemName;
    8: string certificate;
    9: string verifier;
    10: string secret;
}

struct AuthSessionRequest {
    1: map<string, string> metaData;
}

enum IdentityCredentialResponseType {
    UNKNOWN = 0,
    SUCCESS = 1,
    REQUIRE_SERVER_SIDE_EMAIL = 2,
    REQUIRE_CLIENT_SIDE_EMAIL = 3
}

struct IdentityCredentialResponse {
    1: map<string, string> metaData;
    2: IdentityCredentialResponseType responseType;
    3: string confirmationVerifier;
    4: i64 timeoutInSeconds;
}

struct IdentifierConfirmationRequest {
    1: map<string, string> metaData;
    2: bool forceRegistration;
    3: string verificationCode;
}

struct IdentityCredentialRequest {
    1: map<string, string> metaData;
    2: TalkService.IdentityProvider identityProvider;
    3: string cipherKeyId;
    4: string cipherText;
    5: IdentifierConfirmationRequest confirmationRequest;
}

struct SecurityCenterResult {
    1: string uri;
    2: string token;
    3: string cookiePath;
    4: bool skip;
}

struct SetPasswordResponse {

}

enum EncryptionKeyVersion {
    UNKNOWN = 0,
    V1 = 1
}

struct EncryptedPassword {
    1: EncryptionKeyVersion encryptionKeyVersion;
    2: string cipherText;
}

service AuthService {
    // SECTION AuthService

    LoginResult loginZ(
        2: LoginRequest loginRequest,
    ) throws(1: TalkService.TalkException e);

    string confirmE2EELogin(
        1: string verifier,
        2: string deviceSecret,
    ) throws(1: TalkService.TalkException e);

    void respondE2EELoginRequest(
        1: string verifier,
        2: TalkService.E2EEPublicKey publicKey,
        3: string encryptedKeyChain,
        4: string hashKeyChain,
        5: TalkService.ErrorCode errorCode,
    ) throws(1: TalkService.TalkException e);

    string openAuthSession(
        2: AuthSessionRequest request,
    ) throws(1: TalkService.TalkException e);

    IdentityCredentialResponse updatePassword(
        2: string authSessionId,
        3: IdentityCredentialRequest request,
    ) throws(1: TalkService.TalkException e);


    // SECTION SecondaryLoginViewModel

    void logoutZ() throws(1: TalkService.TalkException e);

    string verifyQrcodeWithE2EE(
        2: string verifier,
        3: string pinCode,
        4: TalkService.ErrorCode errorCode,
        5: TalkService.E2EEPublicKey publicKey,
        6: string encryptedKeyChain,
        7: string hashKeyChain,
    ) throws(1: TalkService.TalkException e);


    // SECTION UpdateAccountSession

    TalkService.RSAKey getAuthRSAKey(
        2: string authSessionId,
        3: TalkService.IdentityProvider identityProvider,
    ) throws(1: TalkService.TalkException e);


    // SECTION SettingsViewModel

    SecurityCenterResult issueTokenForAccountMigrationSettings(
        2: bool enforce,
    ) throws(1: TalkService.TalkException e);

    SetPasswordResponse setPassword(
        1: string authSessionId,
        2: EncryptedPassword encryptedPassword,
    ) throws(1: TalkService.TalkException e);

    IdentityCredentialResponse confirmIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request,
    ) throws(1: TalkService.TalkException e);

    IdentityCredentialResponse setIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request,
    ) throws(1: TalkService.TalkException e);

    IdentityCredentialResponse setIdentifierAndPassword(
        2: string authSessionId,
        3: IdentityCredentialRequest request,
    ) throws(1: TalkService.TalkException e);

    IdentityCredentialResponse updateIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request,
    ) throws(1: TalkService.TalkException e);

    IdentityCredentialResponse resendIdentifierConfirmation(
        2: string authSessionId,
        3: IdentityCredentialRequest request,
    ) throws(1: TalkService.TalkException e);

    IdentityCredentialResponse removeIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request,
    ) throws(1: TalkService.TalkException e);
}
