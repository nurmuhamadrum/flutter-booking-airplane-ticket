import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String hoby;
  final int balance;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.hoby = '',
    this.balance = 0,
  });

  @override
  List<Object?> get props => [id, email, name, hoby, balance];
}
