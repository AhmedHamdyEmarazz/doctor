import 'package:doctor/auth/domain/onBoard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/presentation/screens/pageView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return BlocProvider(
        create: (context) => OnBoardCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PageViewOnBoarding(),
        ));
  }
}
