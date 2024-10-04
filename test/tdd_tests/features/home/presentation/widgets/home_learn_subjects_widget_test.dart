import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_subjects_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_learn_subjects_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  final testData = List.generate(3, (index) => HomeGetLearnSubjectListResponse(subjectName: 'Subject $index'));

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(LearnSubjectCardClickedEvent(subject: testData[0]));
  });


  Widget createWidgetUnderTest() {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 200,
            child: HomeLearnSubjects(data: testData),
          ),
        ),
      ),
    );
  }

  testWidgets('HomeLearnSubjects displays subjects and interacts correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(HomeLearnSubjects), findsOneWidget);
    expect(find.byType(SvgPicture), findsNWidgets(testData.length));
    expect(find.byType(Text), findsNWidgets(testData.length));

    final gestureDetectorFinder = find.byType(GestureDetector).first;
    await tester.tap(gestureDetectorFinder);
    await tester.pump();

    verify(() => mockHomeBloc.add(any<LearnSubjectCardClickedEvent>())).called(1);
  });
}

