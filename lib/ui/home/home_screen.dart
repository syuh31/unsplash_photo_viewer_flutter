import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:unsplash_viewer_flutter/data/local/app_setting.dart';
import 'package:unsplash_viewer_flutter/data/model/photo.dart';
import 'package:unsplash_viewer_flutter/gen/assets.gen.dart';
import 'package:unsplash_viewer_flutter/ui/setting/setting_view_model.dart';

import 'home_view_model.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final photos =
        useProvider(homeViewModelProvider.select((value) => value.photos));
    final homeImageType = useProvider(settingViewModelProvider.select((value) => value.homeImageType));

    return OrientationBuilder(
      builder: (context, orientation) => (photos == null)
          ? const Center(child: CircularProgressIndicator())
          : photos.when(
              success: (data) {
                return StaggeredGridView.countBuilder(
                  crossAxisCount:
                      (MediaQuery.of(context).size.width / homeImageType.width).round(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => buildPhoto(data[index], homeImageType),
                  staggeredTileBuilder: (index) =>
                      // const StaggeredTile.fit(1),
                      // 'fit' is caused by layout error
                      // ref : https://stackoverflow.com/questions/66342262/how-can-i-achieve-staggered-grid-views-staggeredtile-fit-in-flutter
                      StaggeredTile.count(
                          1, data[index].height / data[index].width),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                );
              },
              failure: (e) => Center(
                child: Text(e.toString()),
              ),
            ),
    );
  }

  Widget buildPhoto(Photo photo, HomeImageType imageType) {
    if (photo.urls.thumb == null) {
      return Container();
    }

    final uri = Uri.parse(photo.urls.thumb!);

    final card = (uri.scheme == 'https' || uri.scheme == 'http')
        ? FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: imageType.getUrl(photo.urls)!,
          )
        : Assets.image.noImage.image();

    return card;
  }
}
