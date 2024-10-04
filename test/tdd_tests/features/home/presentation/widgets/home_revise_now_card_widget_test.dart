import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_revise_now_card_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(ReviseNowViewAllClickedEvent());
    registerFallbackValue(ReviseNowReviseLatestClickedEvent());
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: const MaterialApp(
        home: Scaffold(
          body: HomeReviseNowCardWidget(
            reviseNowResponse: PracticeReviseNowResponse(
              testsAttempted: 5,
              questionsToBeRevised: 10,
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('HomeReviseNowCardWidget displays correct information and interacts correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Revise your incorrectly answered & skipped questions'), findsOneWidget);
    expect(find.text('Tests Attempted'), findsOneWidget);
    expect(find.text('Questions To Be revised'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);

    expect(find.text('VIEW ALL'), findsOneWidget);
    expect(find.text('REVISE LATEST!'), findsOneWidget);

    await tester.tap(find.text('VIEW ALL'));
    await tester.pump();
    verify(() => mockHomeBloc.add(any<ReviseNowViewAllClickedEvent>())).called(1);

    await tester.tap(find.text('REVISE LATEST!'));
    await tester.pump();
    verify(() => mockHomeBloc.add(any<ReviseNowReviseLatestClickedEvent>())).called(1);
  });
}
