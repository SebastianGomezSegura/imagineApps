class Detail {
  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  ResultsDetail results;
  String version;

  Detail(
      {this.error,
        this.limit,
        this.offset,
        this.numberOfPageResults,
        this.numberOfTotalResults,
        this.statusCode,
        this.results,
        this.version});

  Detail.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    limit = json['limit'];
    offset = json['offset'];
    numberOfPageResults = json['number_of_page_results'];
    numberOfTotalResults = json['number_of_total_results'];
    statusCode = json['status_code'];
    results = json['results'] != null
        ? new ResultsDetail.fromJson(json['results'])
        : null;
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['number_of_page_results'] = this.numberOfPageResults;
    data['number_of_total_results'] = this.numberOfTotalResults;
    data['status_code'] = this.statusCode;
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    data['version'] = this.version;
    return data;
  }
}

class ResultsDetail {
  Null aliases;
  String apiDetailUrl;
  List<CharacterCredits> characterCredits;
  List<Null> characterDiedIn;
  List<Null> conceptCredits;
  String coverDate;
  String dateAdded;
  String dateLastUpdated;
  String deck;
  Null description;
  Null firstAppearanceCharacters;
  Null firstAppearanceConcepts;
  Null firstAppearanceLocations;
  Null firstAppearanceObjects;
  Null firstAppearanceStoryarcs;
  Null firstAppearanceTeams;
  bool hasStaffReview;
  int id;
  Image image;
  String issueNumber;
  List<LocationCredits> locationCredits;
  Null name;
  List<Null> objectCredits;
  List<Null> personCredits;
  String siteDetailUrl;
  Null storeDate;
  List<Null> storyArcCredits;
  List<TeamCredits> teamCredits;
  List<Null> teamDisbandedIn;
  CharacterCredits volume;

  ResultsDetail(
      {this.aliases,
        this.apiDetailUrl,
        this.characterCredits,
        this.characterDiedIn,
        this.conceptCredits,
        this.coverDate,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.firstAppearanceCharacters,
        this.firstAppearanceConcepts,
        this.firstAppearanceLocations,
        this.firstAppearanceObjects,
        this.firstAppearanceStoryarcs,
        this.firstAppearanceTeams,
        this.hasStaffReview,
        this.id,
        this.image,
        this.issueNumber,
        this.locationCredits,
        this.name,
        this.objectCredits,
        this.personCredits,
        this.siteDetailUrl,
        this.storeDate,
        this.storyArcCredits,
        this.teamCredits,
        this.teamDisbandedIn,
        this.volume});

  ResultsDetail.fromJson(Map<String, dynamic> json) {
    apiDetailUrl = json['api_detail_url'];
    if (json['character_credits'] != null) {
      characterCredits = new List<CharacterCredits>();
      json['character_credits'].forEach((v) {
        characterCredits.add(new CharacterCredits.fromJson(v));
      });
    }

    id = json['id'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['location_credits'] != null) {
      locationCredits = new List<LocationCredits>();
      json['location_credits'].forEach((v) {
        locationCredits.add(new LocationCredits.fromJson(v));
      });
    }

    if (json['team_credits'] != null) {
      teamCredits = new List<TeamCredits>();
      json['team_credits'].forEach((v) {
        teamCredits.add(new TeamCredits.fromJson(v));
      });
    }

    volume = json['volume'] != null
        ? new CharacterCredits.fromJson(json['volume'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_detail_url'] = this.apiDetailUrl;
    if (this.characterCredits != null) {
      data['character_credits'] =
          this.characterCredits.map((v) => v.toJson()).toList();
    }

    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }

    if (this.teamCredits != null) {
      data['team_credits'] = this.teamCredits.map((v) => v.toJson()).toList();
    }

    if (this.volume != null) {
      data['volume'] = this.volume.toJson();
    }
    return data;
  }
}

class CharacterCredits {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  CharacterCredits({this.apiDetailUrl, this.id, this.name, this.siteDetailUrl});

  CharacterCredits.fromJson(Map<String, dynamic> json) {
    apiDetailUrl = json['api_detail_url'];
    id = json['id'];
    name = json['name'];
    siteDetailUrl = json['site_detail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_detail_url'] = this.apiDetailUrl;
    data['id'] = this.id;
    data['name'] = this.name;
    data['site_detail_url'] = this.siteDetailUrl;
    return data;
  }
}

class Image {
  String iconUrl;
  String mediumUrl;
  String screenUrl;
  String screenLargeUrl;
  String smallUrl;
  String superUrl;
  String thumbUrl;
  String tinyUrl;
  String originalUrl;
  String imageTags;

  Image(
      {this.iconUrl,
        this.mediumUrl,
        this.screenUrl,
        this.screenLargeUrl,
        this.smallUrl,
        this.superUrl,
        this.thumbUrl,
        this.tinyUrl,
        this.originalUrl,
        this.imageTags});

  Image.fromJson(Map<String, dynamic> json) {
    iconUrl = json['icon_url'];
    mediumUrl = json['medium_url'];
    screenUrl = json['screen_url'];
    screenLargeUrl = json['screen_large_url'];
    smallUrl = json['small_url'];
    superUrl = json['super_url'];
    thumbUrl = json['thumb_url'];
    tinyUrl = json['tiny_url'];
    originalUrl = json['original_url'];
    imageTags = json['image_tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_url'] = this.iconUrl;
    data['medium_url'] = this.mediumUrl;
    data['screen_url'] = this.screenUrl;
    data['screen_large_url'] = this.screenLargeUrl;
    data['small_url'] = this.smallUrl;
    data['super_url'] = this.superUrl;
    data['thumb_url'] = this.thumbUrl;
    data['tiny_url'] = this.tinyUrl;
    data['original_url'] = this.originalUrl;
    data['image_tags'] = this.imageTags;
    return data;
  }
}

class LocationCredits {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  LocationCredits({this.apiDetailUrl, this.id, this.name, this.siteDetailUrl});

  LocationCredits.fromJson(Map<String, dynamic> json) {
    apiDetailUrl = json['api_detail_url'];
    id = json['id'];
    name = json['name'];
    siteDetailUrl = json['site_detail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_detail_url'] = this.apiDetailUrl;
    data['id'] = this.id;
    data['name'] = this.name;
    data['site_detail_url'] = this.siteDetailUrl;
    return data;
  }
}

class TeamCredits {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  TeamCredits({this.apiDetailUrl, this.id, this.name, this.siteDetailUrl});

  TeamCredits.fromJson(Map<String, dynamic> json) {
    apiDetailUrl = json['api_detail_url'];
    id = json['id'];
    name = json['name'];
    siteDetailUrl = json['site_detail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_detail_url'] = this.apiDetailUrl;
    data['id'] = this.id;
    data['name'] = this.name;
    data['site_detail_url'] = this.siteDetailUrl;
    return data;
  }
}

