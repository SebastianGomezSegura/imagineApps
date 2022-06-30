class Comic {
  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  List<Results> results = [];
  String version;

  Comic(
      {this.error,
        this.limit,
        this.offset,
        this.numberOfPageResults,
        this.numberOfTotalResults,
        this.statusCode,
        this.results,
        this.version});

  Comic.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    limit = json['limit'];
    offset = json['offset'];
    numberOfPageResults = json['number_of_page_results'];
    numberOfTotalResults = json['number_of_total_results'];
    statusCode = json['status_code'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
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
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['version'] = this.version;
    return data;
  }
}

class Results {
  String aliases;
  String apiDetailUrl;
  String coverDate;
  String dateAdded;
  String dateLastUpdated;
  String deck;
  String description;
  bool hasStaffReview;
  int id;
  Image image;
  String issueNumber;
  String name;
  String siteDetailUrl;
  String storeDate;
  Volume volume;

  Results(
      {this.aliases,
        this.apiDetailUrl,
        this.coverDate,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.hasStaffReview,
        this.id,
        this.image,
        this.issueNumber,
        this.name,
        this.siteDetailUrl,
        this.storeDate,
        this.volume});

  Results.fromJson(Map<String, dynamic> json) {
    apiDetailUrl = json['api_detail_url'];
    dateAdded = json['date_added'];
    id = json['id'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    issueNumber = json['issue_number'];
    name = json['name'];
    siteDetailUrl = json['site_detail_url'];
    volume =
    json['volume'] != null ? new Volume.fromJson(json['volume']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_detail_url'] = this.apiDetailUrl;
    data['date_added'] = this.dateAdded;
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['issue_number'] = this.issueNumber;
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
    originalUrl = json['original_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_url'] = this.iconUrl;
    data['original_url'] = this.originalUrl;
    return data;
  }
}

class Volume {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  Volume({this.apiDetailUrl, this.id, this.name, this.siteDetailUrl});

  Volume.fromJson(Map<String, dynamic> json) {
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

