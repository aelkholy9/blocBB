import 'package:bloc_breaking_bad/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    BreakingBadApp(
      appRouter: AppRouter(),
    ),
  );
}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;
  const BreakingBadApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
