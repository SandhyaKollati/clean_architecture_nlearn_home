import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/pages/home_list_screen.dart';
import '../../../tdd_tests/features/home/presentation/pages/home_list_screen_test.dart';

Future<void> iAmOnTheHomeListScreen(WidgetTester tester, MockHomeBloc mockHomeBloc) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<HomeBloc>.value(
        value: mockHomeBloc,
        child: const HomeListScreen(),
      ),
    ),
  );
}
