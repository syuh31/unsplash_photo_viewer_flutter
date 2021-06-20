import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unsplash_viewer_flutter/ui/home/home_view_model.dart';
import 'package:unsplash_viewer_flutter/data/model/result.dart';
import 'package:unsplash_viewer_flutter/app.dart';
import 'package:unsplash_viewer_flutter/ui/home/home_screen.dart';

import 'data/dummy_photos.dart';

class MockHomeViewModel extends Mock implements HomeViewModel {}

void main() {
  final mockHomeViewModel = MockHomeViewModel();
  when(mockHomeViewModel.fetchPhotos).thenAnswer((_) => Future.value());
  when(() => mockHomeViewModel.photos)
      .thenReturn(Result.success(data: kDummyPhotos));

  testWidgets('App widget test', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeViewModelProvider.overrideWithValue(mockHomeViewModel),
        ],
        child: App(),
      ),
    );
  });

  testWidgets('HomePage widget test', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeViewModelProvider.overrideWithValue(mockHomeViewModel),
        ],
        child: App(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(kDummyPhotos.length));
  });
}
