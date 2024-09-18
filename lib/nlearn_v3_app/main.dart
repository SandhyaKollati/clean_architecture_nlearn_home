import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nlearn_v3_home/config/routes/routes.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import '../config/routes/routes_name.dart';
import '../core/utils/constants/app_strings.dart';
import 'init_dependencies.dart';

void main() {
  // debugPaintSizeEnabled = true;
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => createHomeBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(fontFamily: "Quicksand", useMaterial3: false),
        onGenerateRoute: AppRouterSettings().generateRouter,
        initialRoute: AppRouter.home.name,
      ),
    );
  }
}

HomeBloc createHomeBloc() {
  return serviceLocator<HomeBloc>();
}
