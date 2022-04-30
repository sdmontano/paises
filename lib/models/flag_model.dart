class Flag {
  String svg;
  String png;
  Flag({required this.svg, required this.png});

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(svg: json['svg'], png: json['png']);
  }
}
