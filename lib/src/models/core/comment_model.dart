class Comment {
  final int id;
  final String name;
  final String email;
  final String body;
  final int postId;

  Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
    required this.postId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
      postId: json['postId'],
    );
  }
}