// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'event_model.g.dart';

@HiveType(typeId: 3)
class EventModel extends HiveObject {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic event_name;
  @HiveField(2)
  dynamic event_date;
  @HiveField(3)
  dynamic description;
  @HiveField(4)
  dynamic event_by;
  @HiveField(5)
  dynamic entered_by;
  @HiveField(6)
  dynamic college_id;
  @HiveField(7)
  dynamic event_fee;
  @HiveField(8)
  dynamic created_on;
  @HiveField(9)
  dynamic photo_img;
  EventModel({
    required this.id,
    required this.event_name,
    required this.event_date,
    required this.description,
    required this.event_by,
    required this.entered_by,
    required this.college_id,
    required this.event_fee,
    required this.created_on,
    required this.photo_img,
  });

  EventModel copyWith({
    dynamic? id,
    dynamic? event_name,
    dynamic? event_date,
    dynamic? description,
    dynamic? event_by,
    dynamic? entered_by,
    dynamic? college_id,
    dynamic? event_fee,
    dynamic? created_on,
    dynamic? photo_img,
  }) {
    return EventModel(
      id: id ?? this.id,
      event_name: event_name ?? this.event_name,
      event_date: event_date ?? this.event_date,
      description: description ?? this.description,
      event_by: event_by ?? this.event_by,
      entered_by: entered_by ?? this.entered_by,
      college_id: college_id ?? this.college_id,
      event_fee: event_fee ?? this.event_fee,
      created_on: created_on ?? this.created_on,
      photo_img: photo_img ?? this.photo_img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'event_name': event_name,
      'event_date': event_date,
      'description': description,
      'event_by': event_by,
      'entered_by': entered_by,
      'college_id': college_id,
      'event_fee': event_fee,
      'created_on': created_on,
      'photo_img': photo_img,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as dynamic,
      event_name: map['event_name'] as dynamic,
      event_date: map['event_date'] as dynamic,
      description: map['description'] as dynamic,
      event_by: map['event_by'] as dynamic,
      entered_by: map['entered_by'] as dynamic,
      college_id: map['college_id'] as dynamic,
      event_fee: map['event_fee'] as dynamic,
      created_on: map['created_on'] as dynamic,
      photo_img: map['photo_img'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, event_name: $event_name, event_date: $event_date, description: $description, event_by: $event_by, entered_by: $entered_by, college_id: $college_id, event_fee: $event_fee, created_on: $created_on, photo_img: $photo_img)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.event_name == event_name &&
        other.event_date == event_date &&
        other.description == description &&
        other.event_by == event_by &&
        other.entered_by == entered_by &&
        other.college_id == college_id &&
        other.event_fee == event_fee &&
        other.created_on == created_on &&
        other.photo_img == photo_img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        event_name.hashCode ^
        event_date.hashCode ^
        description.hashCode ^
        event_by.hashCode ^
        entered_by.hashCode ^
        college_id.hashCode ^
        event_fee.hashCode ^
        created_on.hashCode ^
        photo_img.hashCode;
  }
}
