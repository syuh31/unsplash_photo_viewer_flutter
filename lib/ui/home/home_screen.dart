import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:unsplash_viewer_flutter/data/model/photo.dart';
import 'package:unsplash_viewer_flutter/gen/assets.gen.dart';
import 'package:unsplash_viewer_flutter/ui/loading_state_view_model.dart';
import 'package:unsplash_viewer_flutter/foundation/extension/async_snapshot.dart';

import 'home_view_model.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read(homeViewModelProvider);
    final photos =
        useProvider(homeViewModelProvider.select((value) => value.photos));

    final photosFuture = useMemoized(() {
      return context
          .read(loadingStateProvider)
          .whileLoading(homeViewModel.fetchPhotos);
    }, [photos?.toString()]);

    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            title: const Text('Unsplash photos'),
          ),
          body: FutureBuilder(
            future: photosFuture,
            builder: (context, snapshot) => (snapshot.isWaiting ||
                    photos == null)
                ? const Center(child: CircularProgressIndicator())
                : photos.when(
                    success: (data) {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width / 200).round(),
                        itemCount: data.length,
                        itemBuilder: (context, index) =>
                            buildPhoto(data[index]),
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
          ),
        ),
      ),
    );
  }

  Widget buildPhoto(Photo photo) {
    if (photo.urls.thumb == null) {
      return Container();
    }

    final uri = Uri.parse(photo.urls.thumb!);

    final card = (uri.scheme == 'https' || uri.scheme == 'http')
        ? FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: photo.urls.thumb!,
          )
        : Assets.image.noImage.image();

    return card;
  }
}
