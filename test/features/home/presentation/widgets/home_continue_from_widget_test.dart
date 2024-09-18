import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_practice_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_video_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_continue_from_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(LearnVideoCardClickedEvent());
    registerFallbackValue(PracticeCardClickedEvent());
    registerFallbackValue(ViewMorePracticeClickedEvent());
  });

  final learnData = [
    const LearnData(videoName: 'video', chapterId: 'chapterId'),
  ];
  final practiceData = [
    const PracticeData(
      topicName: 'topic',
      chapterName: 'chapterName',
      completedQuestions: 0,
      totalQuestions: 0,
      subjectName: 'subjectName',
      subjectIcon: 'subjectIcon',
      practiceType: 'practiceType',
    ),
  ];

  Widget createWidgetUnderTest(List<LearnData> learnData, List<PracticeData> practiceData) {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: MaterialApp(
        home: Scaffold(
          body: HomeContinueFrom(
            learnList: learnData,
            practiceList: practiceData,
          ),
        ),
      ),
    );
  }

  testWidgets('HomeContinueFrom displays tabs and content correctly', (
      WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(learnData, practiceData));
    expect(find.text('Learn Videos'), findsOneWidget);
    expect(find.text('Practice'), findsOneWidget);

    await tester.tap(find.text('Learn Videos'));
    await tester.pumpAndSettle();
    expect(find.text('video'), findsOneWidget);

    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
    expect(find.text('topic'), findsOneWidget);
  });

  testWidgets('HomeContinueFrom triggers BLoC events on button taps', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(learnData, practiceData));

    await tester.tap(find.text('Learn Videos'));
    await tester.pumpAndSettle();

    final learnVideoDetector = find.byKey(const Key('learnVideo_0'));
    expect(learnVideoDetector, findsOneWidget);
    await tester.tap(learnVideoDetector);
    await tester.pumpAndSettle();
    verify(() => mockHomeBloc.add(any<LearnVideoCardClickedEvent>())).called(1);

    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();


    final practiceCardDetector = find.byKey(const Key('practiceCard_0'));
    expect(practiceCardDetector, findsOneWidget);
    await tester.tap(practiceCardDetector);
    await tester.pumpAndSettle(); // Ensure the event is processed
    verify(() => mockHomeBloc.add(any<PracticeCardClickedEvent>())).called(1);

    final viewMoreButton = find.byKey(const Key('viewMorePractice'));
    expect(viewMoreButton, findsOneWidget);

    await tester.tap(viewMoreButton);
    await tester.pumpAndSettle();
    verify(() => mockHomeBloc.add(any<ViewMorePracticeClickedEvent>())).called(1);
  });

  testWidgets('HomeContinueFrom handles empty lists gracefully', (
      WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      [],
      [],
    ));

    expect(find.byType(Tab), findsNothing);
    expect(find.text('video'), findsNothing);
    expect(find.text('topic'), findsNothing);
  });
}
