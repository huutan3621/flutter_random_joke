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

// final List<Jokes> jokesList = [
//   const Jokes(
//     id: 0,
//     content:
//         'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on."\nThe child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now."\nThe child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."',
//     hasRead: false,
//     hasLiked: false,
//   ),
//   const Jokes(
//     id: 1,
//     content:
//         'Teacher: "Kids,what does the chicken give you?" Student: "Meat!" Teacher: "Very good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what does the fat cow give you?" Student: "Homework!"',
//     hasRead: false,
//     hasLiked: false,
//   ),
//   const Jokes(
//     id: 2,
//     content:
//         'The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, "I am going to eat that pussy once Jimmy leaves for school today!""',
//     hasRead: false,
//     hasLiked: false,
//   ),
//   const Jokes(
//     id: 3,
//     content:
//         "A housewife, an accountant and a lawyer were asked 'How much is 2+2?' The housewife replies: 'Four!'. The accountant says: 'I think it's either 3 or 4. Let me run those figures through my spreadsheet one more time.' The lawyer pulls the drapes, dims the lights and asks in a hushed voice, 'How much do you want it to be?",
//     hasRead: false,
//     hasLiked: false,
//   ),
// ];
