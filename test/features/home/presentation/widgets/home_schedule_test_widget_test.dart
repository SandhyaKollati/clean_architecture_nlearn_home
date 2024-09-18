import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_scheduled_test_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_schedule_test_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(ScheduleTestNotifyMeClickedEvent());
    registerFallbackValue(ScheduleTestWarmUpClickedEvent());
  });

  const testResponse = [HomeGetScheduledTestResponse(
    examName: 'Sample Exam',
  )];

  Widget createWidgetUnderTest() {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: const MaterialApp(
        home: Scaffold(
          body: HomeScheduleTest(homeGetScheduledTestResponse: testResponse),
        ),
      ),
    );
  }

  testWidgets('HomeScheduleTest displays test information and buttons correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Sample Exam'), findsOneWidget);
    expect(find.text('60 Qs • 120 Mins • 120 Marks'), findsOneWidget);
    expect(find.text('Schedule From'), findsOneWidget);
    expect(find.text('Till'), findsOneWidget);
    expect(find.text('Warm-up Test'), findsOneWidget);
    expect(find.text('Notify Me'), findsOneWidget);
    await tester.tap(find.text('Warm-up Test'));
    await tester.pump();
    verify(() => mockHomeBloc.add(any<ScheduleTestNotifyMeClickedEvent>())).called(1);

    await tester.tap(find.text('Notify Me'));
    await tester.pump();
    verify(() => mockHomeBloc.add(any<ScheduleTestWarmUpClickedEvent>())).called(1);
  });

}
