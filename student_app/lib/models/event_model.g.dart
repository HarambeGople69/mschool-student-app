// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 3;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      id: fields[0] as dynamic,
      event_name: fields[1] as dynamic,
      event_date: fields[2] as dynamic,
      description: fields[3] as dynamic,
      event_by: fields[4] as dynamic,
      entered_by: fields[5] as dynamic,
      college_id: fields[6] as dynamic,
      event_fee: fields[7] as dynamic,
      created_on: fields[8] as dynamic,
      photo_img: fields[9] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.event_name)
      ..writeByte(2)
      ..write(obj.event_date)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.event_by)
      ..writeByte(5)
      ..write(obj.entered_by)
      ..writeByte(6)
      ..write(obj.college_id)
      ..writeByte(7)
      ..write(obj.event_fee)
      ..writeByte(8)
      ..write(obj.created_on)
      ..writeByte(9)
      ..write(obj.photo_img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
