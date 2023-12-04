import 'package:flutter/material.dart';
import 'package:market/routes/route_names.dart';
import 'package:market/routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LilShop",
         builder: (context, child) =>
          MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
    debugShowCheckedModeBanner: false,
    routes: appRoutes,
    initialRoute: RouteNames.root,
    );
  }
}