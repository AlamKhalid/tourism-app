class Place {
  final String name;
  final String description;
  final List<String> images;

  const Place(
      {required this.name, required this.description, required this.images});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        name: json['name'],
        description: json['description'],
        images: (json['images'] as List).map((e) => e.toString()).toList());
  }
}
