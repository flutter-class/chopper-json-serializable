import 'package:json_annotation/json_annotation.dart';

part 'new_feed.g.dart';

@JsonSerializable()
class NewFeed {
  int userId;
  int id;
  String title;
  String body;

  //you have to create these two methods in order this POJO can convert/parse from/to json
  // this is command to generate  >>>  # flutter packages pub run build_runner build
  static const fromJson = _$NewFeedFromJson;

  Map<String, dynamic> toJson() => _$NewFeedToJson(this);
}
