/// Interface for the instance manager
abstract class IInstanceManager {
  Future<void> dispose();
  void register<T extends Object>(T instance);
  Future<void> unregister<T extends Object>();
  T resolve<T extends Object>();
  Future<T> resolveWithParams<T extends Object>(Map<String, dynamic> params);
  Future<void> clear();
}
