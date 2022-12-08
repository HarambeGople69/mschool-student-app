// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'organization_model.g.dart';

@HiveType(typeId: 1)
class OrganizationModel extends HiveObject {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic college_name;
  @HiveField(2)
  dynamic affiliated_to;
  @HiveField(3)
  dynamic city;
  @HiveField(4)
  dynamic estd;
  @HiveField(5)
  dynamic district;
  @HiveField(6)
  dynamic province;
  @HiveField(7)
  dynamic zipcode;
  @HiveField(8)
  dynamic email;
  @HiveField(9)
  dynamic phone2;
  @HiveField(10)
  dynamic fax;
  @HiveField(11)
  dynamic logo;
  @HiveField(12)
  dynamic code;
  @HiveField(13)
  dynamic website;
  @HiveField(14)
  dynamic sms_api;
  OrganizationModel({
    required this.id,
    required this.college_name,
    required this.affiliated_to,
    required this.city,
    required this.estd,
    required this.district,
    required this.province,
    required this.zipcode,
    required this.email,
    required this.phone2,
    required this.fax,
    required this.logo,
    required this.code,
    required this.website,
    required this.sms_api,
  });

  OrganizationModel copyWith({
    dynamic? id,
    dynamic? college_name,
    dynamic? affiliated_to,
    dynamic? city,
    dynamic? estd,
    dynamic? district,
    dynamic? province,
    dynamic? zipcode,
    dynamic? email,
    dynamic? phone2,
    dynamic? fax,
    dynamic? logo,
    dynamic? code,
    dynamic? website,
    dynamic? sms_api,
  }) {
    return OrganizationModel(
      id: id ?? this.id,
      college_name: college_name ?? this.college_name,
      affiliated_to: affiliated_to ?? this.affiliated_to,
      city: city ?? this.city,
      estd: estd ?? this.estd,
      district: district ?? this.district,
      province: province ?? this.province,
      zipcode: zipcode ?? this.zipcode,
      email: email ?? this.email,
      phone2: phone2 ?? this.phone2,
      fax: fax ?? this.fax,
      logo: logo ?? this.logo,
      code: code ?? this.code,
      website: website ?? this.website,
      sms_api: sms_api ?? this.sms_api,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'college_name': college_name,
      'affiliated_to': affiliated_to,
      'city': city,
      'estd': estd,
      'district': district,
      'province': province,
      'zipcode': zipcode,
      'email': email,
      'phone2': phone2,
      'fax': fax,
      'logo': logo,
      'code': code,
      'website': website,
      'sms_api': sms_api,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      id: map['id'] as dynamic,
      college_name: map['college_name'] as dynamic,
      affiliated_to: map['affiliated_to'] as dynamic,
      city: map['city'] as dynamic,
      estd: map['estd'] as dynamic,
      district: map['district'] as dynamic,
      province: map['province'] as dynamic,
      zipcode: map['zipcode'] as dynamic,
      email: map['email'] as dynamic,
      phone2: map['phone2'] as dynamic,
      fax: map['fax'] as dynamic,
      logo: map['logo'] as dynamic,
      code: map['code'] as dynamic,
      website: map['website'] as dynamic,
      sms_api: map['sms_api'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganizationModel.fromJson(String source) => OrganizationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrganizationModel(id: $id, college_name: $college_name, affiliated_to: $affiliated_to, city: $city, estd: $estd, district: $district, province: $province, zipcode: $zipcode, email: $email, phone2: $phone2, fax: $fax, logo: $logo, code: $code, website: $website, sms_api: $sms_api)';
  }

  @override
  bool operator ==(covariant OrganizationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.college_name == college_name &&
      other.affiliated_to == affiliated_to &&
      other.city == city &&
      other.estd == estd &&
      other.district == district &&
      other.province == province &&
      other.zipcode == zipcode &&
      other.email == email &&
      other.phone2 == phone2 &&
      other.fax == fax &&
      other.logo == logo &&
      other.code == code &&
      other.website == website &&
      other.sms_api == sms_api;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      college_name.hashCode ^
      affiliated_to.hashCode ^
      city.hashCode ^
      estd.hashCode ^
      district.hashCode ^
      province.hashCode ^
      zipcode.hashCode ^
      email.hashCode ^
      phone2.hashCode ^
      fax.hashCode ^
      logo.hashCode ^
      code.hashCode ^
      website.hashCode ^
      sms_api.hashCode;
  }
}
