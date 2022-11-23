import '../../model/repository_model.dart';

class RepositoryViewModel {

  Repository repository;

  RepositoryViewModel({ required this.repository});

  get createdAt => repository.createdAt ?? DateTime.now();

  get name => repository.name ?? "";

  get language => repository.language ?? "";

  get visibility => repository.visibility ?? "";

  get updatedAt => repository.updatedAt ?? DateTime.now();

  get defaultBranch => repository.defaultBranch ?? "";

  get watchersCount => repository.watchersCount ?? 0;



}