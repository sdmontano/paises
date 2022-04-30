class Currency {
  String name;

  Currency({required this.name});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      Currency(name: json['name']);
}
