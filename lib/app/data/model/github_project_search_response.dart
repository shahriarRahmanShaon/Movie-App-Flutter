class GithubProjectSearchResponse {
  String? status;
  String? statusMessage;
  Data? data;

  GithubProjectSearchResponse(
      {this.status, this.statusMessage, this.data});

  GithubProjectSearchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movies>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(new Movies.fromJson(v));
      });
    }
  }
}

class Movies {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  // String? slug;
  // int? year;
  // double? rating;
  // int? runtime;
  // List<String>? genres;
  // String? summary;
  // String? descriptionFull;
  // String? synopsis;
  // String? ytTrailerCode;
  // String? language;
  // String? mpaRating;
  // String? backgroundImage;
  // String? backgroundImageOriginal;
  // String? smallCoverImage;
  // String? mediumCoverImage;
  // String? largeCoverImage;
  // String? state;
  // String? dateUploaded;
  // int? dateUploadedUnix;

  Movies(
      {this.id,
        this.url,
        this.imdbCode,
        this.title,
        this.titleEnglish,
        this.titleLong,
        // this.slug,
        // this.year,
        // this.rating,
        // this.runtime,
        // this.genres,
        // this.summary,
        // this.descriptionFull,
        // this.synopsis,
        // this.ytTrailerCode,
        // this.language,
        // this.mpaRating,
        // this.backgroundImage,
        // this.backgroundImageOriginal,
        // this.smallCoverImage,
        // this.mediumCoverImage,
        // this.largeCoverImage,
        // this.state,
        // this.dateUploaded,
        // this.dateUploadedUnix
      });

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    // slug = json['slug'];
    // year = json['year'];
    // rating = json['rating'];
    // runtime = json['runtime'];
    // genres = json['genres'].cast<String>();
    // summary = json['summary'];
    // descriptionFull = json['description_full'];
    // synopsis = json['synopsis'];
    // ytTrailerCode = json['yt_trailer_code'];
    // language = json['language'];
    // mpaRating = json['mpa_rating'];
    // backgroundImage = json['background_image'];
    // backgroundImageOriginal = json['background_image_original'];
    // smallCoverImage = json['small_cover_image'];
    // mediumCoverImage = json['medium_cover_image'];
    // largeCoverImage = json['large_cover_image'];
    // state = json['state'];
    // dateUploaded = json['date_uploaded'];
    // dateUploadedUnix = json['date_uploaded_unix'];
  }
}

