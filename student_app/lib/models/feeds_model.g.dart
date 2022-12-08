// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedModelAdapter extends TypeAdapter<FeedModel> {
  @override
  final int typeId = 4;

  @override
  FeedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedModel(
      id: fields[0] as dynamic,
      feed_topic: fields[1] as dynamic,
      photo_img: fields[2] as dynamic,
      description: fields[3] as dynamic,
      feed_date: fields[4] as dynamic,
      upload_by: fields[5] as dynamic,
      college_id: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FeedModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.feed_topic)
      ..writeByte(2)
      ..write(obj.photo_img)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.feed_date)
      ..writeByte(5)
      ..write(obj.upload_by)
      ..writeByte(6)
      ..write(obj.college_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
