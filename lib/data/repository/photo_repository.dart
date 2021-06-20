import 'package:unsplash_viewer_flutter/data/model/photo.dart';
import 'package:unsplash_viewer_flutter/data/model/result.dart';

abstract class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos();
}
