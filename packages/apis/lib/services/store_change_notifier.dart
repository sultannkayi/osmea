import 'dart:async';

/// Service that notifies listeners about store configuration changes
class StoreChangeNotifier {
  static final StoreChangeNotifier _instance = StoreChangeNotifier._internal();
  factory StoreChangeNotifier() => _instance;
  StoreChangeNotifier._internal();

  final StreamController<StoreChangeEvent> _controller = StreamController<StoreChangeEvent>.broadcast();
  
  /// Stream of store change events
  Stream<StoreChangeEvent> get stream => _controller.stream;

  /// Notify listeners about a store being added
  void notifyStoreAdded(dynamic storeConfig) {
    _controller.add(StoreChangeEvent.added(storeConfig));
  }

  /// Notify listeners about a store being updated
  void notifyStoreUpdated(dynamic storeConfig) {
    _controller.add(StoreChangeEvent.updated(storeConfig));
  }

  /// Notify listeners about a store being deleted
  void notifyStoreDeleted(String storeId) {
    _controller.add(StoreChangeEvent.deleted(storeId));
  }

  /// Notify listeners about store switching
  void notifyStoreSwitched(dynamic storeConfig) {
    _controller.add(StoreChangeEvent.switched(storeConfig));
  }

  /// Notify listeners about any store change
  void notifyStoreChanged(dynamic storeConfig) {
    _controller.add(StoreChangeEvent.changed(storeConfig));
  }

  void dispose() {
    _controller.close();
  }
}

/// Event types for store changes
class StoreChangeEvent {
  final StoreChangeType type;
  final dynamic data;
  final DateTime timestamp;

  StoreChangeEvent._(this.type, this.data) : timestamp = DateTime.now();

  factory StoreChangeEvent.added(dynamic storeConfig) => StoreChangeEvent._(StoreChangeType.added, storeConfig);
  factory StoreChangeEvent.updated(dynamic storeConfig) => StoreChangeEvent._(StoreChangeType.updated, storeConfig);
  factory StoreChangeEvent.deleted(String storeId) => StoreChangeEvent._(StoreChangeType.deleted, storeId);
  factory StoreChangeEvent.switched(dynamic storeConfig) => StoreChangeEvent._(StoreChangeType.switched, storeConfig);
  factory StoreChangeEvent.changed(dynamic storeConfig) => StoreChangeEvent._(StoreChangeType.changed, storeConfig);
}

enum StoreChangeType {
  added,
  updated,
  deleted,
  switched,
  changed,
}
