import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsplash_viewer_flutter/data/model/photo.dart';
import 'package:unsplash_viewer_flutter/data/model/result.dart';
import 'package:unsplash_viewer_flutter/data/repository/photo_repository.dart';
import 'package:unsplash_viewer_flutter/data/repository/photo_repository_impl.dart';

final homeViewModelProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);

  final Reader _reader;

  late final PhotoRepository _repository = _reader(photoRepositoryProvider);

  Result<List<Photo>>? _photos;

  Result<List<Photo>>? get photos => _photos;

  Future<void> fetchPhotos() {
    return _repository.getPhotos().then((value) {
      _photos = value;
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
