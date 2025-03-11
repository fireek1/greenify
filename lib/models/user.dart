class User {
  final String id;
  final String password;
  final Profile profile;
  final String username;

  User({
    required this.id,
    required this.password,
    required this.profile,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['Id'],
      password: json['Password'],
      profile: Profile.fromJson(json['Profile']),
      username: json['Username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Password': password,
      'Profile': profile.toJson(),
      'Username': username,
    };
  }
}

class Profile {
  final String address;
  final int age;
  final String email;
  final String gender;

  Profile({
    required this.address,
    required this.age,
    required this.email,
    required this.gender,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      address: json['Address'],
      age: json['Age'],
      email: json['Email'],
      gender: json['Gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'Address': address, 'Age': age, 'Email': email, 'Gender': gender};
  }
}
