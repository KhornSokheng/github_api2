// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GitHubUserAdapter extends TypeAdapter<GitHubUser> {
  @override
  final int typeId = 1;

  @override
  GitHubUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GitHubUser(
      login: fields[0] as String?,
      avatarUrl: fields[1] as String?,
      htmlUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GitHubUser obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.avatarUrl)
      ..writeByte(2)
      ..write(obj.htmlUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitHubUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
