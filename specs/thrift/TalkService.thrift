enum ErrorCode {
    ILLEGAL_ARGUMENT = 0,
    AUTHENTICATION_FAILED = 1,
    DB_FAILED = 2,
    INVALID_STATE = 3,
    EXCESSIVE_ACCESS = 4,
    NOT_FOUND = 5,
    INVALID_MID = 9,
    NOT_A_MEMBER = 10,
    INVALID_LENGTH = 6,
    NOT_AVAILABLE_USER = 7,
    NOT_AUTHORIZED_DEVICE = 8,
    NOT_AUTHORIZED_SESSION = 14,
    INCOMPATIBLE_APP_VERSION = 11,
    NOT_READY = 12,
    NOT_AVAILABLE_SESSION = 13,
    SYSTEM_ERROR = 15,
    NO_AVAILABLE_VERIFICATION_METHOD = 16,
    NOT_AUTHENTICATED = 17,
    INVALID_IDENTITY_CREDENTIAL = 18,
    NOT_AVAILABLE_IDENTITY_IDENTIFIER = 19,
    INTERNAL_ERROR = 20,
    NO_SUCH_IDENTITY_IDENFIER = 21,
    DEACTIVATED_ACCOUNT_BOUND_TO_THIS_IDENTITY = 22,
    ILLEGAL_IDENTITY_CREDENTIAL = 23,
    UNKNOWN_CHANNEL = 24,
    NO_SUCH_MESSAGE_BOX = 25,
    NOT_AVAILABLE_MESSAGE_BOX = 26,
    CHANNEL_DOES_NOT_MATCH = 27,
    NOT_YOUR_MESSAGE = 28,
    MESSAGE_DEFINED_ERROR = 29,
    USER_CANNOT_ACCEPT_PRESENTS = 30,
    USER_NOT_STICKER_OWNER = 32,
    MAINTENANCE_ERROR = 33,
    ACCOUNT_NOT_MATCHED = 34,
    ABUSE_BLOCK = 35,
    NOT_FRIEND = 36,
    NOT_ALLOWED_CALL = 37,
    BLOCK_FRIEND = 38,
    INCOMPATIBLE_VOIP_VERSION = 39,
    INVALID_SNS_ACCESS_TOKEN = 40,
    EXTERNAL_SERVICE_NOT_AVAILABLE = 41,
    NOT_ALLOWED_ADD_CONTACT = 42,
    NOT_CERTIFICATED = 43,
    NOT_ALLOWED_SECONDARY_DEVICE = 44,
    INVALID_PIN_CODE = 45,
    NOT_FOUND_IDENTITY_CREDENTIAL = 46,
    EXCEED_FILE_MAX_SIZE = 47,
    EXCEED_DAILY_QUOTA = 48,
    NOT_SUPPORT_SEND_FILE = 49,
    MUST_UPGRADE = 50,
    NOT_AVAILABLE_PIN_CODE_SESSION = 51,
    EXPIRED_REVISION = 52,
    NOT_YET_PHONE_NUMBER = 54,
    BAD_CALL_NUMBER = 55,
    UNAVAILABLE_CALL_NUMBER = 56,
    NOT_SUPPORT_CALL_SERVICE = 57,
    CONGESTION_CONTROL = 58,
    NO_BALANCE = 59,
    NOT_PERMITTED_CALLER_ID = 60,
    NO_CALLER_ID_LIMIT_EXCEEDED = 61,
    CALLER_ID_VERIFICATION_REQUIRED = 62,
    NO_CALLER_ID_LIMIT_EXCEEDED_AND_VERIFICATION_REQUIRED = 63,
    MESSAGE_NOT_FOUND = 64,
    INVALID_ACCOUNT_MIGRATION_PINCODE_FORMAT = 65,
    ACCOUNT_MIGRATION_PINCODE_NOT_MATCHED = 66,
    ACCOUNT_MIGRATION_PINCODE_BLOCKED = 67,
    INVALID_PASSWORD_FORMAT = 69,
    FEATURE_RESTRICTED = 70,
    MESSAGE_NOT_DESTRUCTIBLE = 71,
    PAID_CALL_REDEEM_FAILED = 72,
    PREVENTED_JOIN_BY_TICKET = 73,
    SEND_MESSAGE_NOT_PERMITTED_FROM_LINE_AT = 75,
    SEND_MESSAGE_NOT_PERMITTED_WHILE_AUTO_REPLY = 76,
    SECURITY_CENTER_NOT_VERIFIED = 77,
    SECURITY_CENTER_BLOCKED_BY_SETTING = 78,
    SECURITY_CENTER_BLOCKED = 79,
    TALK_PROXY_EXCEPTION = 80,
    E2EE_INVALID_PROTOCOL = 81,
    E2EE_RETRY_ENCRYPT = 82,
    E2EE_UPDATE_SENDER_KEY = 83,
    E2EE_UPDATE_RECEIVER_KEY = 84,
    E2EE_INVALID_ARGUMENT = 85,
    E2EE_INVALID_VERSION = 86,
    E2EE_SENDER_DISABLED = 87,
    E2EE_RECEIVER_DISABLED = 88,
    E2EE_SENDER_NOT_ALLOWED = 89,
    E2EE_RECEIVER_NOT_ALLOWED = 90,
    E2EE_RESEND_FAIL = 91,
    E2EE_RESEND_OK = 92,
    HITOKOTO_BACKUP_NO_AVAILABLE_DATA = 93,
    E2EE_UPDATE_PRIMARY_DEVICE = 94,
    SUCCESS = 95,
    CANCEL = 96,
    E2EE_PRIMARY_NOT_SUPPORT = 97,
    E2EE_RETRY_PLAIN = 98,
    E2EE_RECREATE_GROUP_KEY = 99,
    E2EE_GROUP_TOO_MANY_MEMBERS = 100,
    SERVER_BUSY = 101,
    NOT_ALLOWED_ADD_FOLLOW = 102,
    INCOMING_FRIEND_REQUEST_LIMIT = 103,
    OUTGOING_FRIEND_REQUEST_LIMIT = 104,
    OUTGOING_FRIEND_REQUEST_QUOTA = 105,
    DUPLICATED = 106,
    BANNED = 107,
    NOT_AN_INVITEE = 108,
    NOT_AN_OUTSIDER = 109,
    EMPTY_GROUP = 111,
    EXCEED_FOLLOW_LIMIT = 112,
    UNSUPPORTED_ACCOUNT_TYPE = 113
}

exception TalkException {
    1: ErrorCode code;
    2: string reason;
    3: map<string, string> parameterMap;
}

struct Ticket {
    1: string id;
    10: i64 expirationTime; // Timestamp
    21: i32 maxUseCount;
}

enum ProfileAttribute {
    ALL = 511,
    EMAIL = 1,
    DISPLAY_NAME = 2,
    PHONETIC_NAME = 4,
    PICTURE = 8,
    STATUS_MESSAGE = 16,
    ALLOW_SEARCH_BY_USERID = 32,
    ALLOW_SEARCH_BY_EMAIL = 64,
    BUDDY_STATUS = 128,
    MUSIC_PROFILE = 256,
    AVATAR_PROFILE = 512
}

enum SettingsAttributeEx {
    NOTIFICATION_ENABLE = 0,
    NOTIFICATION_MUTE_EXPIRATION = 1,
    NOTIFICATION_NEW_MESSAGE = 2,
    NOTIFICATION_GROUP_INVITATION = 3,
    NOTIFICATION_SHOW_MESSAGE = 4,
    NOTIFICATION_INCOMING_CALL = 5,
    NOTIFICATION_SOUND_MESSAGE = 8,
    NOTIFICATION_SOUND_GROUP = 9,
    NOTIFICATION_DISABLED_WITH_SUB = 16,
    NOTIFICATION_PAYMENT = 17,
    NOTIFICATION_MENTION = 40,
    NOTIFICATION_THUMBNAIL = 45,
    PRIVACY_SYNC_CONTACTS = 6,
    PRIVACY_SEARCH_BY_PHONE_NUMBER = 7,
    PRIVACY_SEARCH_BY_USERID = 13,
    PRIVACY_SEARCH_BY_EMAIL = 14,
    PRIVACY_SHARE_PERSONAL_INFO_TO_FRIENDS = 51,
    PRIVACY_ALLOW_SECONDARY_DEVICE_LOGIN = 21,
    PRIVACY_PROFILE_IMAGE_POST_TO_MYHOME = 23,
    PRIVACY_PROFILE_MUSIC_POST_TO_MYHOME = 35,
    PRIVACY_PROFILE_HISTORY = 57,
    PRIVACY_STATUS_MESSAGE_HISTORY = 54,
    PRIVACY_ALLOW_FRIEND_REQUEST = 30,
    PRIVACY_RECV_MESSAGES_FROM_NOT_FRIEND = 25,
    PRIVACY_AGREE_USE_LINECOIN_TO_PAIDCALL = 26,
    PRIVACY_AGREE_USE_PAIDCALL = 27,
    PRIVACY_AGE_RESULT = 60,
    PRIVACY_AGE_RESULT_RECEIVED = 61,
    PRIVACY_ALLOW_FOLLOW = 63,
    PRIVACY_SHOW_FOLLOW_LIST = 64,
    CONTACT_MY_TICKET = 10,
    IDENTITY_PROVIDER = 11,
    IDENTITY_IDENTIFIER = 12,
    SNS_ACCOUNT = 19,
    PHONE_REGISTRATION = 20,
    PREFERENCE_LOCALE = 15,
    CUSTOM_MODE = 22,
    EMAIL_CONFIRMATION_STATUS = 24,
    ACCOUNT_MIGRATION_PINCODE = 28,
    ENFORCED_INPUT_ACCOUNT_MIGRATION_PINCODE = 29,
    SECURITY_CENTER_SETTINGS = 18,
    E2EE_ENABLE = 33,
    HITOKOTO_BACKUP_REQUESTED = 34,
    CONTACT_ALLOW_FOLLOWING = 36,
    PRIVACY_ALLOW_NEARBY = 37,
    AGREEMENT_NEARBY = 38,
    AGREEMENT_SQUARE = 39,
    ALLOW_UNREGISTRATION_SECONDARY_DEVICE = 41,
    AGREEMENT_BOT_USE = 42,
    AGREEMENT_SHAKE_FUNCTION = 43,
    AGREEMENT_MOBILE_CONTACT_NAME = 44,
    AGREEMENT_SOUND_TO_TEXT = 46,
    AGREEMENT_PRIVACY_POLICY_VERSION = 47,
    AGREEMENT_AD_BY_WEB_ACCESS = 48,
    AGREEMENT_PHONE_NUMBER_MATCHING = 49,
    AGREEMENT_COMMUNICATION_INFO = 50,
    AGREEMENT_THINGS_WIRELESS_COMMUNICATION = 52,
    AGREEMENT_GDPR = 53,
    AGREEMENT_PROVIDE_LOCATION = 55,
    AGREEMENT_BEACON = 56,
    AGREEMENT_CONTENTS_SUGGEST = 58,
    AGREEMENT_CONTENTS_SUGGEST_DATA_COLLECTION = 59,
    AGREEMENT_OCR_IMAGE_COLLECTION = 62
}

enum SyncReason {
    UNSPECIFIED = 0,
    UNKNOWN = 1,
    INITIALIZATION = 2,
    OPERATION = 3,
    FULL_SYNC = 4,
    AUTO_REPAIR = 5,
    MANUAL_REPAIR = 6,
    INTERNAL = 7
}

enum ContactType {
    MID = 0,
    PHONE = 1,
    EMAIL = 2,
    USERID = 3,
    PROXIMITY = 4,
    GROUP = 5,
    USER = 6,
    QRCODE = 7,
    PROMOTION_BOT = 8,
    CONTACT_MESSAGE = 9,
    FRIEND_REQUEST = 10,
    REPAIR = 128,
    FACEBOOK = 2305,
    SINA = 2306,
    RENREN = 2307,
    FEIXIN = 2308,
    BBM = 2309,
    BEACON = 11
}

enum ContactStatus {
    UNSPECIFIED = 0,
    FRIEND = 1,
    FRIEND_BLOCKED = 2,
    RECOMMEND = 3,
    RECOMMEND_BLOCKED = 4,
    DELETED = 5,
    DELETED_BLOCKED = 6
}

enum ContactRelation {
    ONEWAY = 0,
    BOTH = 1,
    NOT_REGISTERED = 2
}

enum FriendRequestStatus {
    NONE = 0,
    AVAILABLE = 1,
    ALREADY_REQUESTED = 2,
    UNAVAILABLE = 3
}

struct AvatarProfile {
    1: string version;
    2: i64 updatedMillis; // Timestamp
}

struct Contact {
    1: string mid; // MID
    2: i64 createdTime; // Timestamp
    10: ContactType type;
    11: ContactStatus status;
    21: ContactRelation relation;
    22: string displayName;
    23: string phoneticName;
    24: string pictureStatus;
    25: string thumbnailUrl;
    26: string statusMessage;
    27: string displayNameOverridden;
    28: i64 favoriteTime;
    31: bool capableVoiceCall;
    32: bool capableVideoCall;
    33: bool capableMyhome;
    34: bool capableBuddy;
    35: i32 attributes;
    36: i64 settings;
    37: string picturePath;
    38: string recommendParams;
    39: FriendRequestStatus friendRequestStatus;
    40: string musicProfile;
    42: string videoProfile;
    43: map<string, string> statusMessageContentMetadata;
    44: AvatarProfile avatarProfile;
}

enum OpType {
    END_OF_OPERATION = 0,
    UPDATE_PROFILE = 1,
    UPDATE_SETTINGS = 36,
    NOTIFIED_UPDATE_PROFILE = 2,
    REGISTER_USERID = 3,
    ADD_CONTACT = 4,
    NOTIFIED_ADD_CONTACT = 5,
    BLOCK_CONTACT = 6,
    UNBLOCK_CONTACT = 7,
    NOTIFIED_RECOMMEND_CONTACT = 8,
    CREATE_GROUP = 9,
    UPDATE_GROUP = 10,
    NOTIFIED_UPDATE_GROUP = 11,
    INVITE_INTO_GROUP = 12,
    NOTIFIED_INVITE_INTO_GROUP = 13,
    CANCEL_INVITATION_GROUP = 31,
    NOTIFIED_CANCEL_INVITATION_GROUP = 32,
    LEAVE_GROUP = 14,
    NOTIFIED_LEAVE_GROUP = 15,
    ACCEPT_GROUP_INVITATION = 16,
    NOTIFIED_ACCEPT_GROUP_INVITATION = 17,
    REJECT_GROUP_INVITATION = 34,
    NOTIFIED_REJECT_GROUP_INVITATION = 35,
    KICKOUT_FROM_GROUP = 18,
    NOTIFIED_KICKOUT_FROM_GROUP = 19,
    CREATE_ROOM = 20,
    INVITE_INTO_ROOM = 21,
    NOTIFIED_INVITE_INTO_ROOM = 22,
    LEAVE_ROOM = 23,
    NOTIFIED_LEAVE_ROOM = 24,
    SEND_MESSAGE = 25,
    RECEIVE_MESSAGE = 26,
    SEND_MESSAGE_RECEIPT = 27,
    RECEIVE_MESSAGE_RECEIPT = 28,
    SEND_CONTENT_RECEIPT = 29,
    SEND_CHAT_CHECKED = 40,
    SEND_CHAT_REMOVED = 41,
    RECEIVE_ANNOUNCEMENT = 30,
    INVITE_VIA_EMAIL = 38,
    NOTIFIED_REGISTER_USER = 37,
    NOTIFIED_UNREGISTER_USER = 33,
    NOTIFIED_REQUEST_RECOVERY = 39,
    NOTIFIED_FORCE_SYNC = 42,
    SEND_CONTENT = 43,
    SEND_MESSAGE_MYHOME = 44,
    NOTIFIED_UPDATE_CONTENT_PREVIEW = 45,
    REMOVE_ALL_MESSAGES = 46,
    NOTIFIED_UPDATE_PURCHASES = 47,
    DUMMY = 48,
    UPDATE_CONTACT = 49,
    NOTIFIED_RECEIVED_CALL = 50,
    CANCEL_CALL = 51,
    NOTIFIED_REDIRECT = 52,
    NOTIFIED_CHANNEL_SYNC = 53,
    FAILED_SEND_MESSAGE = 54,
    NOTIFIED_READ_MESSAGE = 55,
    FAILED_EMAIL_CONFIRMATION = 56,
    NOTIFIED_PUSH_NOTICENTER_ITEM = 59,
    NOTIFIED_CHAT_CONTENT = 58,
    NOTIFIED_JOIN_CHAT = 60,
    NOTIFIED_LEAVE_CHAT = 61,
    NOTIFIED_TYPING = 62,
    FRIEND_REQUEST_ACCEPTED = 63,
    DESTROY_MESSAGE = 64,
    NOTIFIED_DESTROY_MESSAGE = 65,
    UPDATE_PUBLICKEYCHAIN = 66,
    NOTIFIED_UPDATE_PUBLICKEYCHAIN = 67,
    NOTIFIED_BLOCK_CONTACT = 68,
    NOTIFIED_UNBLOCK_CONTACT = 69,
    UPDATE_GROUPPREFERENCE = 70,
    NOTIFIED_PAYMENT_EVENT = 71,
    REGISTER_E2EE_PUBLICKEY = 72,
    NOTIFIED_E2EE_KEY_EXCHANGE_REQ = 73,
    NOTIFIED_E2EE_KEY_EXCHANGE_RESP = 74,
    NOTIFIED_E2EE_MESSAGE_RESEND_REQ = 75,
    NOTIFIED_E2EE_MESSAGE_RESEND_RESP = 76,
    NOTIFIED_E2EE_KEY_UPDATE = 77,
    NOTIFIED_BUDDY_UPDATE_PROFILE = 78,
    NOTIFIED_UPDATE_LINEAT_TABS = 79,
    UPDATE_ROOM = 80,
    NOTIFIED_BEACON_DETECTED = 81,
    UPDATE_EXTENDED_PROFILE = 82,
    ADD_FOLLOW = 83,
    NOTIFIED_ADD_FOLLOW = 84,
    DELETE_FOLLOW = 85,
    NOTIFIED_DELETE_FOLLOW = 86,
    UPDATE_TIMELINE_SETTINGS = 87,
    NOTIFIED_FRIEND_REQUEST = 88,
    UPDATE_RINGBACK_TONE = 89,
    NOTIFIED_POSTBACK = 90,
    RECEIVE_READ_WATERMARK = 91,
    NOTIFIED_MESSAGE_DELIVERED = 92,
    NOTIFIED_UPDATE_CHAT_BAR = 93,
    NOTIFIED_CHATAPP_INSTALLED = 94,
    NOTIFIED_CHATAPP_UPDATED = 95,
    NOTIFIED_CHATAPP_NEW_MARK = 96,
    NOTIFIED_CHATAPP_DELETED = 97,
    NOTIFIED_CHATAPP_SYNC = 98,
    NOTIFIED_UPDATE_MESSAGE = 99,
    UPDATE_CHATROOMBGM = 100,
    NOTIFIED_UPDATE_CHATROOMBGM = 101,
    UPDATE_RINGTONE = 102,
    UPDATE_USER_SETTINGS = 118,
    NOTIFIED_UPDATE_STATUS_BAR = 119,
    CREATE_CHAT = 120,
    UPDATE_CHAT = 121,
    NOTIFIED_UPDATE_CHAT = 122,
    INVITE_INTO_CHAT = 123,
    NOTIFIED_INVITE_INTO_CHAT = 124,
    CANCEL_CHAT_INVITATION = 125,
    NOTIFIED_CANCEL_CHAT_INVITATION = 126,
    DELETE_SELF_FROM_CHAT = 127,
    NOTIFIED_DELETE_SELF_FROM_CHAT = 128,
    ACCEPT_CHAT_INVITATION = 129,
    NOTIFIED_ACCEPT_CHAT_INVITATION = 130,
    REJECT_CHAT_INVITATION = 131,
    DELETE_OTHER_FROM_CHAT = 132,
    NOTIFIED_DELETE_OTHER_FROM_CHAT = 133
}

enum OpStatus {
    NORMAL = 0,
    ALERT_DISABLED = 1,
    ALWAYS = 2
}

enum MIDType {
    USER = 0,
    ROOM = 1,
    GROUP = 2,
    SQUARE = 3,
    SQUARE_CHAT = 4,
    SQUARE_MEMBER = 5,
    BOT = 6
}

enum PlaceSearchProvider {
    GOOGLE = 0,
    BAIDU = 1,
    FOURSQUARE = 2
}

struct GeolocationAccuracy {
    1: double radiusMeters;
    2: double radiusConfidence;
}

struct Location {
    1: string title;
    2: string address;
    3: double latitude;
    4: double longitude;
    5: string phone;
    6: string categoryId;
    7: PlaceSearchProvider provider;
    8: GeolocationAccuracy accuracy;
}

enum ContentType {
    NONE = 0,
    IMAGE = 1,
    VIDEO = 2,
    AUDIO = 3,
    HTML = 4,
    PDF = 5,
    CALL = 6,
    STICKER = 7,
    PRESENCE = 8,
    GIFT = 9,
    GROUPBOARD = 10,
    APPLINK = 11,
    LINK = 12,
    CONTACT = 13,
    FILE = 14,
    LOCATION = 15,
    POSTNOTIFICATION = 16,
    RICH = 17,
    CHATEVENT = 18,
    MUSIC = 19,
    PAYMENT = 20,
    EXTIMAGE = 21,
    FLEX = 22
}

enum MessageRelationType {
    FORWARD = 0,
    AUTO_REPLY = 1,
    SUBORDINATE = 2,
    REPLY = 3
}

enum ServiceCode {
    UNKNOWN = 0,
    TALK = 1,
    SQUARE = 2
}

enum AppExtensionType {
    SIRI = 1,
    GOOGLE_ASSISTANT = 2,
    OS_SHARE = 3
}

struct Message {
    3: MIDType toType;
    4: string id;
    5: i64 createdTime; // Timestamp
    6: i64 deliveredTime; // Timestamp
    10: string text;
    11: optional Location location;
    14: bool hasContent;
    15: ContentType contentType;
    18: map<string, string> contentMetadata;
    17: string contentPreview;
    19: i8 sessionId;
    20: list<string> chunks;
    21: optional string relatedMessageId;
    22: MessageRelationType messageRelationType;
    23: i32 readCount;
    24: ServiceCode relatedMessageServiceCode;
    25: AppExtensionType appExtensionType;
    1: string _from; // MID
    2: string to; // MID
}

struct Operation {
    1: i64 revision; // OpRevision
    2: i64 createdTime; // Timestamp
    3: OpType type;
    4: i64 reqSeq; // RequestSequence
    5: string checksum;
    7: OpStatus status;
    10: string param1;
    11: string param2;
    12: string param3;
    20: Message message;
}

struct Room {
    1: string mid; // MID
    2: i64 createdTime; // Timestamp
    10: list<Contact> contacts;
    31: bool notificationDisabled;
    40: list<string> memberMids; // MID
}

struct UpdateChatResponse {

}

enum ChatAttribute {
    NAME = 1,
    PICTURE_STATUS = 2,
    PREVENTED_JOIN_BY_TICKET = 4,
    NOTIFICATION_SETTING = 8,
    INVITATION_TICKET = 16,
    FAVORITE_TIMESTAMP = 32,
    CHAT_TYPE = 64
}

enum ChatType {
    GROUP = 0,
    ROOM = 1,
    PEER = 2
}

struct GroupExtra {
    1: string creator; // MID
    2: bool preventedJoinByTicket;
    3: string invitationTicket;
    4: map<string, i64> memberMids; // MID, Timestamp
    5: map<string, i64> inviteeMids; // MID, Timestamp
}

struct PeerExtra {

}

struct Extra {
    1: GroupExtra groupExtra;
    2: PeerExtra peerExtra;
}

struct Chat {
    1: ChatType type;
    2: string chatMid; // MID
    3: i64 createdTime; // Timestamp
    4: bool notificationDisabled;
    5: i64 favoriteTimestamp; // Timestamp
    6: string chatName;
    7: string picturePath;
    8: Extra extra;
}

struct UpdateChatRequest {
    1: i32 reqSeq; // RequestSequence
    2: Chat chat;
    3: ChatAttribute updatedAttribute;
}

struct GetChatsResponse {
    1: list<Chat> chats;
}

struct GetChatsRequest {
    1: list<string> chatMids;
    2: bool withMembers;
    3: bool withInvitees;
}

struct ReissueChatTicketRequest {
    1: i32 reqSeq;
    2: string groupMid;
}

struct ReissueChatTicketResponse {
    1: string ticketId;
}

struct E2EEPublicKey {
    1: i32 version;
    2: i32 keyId;
    4: string keyData;
    5: i64 createdTime; // Timestamp
}

struct E2EEGroupSharedKey {
    1: i32 keyVersion;
    2: i32 groupKeyId;
    3: string creator; // MID
    4: i32 creatorKeyId;
    5: string receiver; // MID
    6: i32 receiverKeyId;
    7: string encryptedSharedKey;
    8: set<ContentType> allowedTypes;
    9: i32 specVersion;
}

struct Configurations {
    1: i64 revision;
    2: map<string, string> configMap;
}

enum IdentityProvider {
    UNKNOWN = 0,
    LINE = 1,
    NAVER_KR = 2,
    LINE_PHONE = 3
}

enum CountryGroup {
    UNKNOWN = 0,
    EUROPEAN_ECONOMIC_AREA = 1
}

struct Profile {
    11: string email;
    20: string displayName;
    21: string phoneticName;
    22: string pictureStatus;
    23: string thumbnailUrl;
    24: string statusMessage;
    31: bool allowSearchByUserid;
    32: bool allowSearchByEmail;
    33: string picturePath;
    34: string musicProfile;
    35: string videoProfile;
    36: map<string, string> statusMessageContentMetadata;
    37: AvatarProfile avatarProfile;
    1: string mid; // MID
    3: string userid;
    12: string regionCode;
    10: string phone;
}

enum VerificationMethod {
    NO_AVAILABLE = 0,
    PIN_VIA_SMS = 1,
    CALLERID_INDIGO = 2,
    PIN_VIA_TTS = 4,
    SKIP = 10
}

struct VerificationSessionData {
    1: string sessionId;
    2: VerificationMethod method;
    3: string callback;
    4: string normalizedPhone;
    5: string countryCode;
    6: string nationalSignificantNumber;
    7: list<VerificationMethod> availableVerificationMethods;
    8: string callerIdMask;
}

enum CarrierCode {
    NOT_SPECIFIED = 0,
    JP_DOCOMO = 1,
    JP_AU = 2,
    JP_SOFTBANK = 3,
    KR_SKT = 17,
    KR_KT = 18,
    KR_LGT = 19,
    JP_DOCOMO_LINE = 4,
    JP_SOFTBANK_LINE = 5,
    JP_AU_LINE = 6
}

enum ApplicationType {
    IOS = 16,
    IOS_RC = 17,
    IOS_BETA = 18,
    IOS_ALPHA = 19,
    ANDROID = 32,
    ANDROID_RC = 33,
    ANDROID_BETA = 34,
    ANDROID_ALPHA = 35,
    WAP = 48,
    WAP_RC = 49,
    WAP_BETA = 50,
    WAP_ALPHA = 51,
    BOT = 64,
    BOT_RC = 65,
    BOT_BETA = 66,
    BOT_ALPHA = 67,
    WEB = 80,
    WEB_RC = 81,
    WEB_BETA = 82,
    WEB_ALPHA = 83,
    DESKTOPWIN = 96,
    DESKTOPWIN_RC = 97,
    DESKTOPWIN_BETA = 98,
    DESKTOPWIN_ALPHA = 99,
    DESKTOPMAC = 112,
    DESKTOPMAC_RC = 113,
    DESKTOPMAC_BETA = 114,
    DESKTOPMAC_ALPHA = 115,
    CHANNELGW = 128,
    CHANNELGW_RC = 129,
    CHANNELGW_BETA = 130,
    CHANNELGW_ALPHA = 131,
    CHANNELCP = 144,
    CHANNELCP_RC = 145,
    CHANNELCP_BETA = 146,
    CHANNELCP_ALPHA = 147,
    WINPHONE = 160,
    WINPHONE_RC = 161,
    WINPHONE_BETA = 162,
    WINPHONE_ALPHA = 163,
    BLACKBERRY = 176,
    BLACKBERRY_RC = 177,
    BLACKBERRY_BETA = 178,
    BLACKBERRY_ALPHA = 179,
    WINMETRO = 192,
    WINMETRO_RC = 193,
    WINMETRO_BETA = 194,
    WINMETRO_ALPHA = 195,
    S40 = 208,
    S40_RC = 209,
    S40_BETA = 210,
    S40_ALPHA = 211,
    CHRONO = 224,
    CHRONO_RC = 225,
    CHRONO_BETA = 226,
    CHRONO_ALPHA = 227,
    TIZEN = 256,
    TIZEN_RC = 257,
    TIZEN_BETA = 258,
    TIZEN_ALPHA = 259,
    VIRTUAL = 272,
    FIREFOXOS = 288,
    FIREFOXOS_RC = 289,
    FIREFOXOS_BETA = 290,
    FIREFOXOS_ALPHA = 291,
    IOSIPAD = 304,
    IOSIPAD_RC = 305,
    IOSIPAD_BETA = 306,
    IOSIPAD_ALPHA = 307,
    BIZIOS = 320,
    BIZIOS_RC = 321,
    BIZIOS_BETA = 322,
    BIZIOS_ALPHA = 323,
    BIZANDROID = 336,
    BIZANDROID_RC = 337,
    BIZANDROID_BETA = 338,
    BIZANDROID_ALPHA = 339,
    BIZBOT = 352,
    BIZBOT_RC = 353,
    BIZBOT_BETA = 354,
    BIZBOT_ALPHA = 355,
    CHROMEOS = 368,
    CHROMEOS_RC = 369,
    CHROMEOS_BETA = 370,
    CHROMEOS_ALPHA = 371,
    ANDROIDLITE = 384,
    ANDROIDLITE_RC = 385,
    ANDROIDLITE_BETA = 386,
    ANDROIDLITE_ALPHA = 387,
    WIN10 = 400,
    WIN10_RC = 401,
    WIN10_BETA = 402,
    WIN10_ALPHA = 403,
    BIZWEB = 416,
    BIZWEB_RC = 417,
    BIZWEB_BETA = 418,
    BIZWEB_ALPHA = 419,
    DUMMYPRIMARY = 432,
    DUMMYPRIMARY_RC = 433,
    DUMMYPRIMARY_BETA = 434,
    DUMMYPRIMARY_ALPHA = 435,
    SQUARE = 448,
    SQUARE_RC = 449,
    SQUARE_BETA = 450,
    SQUARE_ALPHA = 451,
    INTERNAL = 464,
    INTERNAL_RC = 465,
    INTERNAL_BETA = 466,
    INTERNAL_ALPHA = 467,
    CLOVAFRIENDS = 480,
    CLOVAFRIENDS_RC = 481,
    CLOVAFRIENDS_BETA = 482,
    CLOVAFRIENDS_ALPHA = 483,
    WATCHOS = 496,
    WATCHOS_RC = 497,
    WATCHOS_BETA = 498,
    WATCHOS_ALPHA = 499
}

struct DeviceInfo {
    20: ApplicationType applicationType;
    1: string deviceName;
    2: string systemName;
    3: string systemVersion;
    4: string model;
    10: CarrierCode carrierCode;
    11: string carrierName;
    5: string webViewVersion;
}

struct SIMInfo {
    1: string phoneNumber,
    2: string countryCode,
}

enum VerificationResult {
    FAILED = 0,
    OK_NOT_REGISTERED_YET = 1,
    OK_REGISTERED_WITH_SAME_DEVICE = 2,
    OK_REGISTERED_WITH_ANOTHER_DEVICE = 3
}

enum AccountMigrationCheckType {
    SKIP = 0,
    PINCODE = 1,
    SECURITY_CENTER = 2
}

struct PhoneVerificationResult {
    1: VerificationResult verificationResult;
    2: AccountMigrationCheckType accountMigrationCheckType;
    3: bool recommendAddFriends;
}

enum ProfileHistoryPrivacyType {
    OWNER = 0,
    FRIEND = 1
}

enum StatusMessageHistoryPrivacyType {
    NONE = 1,
    ALL = 2
}

enum PrivacyShareMyProfileType {
    NEVER_SHOW = 0,
    ONE_WAY = 1,
    MUTUAL = 2
}

enum UserAgeType {
    OVER = 1,
    UNDER = 2,
    UNDEFINED = 3
}

enum SnsIdType {
    FACEBOOK = 1,
    SINA = 2,
    RENREN = 3,
    FEIXIN = 4,
    BBM = 5,
    APPLE = 6
}

enum EmailConfirmationStatus {
    NOT_SPECIFIED = 0,
    NOT_YET = 1,
    DONE = 3,
    NEED_ENFORCED_INPUT = 4
}

enum AccountMigrationPincodeType {
    NOT_APPLICABLE = 0,
    NOT_SET = 1,
    SET = 2,
    NEED_ENFORCED_INPUT = 3
}

enum SecurityCenterSettingsType {
    NOT_APPLICABLE = 0,
    NOT_SET = 1,
    SET = 2,
    NEED_ENFORCED_INPUT = 3
}

enum CustomMode {
    PROMOTION_FRIENDS_INVITE = 1,
    CAPABILITY_SERVER_SIDE_SMS = 2,
    LINE_CLIENT_ANALYTICS_CONFIGURATION = 3
}

struct Settings {
    72: bool notificationThumbnail;
    20: bool privacySyncContacts;
    21: bool privacySearchByPhoneNumber;
    22: bool privacySearchByUserid;
    23: bool privacySearchByEmail;
    24: bool privacyAllowSecondaryDeviceLogin;
    25: bool privacyProfileImagePostToMyhome;
    63: bool privacyProfileMusicPostToMyhome;
    85: ProfileHistoryPrivacyType privacyAllowProfileHistory;
    81: StatusMessageHistoryPrivacyType privacyStatusMessageHistory;
    26: bool privacyReceiveMessagesFromNotFriend;
    27: bool privacyAgreeUseLineCoinToPaidCall;
    28: bool privacyAgreeUsePaidCall;
    29: bool privacyAllowFriendRequest;
    65: bool privacyAllowNearby;
    78: PrivacyShareMyProfileType privacySharePersonalInfoToFriends;
    88: UserAgeType privacyAgeResult;
    89: bool privacyAgeResultReceived;
    91: bool privacyAllowFollow;
    92: bool privacyShowFollowList;
    30: string contactMyTicket;
    40: IdentityProvider identityProvider;
    41: string identityIdentifier;
    42: map<SnsIdType, string> snsAccounts;
    43: bool phoneRegistration;
    44: EmailConfirmationStatus emailConfirmationStatus;
    45: AccountMigrationPincodeType accountMigrationPincodeType;
    46: bool enforcedInputAccountMigrationPincode;
    47: SecurityCenterSettingsType securityCenterSettingsType;
    48: bool allowUnregistrationSecondaryDevice;
    50: string preferenceLocale;
    60: CustomMode customModes;
    61: bool e2eeEnable;
    62: bool hitokotoBackupRequested;
    66: i64 agreementNearbyTime; // Timestamp
    67: i64 agreementSquareTime; // Timestamp
    69: i64 botUseAgreementAcceptedAt; // Timestamp
    70: i64 agreementShakeFunction; // Timestamp
    71: i64 agreementMobileContactName; // Timestamp
    73: i64 agreementSoundToText; // Timestamp
    74: string privacyPolicyVersion;
    10: bool notificationEnable;
    75: i64 agreementAdByWebAccess; // Timestamp
    11: i64 notificationMuteExpiration; // Timestamp
    76: i64 agreementPhoneNumberMatching; // Timestamp
    12: bool notificationNewMessage;
    77: i64 agreementCommunicationInfo; // Timestamp
    13: bool notificationGroupInvitation;
    79: i64 agreementThingsWirelessCommunication; // Timestamp
    14: bool notificationShowMessage;
    80: i64 agreementGdpr; // Timestamp
    15: bool notificationIncomingCall;
    82: i64 agreementProvideLocation; // Timestamp
    16: string notificationSoundMessage;
    83: i64 agreementBeacon; // Timestamp
    17: string notificationSoundGroup;
    86: i64 agreementContentsSuggest; // Timestamp
    18: bool notificationDisabledWithSub;
    87: i64 agreementContentsSuggestDataCollection; // Timestamp
    19: bool notificationPayment;
    90: i64 agreementOcrImageCollection; // Timestamp
    68: bool notificationMention;
}

struct ContactRegistration {
    10: string luid;
    11: ContactType contactType;
    12: string contactKey;
    1: Contact contact;
}

enum ModificationType {
    ADD = 0,
    REMOVE = 1,
    MODIFY = 2
}

struct ContactModification {
    1: ModificationType type;
    2: string luid;
    11: list<string> phones;
    12: list<string> emails;
    13: list<string> userids;
    14: string mobileContactName;
    15: string phoneticName;
}

enum ContactSetting {
    CONTACT_SETTING_NOTIFICATION_DISABLE = 1,
    CONTACT_SETTING_DISPLAY_NAME_OVERRIDE = 2,
    CONTACT_SETTING_CONTACT_HIDE = 4,
    CONTACT_SETTING_FAVORITE = 8,
    CONTACT_SETTING_DELETE = 16
}

struct InviteIntoChatResponse {

}

struct InviteIntoChatRequest {
    1: i32 reqSeq; // RequestSequence
    2: string chatMid; // MID
    3: set<string> targetUserMids; // MID
}

struct DeleteSelfFromChatResponse {

}

struct DeleteSelfFromChatRequest {
    1: i32 reqSeq; // RequestSequence
    2: string chatMid; // MID
    3: i64 lastSeenMessageDeliveredTime; //Timestamp
    4: string lastSeenMessageId;
    5: i64 lastMessageDeliveredTime; // Timestamp
    6: string lastMessageId;
}

struct GetAllChatMidsResponse {
    1: set<string> memberChatMids;
    2: set<string> invitedChatMids;
}

struct GetAllChatMidsRequest {
    1: bool withMemberChats;
    2: bool withInvitedChats;
}

struct CreateChatResponse {
    1: Chat chat;
}

struct CreateChatRequest {
    1: i32 reqSeq; // RequestSequence
    2: ChatType type;
    3: string name;
    4: set<string> targetUserMids; // MID
    5: string picturePath;
}

struct AcceptChatInvitationResponse {

}

struct AcceptChatInvitationRequest {
    1: i32 reqSeq; // RequestSequence
    2: string chatMid; // MID
}

struct RejectChatInvitationResponse {

}

struct RejectChatInvitationRequest {
    1: i32 reqSeq; // RequestSequence
    2: string chatMid; // MID
}

struct DeleteOtherFromChatResponse {

}

struct DeleteOtherFromChatRequest {
    1: i32 reqSeq; // RequestSequence
    2: string chatMid; // MID
    3: set<string> targetUserMids; // MID
}

struct CancelChatInvitationResponse {

}

struct CancelChatInvitationRequest {
    1: i32 reqSeq; // RequestSequence
    2: string chatMid; // MID
    3: set<string> targetUserMids; // MID
}

struct LoginSession {
    1: string tokenKey;
    3: i64 expirationTime; // Timestamp
    4: i64 issueTime; // Timestamp
    11: ApplicationType applicationType;
    12: string systemName;
    22: string accessLocation;
}

enum NotificationType {
    APPLE_APNS = 1,
    GOOGLE_C2DM = 2,
    NHN_NNI = 3,
    SKT_AOM = 4,
    MS_MPNS = 5,
    RIM_BIS = 6,
    GOOGLE_GCM = 7,
    NOKIA_NNAPI = 8,
    TIZEN = 9,
    MOZILLA_SIMPLE = 10,
    LINE_BOT = 17,
    LINE_WAP = 18,
    APPLE_APNS_VOIP = 19,
    MS_WNS = 20,
    GOOGLE_FCM = 21,
    CLOVA = 22,
    CLOVA_VOIP = 23,
    HUAWEI_HCM = 24
}

struct RSAKey {
    1: string keynm;
    2: string nvalue;
    3: string evalue;
    4: string sessionKey;
}

struct E2EENegotiationResult {
    1: set<ContentType> allowedTypes;
    2: E2EEPublicKey publicKey;
    3: i32 specVersion;
}

service TalkService {
    // SECTION TalkService

    string unregisterUserAndDevice() throws(1: TalkException e);

    Ticket generateUserTicket(
        3: i64 expirationTime,
        4: i32 maxUseCount,
    ) throws(1: TalkException e);

    void updateProfileAttribute(
        1: i32 reqSeq, // RequestSequence
        2: ProfileAttribute attr,
        3: string value,
    ) throws(1: TalkException e);

    set<SettingsAttributeEx> updateSettingsAttributes2(
        1: i32 reqSeq, // RequestSequence
        4: set<SettingsAttributeEx> attributesToUpdate, // SettingsAttributeSet
        3: Settings settings,
    ) throws(1: TalkException e);

    list<string> getRecommendationIds(
        1: SyncReason syncReason,
    ) throws(1: TalkException e);

    list<string> getBlockedRecommendationIds(
        1: SyncReason syncReason,
    ) throws(1: TalkException e);

    list<string> getAllContactIds(
        1: SyncReason syncReason,
    ) throws(1: TalkException e);

    Contact getContact(
        2: string id, // MID
    ) throws(1: TalkException e);

    list<Operation> fetchOps(
        2: i64 localRev, // OpRevision
        3: i32 count, // OpCount
        4: i64 globalRev, // Revision
        5: i64 individualRev, // Revision
    ) throws(1: TalkException e);

    Message sendMessage(
        1: i32 seq, // RequestSequence
        2: Message message,
    ) throws(1: TalkException e);

    void sendChatChecked(
        1: i32 seq, // RequestSequence
        2: string chatMid, // MID
        3: string lastMessageId,
        4: i8 sessionId,
    ) throws(1: TalkException e);

    Room getRoom(
        2: string roomId,
    ) throws(1: TalkException e);

    UpdateChatResponse updateChat(
        1: UpdateChatRequest request,
    ) throws(1: TalkException e);

    GetChatsResponse getChats(
        1: GetChatsRequest request,
    ) throws(1: TalkException e);

    list<E2EEPublicKey> getE2EEPublicKeysEx(
        2: bool ignoreE2EEStatus,
        3: SyncReason syncReason,
    ) throws(1: TalkException e);

    void respondE2EEKeyExchange(
        1: i32 reqSeq, // RequestSequence
        2: string encryptedKeyChain,
        3: string hashKeyChain,
    ) throws(1: TalkException e);

    E2EEGroupSharedKey getLastE2EEGroupSharedKey(
        2: i32 keyVersion,
        3: string chatMid, // MID
    ) throws(1: TalkException e);

    string verifyQrcode(
        2: string verifier,
        3: string pinCode,
    ) throws(1: TalkException e);

    Configurations getConfigurations(
        2: i64 revision,
        3: string regionOfUsim,
        4: string regionOfTelephone,
        5: string regionOfLocale,
        6: string carrier,
        7: SyncReason syncReason,
    ) throws(1: TalkException e);

    ReissueChatTicketResponse reissueChatTicket(
            1: ReissueChatTicketRequest request
        ) throws (1: TalkException e),

    void noop() throws(1: TalkException e);

    // Timestamp
    i64 getServerTime() throws(1: TalkException e);

    void setNotificationsEnabled(
        1: i32 reqSeq, // RequestSequence
        2: MIDType type,
        3: string target, // MID
        4: bool enablement,
    ) throws(1: TalkException e);


    // SECTION RegisterViewModel

    void requestAccountPasswordReset(
        4: IdentityProvider provider,
        2: string identifier,
        5: string locale,
    ) throws(1: TalkException e);


    // SECTION RegisterCountryViewModel

    set<string> getCountries(
        2: CountryGroup countryGroup,
    ) throws(1: TalkException e);


    // SECTION MyProfileViewModel

    bool registerUserid(
        1: i32 reqSeq, // RequestSequence
        2: string searchId,
    ) throws(1: TalkException e);

    bool isUseridAvailable(
        2: string searchId,
    ) throws(1: TalkException e);


    // SECTION MyProfileRefresher

    Profile getProfile(
        1: SyncReason syncReason,
    ) throws(1: TalkException e);


    // SECTION SettingsViewModel

    VerificationSessionData startUpdateVerification(
        2: string region,
        3: CarrierCode carrier,
        4: string phone,
        5: string udidHash,
        6: DeviceInfo deviceInfo,
        7: string networkCode,
        8: string locale,
        9: SIMInfo simInfo,
    ) throws(1: TalkException e);

    PhoneVerificationResult verifyPhoneNumber(
        2: string sessionId,
        3: string pinCode,
        4: string udidHash,
        5: string migrationPincodeSessionId,
        6: string oldUdidHash,
    ) throws(1: TalkException e);

    void updateAccountMigrationPincode(
        2: string accountMigrationPincode,
    ) throws(1: TalkException e);

    void resendPinCode(
        2: string sessionId,
    ) throws(1: TalkException e);

    VerificationSessionData changeVerificationMethod(
        2: string sessionId,
        3: VerificationMethod method,
    ) throws(1: TalkException e);

    void finishUpdateVerification(
        2: string sessionId,
    ) throws(1: TalkException e);


    // SECTION SettingsRefresher

    Settings getSettings(
        1: SyncReason syncReason,
    ) throws(1: TalkException e);


    // SECTION ContactViewModel

    void blockRecommendation(
        1: i32 reqSeq, // RequestSequence
        2: string id, // MID
    ) throws(1: TalkException e);

    void blockContact(
        1: i32 reqSeq, // RequestSequence
        2: string id, // MID
    ) throws(1: TalkException e);

    void unblockRecommendation(
        1: i32 reqSeq, // RequestSequence
        2: string id, // MID
    ) throws(1: TalkException e);

    void unblockContact(
        1: i32 reqSeq,
        2: string id,
        3: string reference,
    ) throws(1: TalkException e);

    map<string, Contact> findAndAddContactsByMid(
        1: i32 reqSeq, // RequestSequence
        2: string mid, // MID
        3: ContactType type,
        4: string reference,
    ) throws(1: TalkException e);

    Contact findContactByUserid(
        2: string searchId,
    ) throws(1: TalkException e);

    void inviteFriendsBySms(
        2: list<string> phoneNumberList,
    ) throws(1: TalkException e);


    // SECTION ContactRefresher

    list<Contact> getContacts(
        2: list<string> ids,
    ) throws(1: TalkException e);


    // SECTION ContactSynchronizer

    map<string, ContactRegistration> syncContacts(
        1: i32 reqSeq, // RequestSequence
        2: list<ContactModification> localContacts,
    ) throws(1: TalkException e);


    // SECTION ChatHistoryDtoOldExt

    void updateContactSetting(
        1: i32 reqSeq, // RequestSequence
        2: string mid, // MID
        3: ContactSetting flag,
        4: string value,
    ) throws(1: TalkException e);


    // SECTION ChatService

    void sendChatRemoved(
        1: i32 seq, // RequestSequence
        2: string chatMid, // MID
        3: string lastMessageId,
        4: i8 sessionId,
    ) throws(1: TalkException e);

    void leaveRoom(
        1: i32 reqSeq, // RequestSequence
        2: string roomId, // MID
    ) throws(1: TalkException e);


    // SECTION ChatRoomViewModel

    void unsendMessage(
        1: i32 seq, // RequestSequence
        2: string messageId,
    ) throws(1: TalkException e);

    void inviteIntoRoom(
        1: i32 reqSeq, // RequestSequence
        2: string roomId, // MID
        3: list<string> contactIds, // MID
    ) throws(1: TalkException e);


    // SECTION GroupChatService

    Room createRoom(
        1: i32 reqSeq, // RequestSequence
        2: list<string> contactIds, // MID
    ) throws(1: TalkException e);

    InviteIntoChatResponse inviteIntoChat(
        1: InviteIntoChatRequest request,
    ) throws(1: TalkException e);

    DeleteSelfFromChatResponse deleteSelfFromChat(
        1: DeleteSelfFromChatRequest request,
    ) throws(1: TalkException e);

    GetAllChatMidsResponse getAllChatMids(
        1: GetAllChatMidsRequest request,
        2: SyncReason syncReason,
    ) throws(1: TalkException e);


    // SECTION GroupViewModel

    CreateChatResponse createChat(
        1: CreateChatRequest request,
    ) throws(1: TalkException e);

    AcceptChatInvitationResponse acceptChatInvitation(
        1: AcceptChatInvitationRequest request,
    ) throws(1: TalkException e);

    RejectChatInvitationResponse rejectChatInvitation(
        1: RejectChatInvitationRequest request,
    ) throws(1: TalkException e);

    DeleteOtherFromChatResponse deleteOtherFromChat(
        1: DeleteOtherFromChatRequest request,
    ) throws(1: TalkException e);

    CancelChatInvitationResponse cancelChatInvitation(
        1: CancelChatInvitationRequest request,
    ) throws(1: TalkException e);


    // SECTION DeviceListViewModel

    list<LoginSession> getSessions() throws(1: TalkException e);

    void logoutSession(
        2: string tokenKey,
    ) throws(1: TalkException e);


    // SECTION DeviceInfoSender

    void notifyUpdated(
        2: i64 lastRev, // OpRevision
        3: DeviceInfo deviceInfo,
        4: string udidHash,
        5: string oldUdidHash,
    ) throws(1: TalkException e);


    // SECTION FCMManager

    void sendEchoPush(
        2: string text,
    ) throws(1: TalkException e);

    void updateNotificationToken(
        3: NotificationType type,
        2: string token,
    ) throws(1: TalkException e);


    // SECTION SecondaryLoginViewModel

    RSAKey getRSAKeyInfo(
        2: IdentityProvider provider,
    ) throws(1: TalkException e);

    list<string> getBlockedContactIds(
        1: SyncReason syncReason,
    ) throws(1: TalkException e);


    // SECTION E2EEService

    E2EEPublicKey registerE2EEPublicKey(
        1: i32 reqSeq, // RequestSequence
        2: E2EEPublicKey publicKey,
    ) throws(1: TalkException e);

    E2EEPublicKey getE2EEPublicKey(
        2: string mid, // MID
        3: i32 keyVersion,
        4: i32 keyId,
    ) throws(1: TalkException e);

    E2EENegotiationResult negotiateE2EEPublicKey(
        2: string mid, // MID
    ) throws(1: TalkException e);

    E2EEGroupSharedKey registerE2EEGroupKey(
        2: i32 keyVersion,
        3: string chatMid, // MID
        4: list<string> members, // MID
        5: list<i32> keyIds,
        6: list<string> encryptedSharedKeys,
    ) throws(1: TalkException e);

    E2EEGroupSharedKey getE2EEGroupSharedKey(
        2: i32 keyVersion,
        3: string chatMid, // MID
        4: i32 groupKeyId,
    ) throws(1: TalkException e);

    E2EEPublicKey getLastE2EEPublicKeys(
        2: string chatMid, // MID
    ) throws(1: TalkException e);
}
