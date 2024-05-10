class Movie {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String popterPath;
  final String backdropPath;
  final num rating;
  final String releaseData;

  Movie({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.description,
    required this.popterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseData,
  });

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original_language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      popterPath: _json['videos
    );
  }
}
