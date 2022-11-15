import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_suitmedia/cubits/list_users_cubit/list_users_cubit.dart';
import 'package:test_suitmedia/pages/home_page.dart';
import 'package:test_suitmedia/services/api_services.dart';
import 'package:test_suitmedia/shared/styles.dart';
import 'package:test_suitmedia/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ApiServices apiServices = ApiServices();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListUsersCubit(apiServices)..fetchUsers(),
        )
      ],
      child: MaterialApp(
        title: 'Test Suitmedia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.5,
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: whiteTextStyle.copyWith(fontSize: 14),
            ),
          ),
        ),
        home: const HomePage(),
        onGenerateRoute: mainRoutes,
      ),
    );
  }
}
