// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrganizationModelAdapter extends TypeAdapter<OrganizationModel> {
  @override
  final int typeId = 1;

  @override
  OrganizationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrganizationModel(
      id: fields[0] as dynamic,
      college_name: fields[1] as dynamic,
      affiliated_to: fields[2] as dynamic,
      city: fields[3] as dynamic,
      estd: fields[4] as dynamic,
      district: fields[5] as dynamic,
      province: fields[6] as dynamic,
      zipcode: fields[7] as dynamic,
      email: fields[8] as dynamic,
      phone2: fields[9] as dynamic,
      fax: fields[10] as dynamic,
      logo: fields[11] as dynamic,
      code: fields[12] as dynamic,
      website: fields[13] as dynamic,
      sms_api: fields[14] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, OrganizationModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.college_name)
      ..writeByte(2)
      ..write(obj.affiliated_to)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.estd)
      ..writeByte(5)
      ..write(obj.district)
      ..writeByte(6)
      ..write(obj.province)
      ..writeByte(7)
      ..write(obj.zipcode)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.phone2)
      ..writeByte(10)
      ..write(obj.fax)
      ..writeByte(11)
      ..write(obj.logo)
      ..writeByte(12)
      ..write(obj.code)
      ..writeByte(13)
      ..write(obj.website)
      ..writeByte(14)
      ..write(obj.sms_api);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
