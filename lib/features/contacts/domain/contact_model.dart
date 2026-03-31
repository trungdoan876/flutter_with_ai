import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String? avatarUrl;

  const ContactModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [id, name, phone, email, avatarUrl];
}
