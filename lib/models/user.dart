import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.fullname,
    this.photo,
    this.accessToken,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? fullname;

  /// Url for the current user's photo.
  final String? photo;

  /// The current user's name (display name).
  final String? accessToken;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, fullname, photo];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'photo': photo,
      'accessToken': accessToken,
    };
  }

  static Future<User> fromJson(dynamic jsonDecode) {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => User(
        id: jsonDecode['id'] as String,
        email: jsonDecode['email'] as String,
        fullname: jsonDecode['fullname'] as String,
        photo: jsonDecode['photo'] as String,
        accessToken: jsonDecode['accessToken'] as String,
      ),
    );
  }
}