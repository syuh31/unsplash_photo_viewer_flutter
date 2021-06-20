import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unsplash_viewer_flutter/data/model/photo.dart';
import 'package:unsplash_viewer_flutter/data/unsplash_client.dart';

part 'photo_data_source.g.dart';

final photoDataSourceProvider = Provider((ref) => PhotoDataSource(ref.read));

@RestApi()
abstract class PhotoDataSource {
  factory PhotoDataSource(Reader reader) =>
      _PhotoDataSource(reader(unsplashClientProvider));

  @GET('/photos')
  Future<List<Photo>> getPhotos();
}
