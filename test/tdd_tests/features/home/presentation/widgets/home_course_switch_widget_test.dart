import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_course_switch_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(CourseSwitchClickedEvent());
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<HomeBloc>.value(
        value: mockHomeBloc,
        child: const MaterialApp(
      home: Scaffold(body: HomeCourseSwitchWidget(title: 'Course Title')),
    ));
  }

  testWidgets('HomeCourseSwitchWidget displays title', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Course Title'), findsOneWidget);
  });

  testWidgets('HomeCourseSwitchWidget button contains correct icon', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    expect(find.byType(SvgPicture), findsOneWidget);
  });

  testWidgets('HomeCourseSwitchWidget triggers event on button press', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(() => mockHomeBloc.add(any<CourseSwitchClickedEvent>())).called(1);
  });
}
