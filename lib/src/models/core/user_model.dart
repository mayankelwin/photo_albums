class Company {
  final String name;
  final String catchPhrase;

  Company({
    required this.name,
    required this.catchPhrase,
  });

  factory Company.fromJson(Map<String, dynamic>? json) {
    return Company(
      name: json?['name'] ?? 'Sem nome',
      catchPhrase: json?['catchPhrase'] ?? '',
    );
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Sem nome',
      username: json['username'] ?? '',
      email: json['email'] ?? 'sem@email.com',
      company: Company.fromJson(json['company']),
    );
  }
}
