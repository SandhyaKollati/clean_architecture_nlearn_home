import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_just_for_you_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(WarmUpTestClickedEvent());
    registerFallbackValue(ReviseNowClickedEvent());
    registerFallbackValue(InteractiveScrollsClickedEvent());
  });

  Widget createWidgetUnderTest({
    required bool warmUpTestStatus,
    required bool reviseNowStatus,
    required bool interactiveScrollStatus,
  }) {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: MaterialApp(
        home: Scaffold(
          body: HomeJustForYouWidget(
            warmUpTestStatus: warmUpTestStatus,
            reviseNowStatus: reviseNowStatus,
            interactiveScrollStatus: interactiveScrollStatus,
          ),
        ),
      ),
    );
  }

  const warmUpTestImageLabel = "Warm Up Test Image";
  const reviseNowLabel = "Revise Now Image";
  const interactiveScrollImage = "Interactive Scroll Image";

  testWidgets('HomeJustForYouWidget displays all images if all statuses are false', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: false,
      reviseNowStatus: false,
      interactiveScrollStatus: false,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == warmUpTestImageLabel,
    ), findsOneWidget);
    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == reviseNowLabel,
    ), findsOneWidget);
    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == interactiveScrollImage,
    ), findsOneWidget);
  });

  testWidgets('HomeJustForYouWidget displays all images if all statuses are true', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: true,
      interactiveScrollStatus: true,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == warmUpTestImageLabel,
    ), findsNothing);
    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == reviseNowLabel,
    ), findsNothing);
    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == interactiveScrollImage,
    ), findsNothing);
  });

  testWidgets('HomeJustForYouWidget displays warm up test image if warmUpTestStatus is false', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: false,
      reviseNowStatus: true,
      interactiveScrollStatus: true,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == warmUpTestImageLabel,
    ), findsOneWidget);
  });

  testWidgets('HomeJustForYouWidget does not display warm up test image if warmUpTestStatus is true', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: false,
      interactiveScrollStatus: false,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == warmUpTestImageLabel,
    ), findsNothing);
  });

  testWidgets('HomeJustForYouWidget displays revise now image if reviseNowStatus is false', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: false,
      interactiveScrollStatus: true,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == reviseNowLabel,
    ), findsOneWidget);
  });

  testWidgets('HomeJustForYouWidget does not display revise now image if reviseNowStatus is true', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: true,
      interactiveScrollStatus: false,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == reviseNowLabel,
    ), findsNothing);
  });

  testWidgets('HomeJustForYouWidget displays interactive scroll image if interactiveScrollStatus is false', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: true,
      interactiveScrollStatus: false,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == interactiveScrollImage,
    ), findsOneWidget);
  });

  testWidgets('HomeJustForYouWidget does not display interactive scroll image if interactiveScrollStatus is true', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: true,
      interactiveScrollStatus: true,
    ));

    expect(find.byWidgetPredicate(
          (widget) => widget is SvgPicture && widget.semanticsLabel == interactiveScrollImage,
    ), findsNothing);
  });

  testWidgets('warm up image triggers WarmUpTestClickedEvent on image tap', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: false,
      reviseNowStatus: true,
      interactiveScrollStatus: true,
    ));

    final warmUpTestFinder = find.byWidgetPredicate(
          (widget) => widget is GestureDetector &&
          (widget.child as SvgPicture).semanticsLabel == warmUpTestImageLabel,
    );
    expect(warmUpTestFinder, findsOneWidget);

    await tester.tap(warmUpTestFinder);
    await tester.pump();

    verify(() => mockHomeBloc.add(any<WarmUpTestClickedEvent>())).called(1);
  });

  testWidgets('Revise NOW image triggers ReviseNowClickedEvent on image tap', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: false,
      interactiveScrollStatus: true,
    ));

    final reviseNowFinder = find.byWidgetPredicate(
          (widget) => widget is GestureDetector &&
          (widget.child as SvgPicture).semanticsLabel == reviseNowLabel,
    );
    expect(reviseNowFinder, findsOneWidget);

    await tester.tap(reviseNowFinder);
    await tester.pump();

    verify(() => mockHomeBloc.add(any<ReviseNowClickedEvent>())).called(1);
  });

  testWidgets('Interactive scroll image triggers InteractiveScrollsClickedEvent on image tap', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      warmUpTestStatus: true,
      reviseNowStatus: true,
      interactiveScrollStatus: false,
    ));

    final interactiveScrollFinder = find.byWidgetPredicate(
          (widget) => widget is GestureDetector &&
          (widget.child as SvgPicture).semanticsLabel == interactiveScrollImage,
    );
    expect(interactiveScrollFinder, findsOneWidget);

    await tester.tap(interactiveScrollFinder);
    await tester.pump();

    verify(() => mockHomeBloc.add(any<InteractiveScrollsClickedEvent>())).called(1);
  });
}
