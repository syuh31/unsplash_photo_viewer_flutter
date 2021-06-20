import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unsplash_viewer_flutter/ui/home/home_screen.dart';
import 'package:unsplash_viewer_flutter/ui/home/home_view_model.dart';
import 'package:unsplash_viewer_flutter/ui/loading_state_view_model.dart';
import 'package:unsplash_viewer_flutter/ui/setting/setting_screen.dart';

class TopScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read(homeViewModelProvider);

    useMemoized(() {
      return context
          .read(loadingStateProvider)
          .whileLoading(homeViewModel.fetchPhotos);
    });

    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Unsplash photos'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              SettingScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
