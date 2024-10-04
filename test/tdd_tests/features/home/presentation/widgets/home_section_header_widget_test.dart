import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/core/utils/enums/home_section_type.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_section_header_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    registerFallbackValue(ScheduleTestViewAllClickedEvent());
  });

  Widget createWidgetUnderTest({required String headerText, SectionType? sectionType}) {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: MaterialApp(
        home: Scaffold(
          body: HomeSectionHeaderWidget(
            headerText: headerText,
            sectionType: sectionType,
          ),
        ),
      ),
    );
  }

  testWidgets('HomeSectionHeaderWidget displays header text and button correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(headerText: 'Test Header', sectionType: SectionType.scheduledTest));

    expect(find.text('Test Header'), findsOneWidget);
    expect(find.text('View All (3)'), findsOneWidget);

    await tester.tap(find.text('View All (3)'));
    await tester.pump();
    verify(() => mockHomeBloc.add(any<ScheduleTestViewAllClickedEvent>())).called(1);
  });

  testWidgets('HomeSectionHeaderWidget does not display button when sectionType is null', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(headerText: 'Test Header', sectionType: null));

    expect(find.text('Test Header'), findsOneWidget);
    expect(find.text('View All (3)'), findsNothing);
  });

}
