// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'student_profile.g.dart';

@HiveType(typeId: 0)
class StudentProfileModel extends HiveObject {
  @HiveField(0)
  dynamic student_id;
  @HiveField(1)
  dynamic regid;
  @HiveField(2)
  dynamic uni_reg;
  @HiveField(3)
  dynamic admission_date;
  @HiveField(4)
  dynamic first_name;
  @HiveField(5)
  dynamic middle_name;
  @HiveField(6)
  dynamic last_name;
  @HiveField(7)
  dynamic gender;
  @HiveField(8)
  dynamic dob;
  @HiveField(9)
  dynamic phone;
  @HiveField(10)
  dynamic landline;
  @HiveField(11)
  dynamic email;
  @HiveField(12)
  dynamic blood_group;
  @HiveField(13)
  dynamic aca_program;
  @HiveField(14)
  dynamic aca_level;
  @HiveField(15)
  dynamic aca_section_name;
  @HiveField(16)
  dynamic roll_no;
  @HiveField(17)
  dynamic district;
  @HiveField(18)
  dynamic zone;
  @HiveField(19)
  dynamic geo_region;
  @HiveField(20)
  dynamic region;
  StudentProfileModel({
    required this.student_id,
    required this.regid,
    required this.uni_reg,
    required this.admission_date,
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.gender,
    required this.dob,
    required this.phone,
    required this.landline,
    required this.email,
    required this.blood_group,
    required this.aca_program,
    required this.aca_level,
    required this.aca_section_name,
    required this.roll_no,
    required this.district,
    required this.zone,
    required this.geo_region,
    required this.region,
  });

  StudentProfileModel copyWith({
    dynamic? student_id,
    dynamic? regid,
    dynamic? uni_reg,
    dynamic? admission_date,
    dynamic? first_name,
    dynamic? middle_name,
    dynamic? last_name,
    dynamic? gender,
    dynamic? dob,
    dynamic? phone,
    dynamic? landline,
    dynamic? email,
    dynamic? blood_group,
    dynamic? aca_program,
    dynamic? aca_level,
    dynamic? aca_section_name,
    dynamic? roll_no,
    dynamic? district,
    dynamic? zone,
    dynamic? geo_region,
    dynamic? region,
  }) {
    return StudentProfileModel(
      student_id: student_id ?? this.student_id,
      regid: regid ?? this.regid,
      uni_reg: uni_reg ?? this.uni_reg,
      admission_date: admission_date ?? this.admission_date,
      first_name: first_name ?? this.first_name,
      middle_name: middle_name ?? this.middle_name,
      last_name: last_name ?? this.last_name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
      landline: landline ?? this.landline,
      email: email ?? this.email,
      blood_group: blood_group ?? this.blood_group,
      aca_program: aca_program ?? this.aca_program,
      aca_level: aca_level ?? this.aca_level,
      aca_section_name: aca_section_name ?? this.aca_section_name,
      roll_no: roll_no ?? this.roll_no,
      district: district ?? this.district,
      zone: zone ?? this.zone,
      geo_region: geo_region ?? this.geo_region,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'student_id': student_id,
      'regid': regid,
      'uni_reg': uni_reg,
      'admission_date': admission_date,
      'first_name': first_name,
      'middle_name': middle_name,
      'last_name': last_name,
      'gender': gender,
      'dob': dob,
      'phone': phone,
      'landline': landline,
      'email': email,
      'blood_group': blood_group,
      'aca_program': aca_program,
      'aca_level': aca_level,
      'aca_section_name': aca_section_name,
      'roll_no': roll_no,
      'district': district,
      'zone': zone,
      'geo_region': geo_region,
      'region': region,
    };
  }

  factory StudentProfileModel.fromMap(Map<String, dynamic> map) {
    return StudentProfileModel(
      student_id: map['student_id'] as dynamic,
      regid: map['regid'] as dynamic,
      uni_reg: map['uni_reg'] as dynamic,
      admission_date: map['admission_date'] as dynamic,
      first_name: map['first_name'] as dynamic,
      middle_name: map['middle_name'] as dynamic,
      last_name: map['last_name'] as dynamic,
      gender: map['gender'] as dynamic,
      dob: map['dob'] as dynamic,
      phone: map['phone'] as dynamic,
      landline: map['landline'] as dynamic,
      email: map['email'] as dynamic,
      blood_group: map['blood_group'] as dynamic,
      aca_program: map['aca_program'] as dynamic,
      aca_level: map['aca_level'] as dynamic,
      aca_section_name: map['aca_section_name'] as dynamic,
      roll_no: map['roll_no'] as dynamic,
      district: map['district'] as dynamic,
      zone: map['zone'] as dynamic,
      geo_region: map['geo_region'] as dynamic,
      region: map['region'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileModel.fromJson(String source) => StudentProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentProfileModel(student_id: $student_id, regid: $regid, uni_reg: $uni_reg, admission_date: $admission_date, first_name: $first_name, middle_name: $middle_name, last_name: $last_name, gender: $gender, dob: $dob, phone: $phone, landline: $landline, email: $email, blood_group: $blood_group, aca_program: $aca_program, aca_level: $aca_level, aca_section_name: $aca_section_name, roll_no: $roll_no, district: $district, zone: $zone, geo_region: $geo_region, region: $region)';
  }

  @override
  bool operator ==(covariant StudentProfileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.student_id == student_id &&
      other.regid == regid &&
      other.uni_reg == uni_reg &&
      other.admission_date == admission_date &&
      other.first_name == first_name &&
      other.middle_name == middle_name &&
      other.last_name == last_name &&
      other.gender == gender &&
      other.dob == dob &&
      other.phone == phone &&
      other.landline == landline &&
      other.email == email &&
      other.blood_group == blood_group &&
      other.aca_program == aca_program &&
      other.aca_level == aca_level &&
      other.aca_section_name == aca_section_name &&
      other.roll_no == roll_no &&
      other.district == district &&
      other.zone == zone &&
      other.geo_region == geo_region &&
      other.region == region;
  }

  @override
  int get hashCode {
    return student_id.hashCode ^
      regid.hashCode ^
      uni_reg.hashCode ^
      admission_date.hashCode ^
      first_name.hashCode ^
      middle_name.hashCode ^
      last_name.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      phone.hashCode ^
      landline.hashCode ^
      email.hashCode ^
      blood_group.hashCode ^
      aca_program.hashCode ^
      aca_level.hashCode ^
      aca_section_name.hashCode ^
      roll_no.hashCode ^
      district.hashCode ^
      zone.hashCode ^
      geo_region.hashCode ^
      region.hashCode;
  }
}
