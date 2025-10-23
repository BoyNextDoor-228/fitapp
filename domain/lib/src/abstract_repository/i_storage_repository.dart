/// Abstract repository to handle actions on a storage of [T].
abstract class IStorageRepository<T> {
  Future<void> save(T loadToSave);

  Future<T?> read();

  Future<void> clearStorage();
}
