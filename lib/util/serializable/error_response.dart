import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  final String type;
  final String message;

  ErrorResponse(this.type, this.message);

  static const fromJsonFactory = _$ErrorResponseFromJson;

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
