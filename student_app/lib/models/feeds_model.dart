// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'feeds_model.g.dart';

@HiveType(typeId: 4)
class FeedModel extends HiveObject {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic feed_topic;
  @HiveField(2)
  dynamic photo_img;
  @HiveField(3)
  dynamic description;
  @HiveField(4)
  dynamic feed_date;
  @HiveField(5)
  dynamic upload_by;
  @HiveField(6)
  dynamic college_id;
  FeedModel({
    required this.id,
    required this.feed_topic,
    required this.photo_img,
    required this.description,
    required this.feed_date,
    required this.upload_by,
    required this.college_id,
  });

  FeedModel copyWith({
    dynamic? id,
    dynamic? feed_topic,
    dynamic? photo_img,
    dynamic? description,
    dynamic? feed_date,
    dynamic? upload_by,
    dynamic? college_id,
  }) {
    return FeedModel(
      id: id ?? this.id,
      feed_topic: feed_topic ?? this.feed_topic,
      photo_img: photo_img ?? this.photo_img,
      description: description ?? this.description,
      feed_date: feed_date ?? this.feed_date,
      upload_by: upload_by ?? this.upload_by,
      college_id: college_id ?? this.college_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'feed_topic': feed_topic,
      'photo_img': photo_img,
      'description': description,
      'feed_date': feed_date,
      'upload_by': upload_by,
      'college_id': college_id,
    };
  }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      id: map['id'] as dynamic,
      feed_topic: map['feed_topic'] as dynamic,
      photo_img: map['photo_img'] as dynamic,
      description: map['description'] as dynamic,
      feed_date: map['feed_date'] as dynamic,
      upload_by: map['upload_by'] as dynamic,
      college_id: map['college_id'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedModel.fromJson(String source) =>
      FeedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeedModel(id: $id, feed_topic: $feed_topic, photo_img: $photo_img, description: $description, feed_date: $feed_date, upload_by: $upload_by, college_id: $college_id)';
  }

  @override
  bool operator ==(covariant FeedModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.feed_topic == feed_topic &&
        other.photo_img == photo_img &&
        other.description == description &&
        other.feed_date == feed_date &&
        other.upload_by == upload_by &&
        other.college_id == college_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        feed_topic.hashCode ^
        photo_img.hashCode ^
        description.hashCode ^
        feed_date.hashCode ^
        upload_by.hashCode ^
        college_id.hashCode;
  }
}

// [
//   {
//   "id":"1",
//   "feed_topic":"demo feed",
//   "photo_img":"",
//   "description":"this is demo feed. \r\n",
//   "feed_date":"2022-12-05 08:25:54",
//   "upload_by":"1",
//   "college_id":"1002"
//   }
// ]