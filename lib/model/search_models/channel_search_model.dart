import 'dart:convert';

class ChannelSearchModel {
  String kind;
  String etag;
  String nextPageToken;
  String regionCode;
  PageInfo pageInfo;
  List<Item> items;

  ChannelSearchModel({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.regionCode,
    required this.pageInfo,
    required this.items,
  });

  ChannelSearchModel copyWith({
    String? kind,
    String? etag,
    String? nextPageToken,
    String? regionCode,
    PageInfo? pageInfo,
    List<Item>? items,
  }) =>
      ChannelSearchModel(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        nextPageToken: nextPageToken ?? this.nextPageToken,
        regionCode: regionCode ?? this.regionCode,
        pageInfo: pageInfo ?? this.pageInfo,
        items: items ?? this.items,
      );

  factory ChannelSearchModel.fromRawJson(String str) => ChannelSearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChannelSearchModel.fromJson(Map<String, dynamic> json) => ChannelSearchModel(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"],
    regionCode: json["regionCode"],
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "regionCode": regionCode,
    "pageInfo": pageInfo.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  ItemKind kind;
  String etag;
  Id id;
  Snippet snippet;

  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  Item copyWith({
    ItemKind? kind,
    String? etag,
    Id? id,
    Snippet? snippet,
  }) =>
      Item(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        id: id ?? this.id,
        snippet: snippet ?? this.snippet,
      );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: itemKindValues.map[json["kind"]]!,
    etag: json["etag"],
    id: Id.fromJson(json["id"]),
    snippet: Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": itemKindValues.reverse[kind],
    "etag": etag,
    "id": id.toJson(),
    "snippet": snippet.toJson(),
  };
}

class Id {
  IdKind kind;
  String videoId;

  Id({
    required this.kind,
    required this.videoId,
  });

  Id copyWith({
    IdKind? kind,
    String? videoId,
  }) =>
      Id(
        kind: kind ?? this.kind,
        videoId: videoId ?? this.videoId,
      );

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    kind: idKindValues.map[json["kind"]]!,
    videoId: json["videoId"],
  );

  Map<String, dynamic> toJson() => {
    "kind": idKindValues.reverse[kind],
    "videoId": videoId,
  };
}

enum IdKind {
  YOUTUBE_VIDEO
}

final idKindValues = EnumValues({
  "youtube#video": IdKind.YOUTUBE_VIDEO
});

enum ItemKind {
  YOUTUBE_SEARCH_RESULT
}

final itemKindValues = EnumValues({
  "youtube#searchResult": ItemKind.YOUTUBE_SEARCH_RESULT
});

class Snippet {
  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  LiveBroadcastContent liveBroadcastContent;
  DateTime publishTime;

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });

  Snippet copyWith({
    DateTime? publishedAt,
    String? channelId,
    String? title,
    String? description,
    Thumbnails? thumbnails,
    String? channelTitle,
    LiveBroadcastContent? liveBroadcastContent,
    DateTime? publishTime,
  }) =>
      Snippet(
        publishedAt: publishedAt ?? this.publishedAt,
        channelId: channelId ?? this.channelId,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnails: thumbnails ?? this.thumbnails,
        channelTitle: channelTitle ?? this.channelTitle,
        liveBroadcastContent: liveBroadcastContent ?? this.liveBroadcastContent,
        publishTime: publishTime ?? this.publishTime,
      );

  factory Snippet.fromRawJson(String str) => Snippet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    liveBroadcastContent: liveBroadcastContentValues.map[json["liveBroadcastContent"]]!,
    publishTime: DateTime.parse(json["publishTime"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitle,
    "liveBroadcastContent": liveBroadcastContentValues.reverse[liveBroadcastContent],
    "publishTime": publishTime.toIso8601String(),
  };
}

enum LiveBroadcastContent {
  NONE
}

final liveBroadcastContentValues = EnumValues({
  "none": LiveBroadcastContent.NONE
});

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;

  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  Thumbnails copyWith({
    Default? thumbnailsDefault,
    Default? medium,
    Default? high,
  }) =>
      Thumbnails(
        thumbnailsDefault: thumbnailsDefault ?? this.thumbnailsDefault,
        medium: medium ?? this.medium,
        high: high ?? this.high,
      );

  factory Thumbnails.fromRawJson(String str) => Thumbnails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
  };
}

class Default {
  String url;
  int width;
  int height;

  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  Default copyWith({
    String? url,
    int? width,
    int? height,
  }) =>
      Default(
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Default.fromRawJson(String str) => Default.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  PageInfo copyWith({
    int? totalResults,
    int? resultsPerPage,
  }) =>
      PageInfo(
        totalResults: totalResults ?? this.totalResults,
        resultsPerPage: resultsPerPage ?? this.resultsPerPage,
      );

  factory PageInfo.fromRawJson(String str) => PageInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
