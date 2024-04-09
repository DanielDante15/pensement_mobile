class Verse {
  final int? id;
  final int? charpter;
  final int? verse;
  final String? text;
  bool? isMarked;

  Verse({
    required this.id,
    required this.charpter,
    this.verse,
    this.text,
    this.isMarked,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      id: json['id'],
      verse: json['verso'],
      text: json['texto'],
      charpter: json['capitulo'],
      isMarked: json['isMarked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'verso': verse,
      'texto': text,
      'capitulo': charpter,
      'isMarked': isMarked,
    };
  }
}
