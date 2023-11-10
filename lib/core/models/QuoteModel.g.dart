// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuoteModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteModelAdapter extends TypeAdapter<QuoteModel> {
  @override
  final int typeId = 0;

  @override
  QuoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteModel(
      id: fields[0] as String?,
      content: fields[1] as String?,
      author: fields[2] as String?,
      tags: (fields[3] as List?)?.cast<String>(),
      authorSlug: fields[4] as String?,
      length: fields[5] as num?,
      dateAdded: fields[6] as String?,
      dateModified: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, QuoteModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.authorSlug)
      ..writeByte(5)
      ..write(obj.length)
      ..writeByte(6)
      ..write(obj.dateAdded)
      ..writeByte(7)
      ..write(obj.dateModified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
