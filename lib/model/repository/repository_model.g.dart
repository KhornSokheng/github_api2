// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepositoryAdapter extends TypeAdapter<Repository> {
  @override
  final int typeId = 2;

  @override
  Repository read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repository(
      name: fields[0] as String?,
      htmlUrl: fields[3] as String?,
      createdAt: fields[1] as DateTime?,
      updatedAt: fields[2] as DateTime?,
      watchersCount: fields[4] as int?,
      language: fields[5] as dynamic,
      visibility: fields[7] as String?,
      defaultBranch: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Repository obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.htmlUrl)
      ..writeByte(4)
      ..write(obj.watchersCount)
      ..writeByte(5)
      ..write(obj.language)
      ..writeByte(6)
      ..write(obj.defaultBranch)
      ..writeByte(7)
      ..write(obj.visibility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
