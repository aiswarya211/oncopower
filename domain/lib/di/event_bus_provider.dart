import 'package:event_bus/event_bus.dart';
import 'package:riverpod/riverpod.dart';

final eventBusProvider = Provider<EventBus>((ref) {
  EventBus eventBus = EventBus();
  return eventBus;
});