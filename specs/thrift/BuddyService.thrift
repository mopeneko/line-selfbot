include "TalkService.thrift"

struct BuddyList {
    1: string classification;
    2: string displayName;
    3: i32 totalBuddyCount;
    4: list<TalkService.Contact> popularContacts;
}

enum BotType {
    RESERVED = 0;
    OFFICIAL = 1;
    LINE_AT_0 = 2;
    LINE_AT = 3;
}

enum BuddyOnAirLabel {
    ON_AIR = 0;
    LIVE = 1;
}

struct BuddyDetail {
    1: string mid;
    2: i64 memberCount;
    3: bool onAir;
    4: bool businessAccount;
    5: bool addable;
    6: set<TalkService.ContentType> acceptableContentTypes;
    7: bool capableMyhome;
    8: bool freePhoneCallable;
    9: string phoneNumberToDial;
    10: bool needPermissionApproval;
    11: i32 channelId;
    12: string channelProviderName;
    13: i32 iconType;
    14: BotType botType;
    15: bool showRichMenu;
    16: i64 richMenuRevision;
    17: BuddyOnAirLabel onAirLabel;
    27: i32 onAirVersion;
    18: bool useTheme;
    19: string themeId;
    20: bool useBar;
    21: i64 barRevision;
    22: bool useBackground;
    23: string backgroundId;
    24: bool statusBarEnabled;
    25: i64 statusBarRevision;
    26: string searchId;
    28: bool blockable;
}

service BuddyService {
    // SECTION BuddyListViewModel

    list<BuddyList> getPopularBuddyLists(
        2: string language,
        3: string country,
    ) throws(1: TalkService.TalkException e);

    list<TalkService.Contact> getBuddyContacts(
        2: string language,
        3: string country,
        4: string classification,
        5: i32 fromIndex,
        6: i32 count,
    ) throws(1: TalkService.TalkException e);


    // SECTION BuddyService

    BuddyDetail getBuddyDetail(
        4: string buddyMid,
    ) throws(1: TalkService.TalkException e);
}
