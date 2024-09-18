import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_disha_image_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(DishaBannerClickedEvent());
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: const MaterialApp(
        home: Scaffold(
          body: HomeDishaConfigImage(),
        ),
      ),
    );
  }

  testWidgets('HomeDishaConfigImage displays image', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(Image), findsOneWidget);
    expect(find.byWidgetPredicate(
          (widget) => widget is Image && widget.image == const AssetImage(AppIcons.dishaImage),
    ), findsOneWidget);
  });

  testWidgets('HomeDishaConfigImage triggers event on image tap', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    verify(() => mockHomeBloc.add(any<DishaBannerClickedEvent>())).called(1);
  });
}
