import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unsplash_viewer_flutter/data/repository/photo_repository_impl.dart';
import 'package:unsplash_viewer_flutter/data/model/photo.dart';
import 'package:unsplash_viewer_flutter/data/model/result.dart';
import 'package:unsplash_viewer_flutter/ui/home/home_view_model.dart';

import 'data/dummy_photos.dart';

class FakePhotoRepositoryImpl implements PhotoRepositoryImpl {
  @override
  Future<Result<List<Photo>>> getPhotos() {
    return Result.guardFuture(() => Future.value(kDummyPhotos));
  }
}

void main() {
  test('HomeViewModel Test', () async {
    final container = ProviderContainer(
      overrides: [
        photoRepositoryProvider.overrideWithValue(FakePhotoRepositoryImpl())
      ],
    );
    final viewModel = container.read(homeViewModelProvider);
    await viewModel.fetchPhotos();
    expect(viewModel.photos, equals(Result.success(data: kDummyPhotos)));
  });
}
