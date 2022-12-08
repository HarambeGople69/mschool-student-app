// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'subject_model.g.dart';

@HiveType(typeId: 2)
class SubjectModel extends HiveObject {
  @HiveField(0)
  dynamic subjectid;
  @HiveField(1)
  dynamic subject_name;
  @HiveField(2)
  dynamic subject_code;
  @HiveField(3)
  dynamic subject_type;
  SubjectModel({
    required this.subjectid,
    required this.subject_name,
    required this.subject_code,
    required this.subject_type,
  });

  SubjectModel copyWith({
    dynamic? subjectid,
    dynamic? subject_name,
    dynamic? subject_code,
    dynamic? subject_type,
  }) {
    return SubjectModel(
      subjectid: subjectid ?? this.subjectid,
      subject_name: subject_name ?? this.subject_name,
      subject_code: subject_code ?? this.subject_code,
      subject_type: subject_type ?? this.subject_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectid': subjectid,
      'subject_name': subject_name,
      'subject_code': subject_code,
      'subject_type': subject_type,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      subjectid: map['subjectid'] as dynamic,
      subject_name: map['subject_name'] as dynamic,
      subject_code: map['subject_code'] as dynamic,
      subject_type: map['subject_type'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubjectModel(subjectid: $subjectid, subject_name: $subject_name, subject_code: $subject_code, subject_type: $subject_type)';
  }

  @override
  bool operator ==(covariant SubjectModel other) {
    if (identical(this, other)) return true;

    return other.subjectid == subjectid &&
        other.subject_name == subject_name &&
        other.subject_code == subject_code &&
        other.subject_type == subject_type;
  }

  @override
  int get hashCode {
    return subjectid.hashCode ^
        subject_name.hashCode ^
        subject_code.hashCode ^
        subject_type.hashCode;
  }
}
