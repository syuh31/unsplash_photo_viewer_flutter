import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loadingStateProvider =
    ChangeNotifierProvider((ref) => LoadingStateViewModel());

class LoadingStateViewModel extends ChangeNotifier {
  bool isLoading = false;

  Future<T> whileLoading<T>(Future<T> Function() future) {
    return Future.microtask(toLoading)
        .then<T>((_) => future())
        .whenComplete(toIdle);
  }

  void toLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  void toIdle() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }
}
