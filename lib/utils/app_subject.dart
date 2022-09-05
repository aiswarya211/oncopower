import 'dart:async';

import 'package:oncopower/utils/extensions.dart';
import 'package:rxdart/subjects.dart';

class AppStream<T> {
  late Subject<T> _subject;
  T? _value;

  T? get value => _value;

  Stream<T> get stream => _subject.stream;

  AppStream({bool preserveState = false, T? initialValue}) {
    if (preserveState) {
      _subject = BehaviorSubject<T>();
    } else {
      _subject = PublishSubject<T>();
    }
    if (initialValue != null) add(initialValue);
  }

  void add(T data) {
    _value = data;
    _subject.safeAdd(data);
  }

  StreamSubscription<T> listen(void Function(T)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return _subject.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}
