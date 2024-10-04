import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import '../../../tdd_tests/features/home/presentation/pages/home_list_screen_test.dart';

Future<void> theHomeScreenIsLoading(WidgetTester tester, MockHomeBloc mockHomeBloc) async {
  when(() => mockHomeBloc.state).thenReturn(HomeLoadingState());
}
