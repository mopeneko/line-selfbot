include "TalkService.thrift"

struct StickerIdRange {
    1: i64 start;
    2: i32 size;
}

struct ProductSimple {
    1: string productId; // ProductId
    2: i64 packageId; // PackageId
    3: i64 version;
    4: bool onSale;
    5: i64 validUntil; // Timestamp
    10: list<StickerIdRange> stickerIdRanges;
    41: bool grantedByDefault;
    42: i32 displayOrder;
}

struct ProductSimpleList {
    1: bool hasNext;
    2: i32 reinvokeHour;
    3: i64 lastVersionSeq;
    4: list<ProductSimple> productList;
    5: i64 recentNewReleaseDate; // Timestamp
    6: i64 recentEventReleaseDate;
}

service ShopService {
    // SECTION ShopService

    // Timestamp
    i64 notifyDownloaded(
        2: i64 packageId, // PackageId
        3: string language,
    ) throws(1: TalkService.TalkException e);


    // SECTION StickerProductRefresher

    ProductSimpleList getActivePurchaseVersions(
        2: i64 start, // ItemIndex
        3: i32 size, // Count
        4: string language,
        5: string country,
    ) throws(1: TalkService.TalkException e);
}
