class Book {
  final int? id;
  final String? name;
  final String? abbreviation;
  final String? author;
  final String? description;
  final String? category;

  Book({
    this.id,
    this.name,
    this.abbreviation,
    this.author,
    this.description,
    this.category,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['nome'],
      abbreviation: json['abreviacao'],
      author: json['autor'],
      description: json['descricao'],
      category: json['categoria'],
    );
  }

  Book.empty()
      : id = 0,
        name = '',
        abbreviation = '',
        author = '',
        description = '',
        category = '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': name,
      'abreviacao': abbreviation,
      'autor': author,
      'descricao': description,
      'categoria': category,
    };
  }
}
