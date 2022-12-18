import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santra_flutter_task/res/provider/bottom_nav_provider.dart';
import 'package:santra_flutter_task/utils/routes/routes.dart';
import 'package:santra_flutter_task/utils/routes/routes_name.dart';
import 'package:santra_flutter_task/view_model/home_view_model/home_view_model.dart';

import 'view_model/modifier_view_model/modifier_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ModifierViewModel()),
      ],
      child: MaterialApp( 
        title: 'Flutter Demo',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.homescreenroute,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
