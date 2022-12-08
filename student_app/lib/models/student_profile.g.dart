// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentProfileModelAdapter extends TypeAdapter<StudentProfileModel> {
  @override
  final int typeId = 0;

  @override
  StudentProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentProfileModel(
      student_id: fields[0] as dynamic,
      regid: fields[1] as dynamic,
      uni_reg: fields[2] as dynamic,
      admission_date: fields[3] as dynamic,
      first_name: fields[4] as dynamic,
      middle_name: fields[5] as dynamic,
      last_name: fields[6] as dynamic,
      gender: fields[7] as dynamic,
      dob: fields[8] as dynamic,
      phone: fields[9] as dynamic,
      landline: fields[10] as dynamic,
      email: fields[11] as dynamic,
      blood_group: fields[12] as dynamic,
      aca_program: fields[13] as dynamic,
      aca_level: fields[14] as dynamic,
      aca_section_name: fields[15] as dynamic,
      roll_no: fields[16] as dynamic,
      district: fields[17] as dynamic,
      zone: fields[18] as dynamic,
      geo_region: fields[19] as dynamic,
      region: fields[20] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, StudentProfileModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.student_id)
      ..writeByte(1)
      ..write(obj.regid)
      ..writeByte(2)
      ..write(obj.uni_reg)
      ..writeByte(3)
      ..write(obj.admission_date)
      ..writeByte(4)
      ..write(obj.first_name)
      ..writeByte(5)
      ..write(obj.middle_name)
      ..writeByte(6)
      ..write(obj.last_name)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.dob)
      ..writeByte(9)
      ..write(obj.phone)
      ..writeByte(10)
      ..write(obj.landline)
      ..writeByte(11)
      ..write(obj.email)
      ..writeByte(12)
      ..write(obj.blood_group)
      ..writeByte(13)
      ..write(obj.aca_program)
      ..writeByte(14)
      ..write(obj.aca_level)
      ..writeByte(15)
      ..write(obj.aca_section_name)
      ..writeByte(16)
      ..write(obj.roll_no)
      ..writeByte(17)
      ..write(obj.district)
      ..writeByte(18)
      ..write(obj.zone)
      ..writeByte(19)
      ..write(obj.geo_region)
      ..writeByte(20)
      ..write(obj.region);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
