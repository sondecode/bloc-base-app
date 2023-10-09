import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.access_token,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// The current user's name (display name).
  final String? access_token;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photo': photo,
      'access_token': access_token,
    };
  }

  static Future<User> fromJson(jsonDecode) {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => User(
        id: jsonDecode['id'] as String,
        email: jsonDecode['email'] as String,
        name: jsonDecode['name'] as String,
        photo: jsonDecode['photo'] as String,
        access_token: jsonDecode['access_token'] as String,
      ),
    );
  }
}