import 'book.dart';
import 'verse.dart';

class Charpter {
  final int? id;
  final Book? book;
  final int? charpter;
  final String? title;
  final String? description;
  final List<Verse>? verses;
  final String? previous;
  final String? next;

  Charpter({
    this.id,
    this.book,
    this.charpter,
    this.title,
    this.description,
    this.verses,
    this.previous,
    this.next,
  });

  Charpter.empty()
      : id = 0,
        book =
            Book.empty(), // Assuming you have a method to create an empty Book
        charpter = 0,
        title = '',
        description = null,
        previous = "",
        next = "",
        verses = [];

  factory Charpter.fromJson(Map<String, dynamic>? json) {
    return Charpter(
        book: Book.fromJson(json?['livro']),
        charpter: json?['capitulo']["capitulo"],
        title: json?['capitulo']["titulo"],
        description: json?['capitulo']["descicao"],
        verses: (json?["versiculos"] as List<dynamic>?)
            ?.map((verseJson) => Verse.fromJson(verseJson))
            .toList(),
        previous: json?["previous"],
        next: json?["next"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book': book?.toJson(),
      'charpter': charpter,
      'title': title,
      'description': description,
      'verses': verses?.map((verse) => verse.toJson()).toList(),
    };
  }
}
