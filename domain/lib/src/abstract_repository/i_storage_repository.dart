abstract class IStorageRepository<T> {
  Future<void> save(T loadToSave);

  Future<T?> read();

  Future<void> clearStorage();
}
