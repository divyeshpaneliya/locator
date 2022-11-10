import 'package:flutter/material.dart';
import 'package:locator/Screens/home_screen/view.dart';
import 'package:provider/provider.dart';

import 'Screens/home_screen/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Class_Provider>(create: (context)=>Class_Provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>home(),
        },
      ),
    ),
  );
}
