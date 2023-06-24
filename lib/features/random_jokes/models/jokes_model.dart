class Jokes {
  final int id;
  final String content;
  late int hasRead;
  late int hasLiked;
  Jokes({
    required this.id,
    required this.content,
    required this.hasRead,
    required this.hasLiked,
  });

  factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
        id: json['id'],
        content: json['content'],
        hasRead: json['hasRead'] ?? 0,
        hasLiked: json['hasLiked'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'hasRead': hasRead,
        'hasLiked': hasLiked,
      };
}
