import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_viewer_flutter/data/local/app_setting.dart';
import 'package:unsplash_viewer_flutter/ui/setting/setting_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final settingViewModel = context.read(settingViewModelProvider);
    final homeImageType = useProvider(
        settingViewModelProvider.select((value) => value.homeImageType));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(mainAxisSize: MainAxisSize.max,
            children: [
            const Text('home image size : '),
            DropdownButton<HomeImageType>(
              value: homeImageType,
              onChanged: (newValue) {
                settingViewModel.homeImageType = newValue!;
              },
              items: HomeImageType.values
                  .map<DropdownMenuItem<HomeImageType>>((value) {
                return DropdownMenuItem<HomeImageType>(
                  value: value,
                  child: Text(EnumToString.convertToString(value)),
                );
              }).toList(),
            ),],),
        ],
      ),
    );
  }
}
