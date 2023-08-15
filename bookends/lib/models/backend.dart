import 'package:freezed_annotation/freezed_annotation.dart';

part 'backend.freezed.dart';
part 'backend.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  factory User({
    required String id,
    required String name,
    required String email,
    required String? photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
