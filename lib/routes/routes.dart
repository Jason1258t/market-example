import 'package:flutter/material.dart';
import 'package:market/features/category/ui/catalog_screen.dart';
import 'package:market/routes/route_names.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteNames.root: (context) => CategoryScreen(),
};
