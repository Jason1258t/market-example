import 'package:flutter/material.dart';
import 'package:market/features/category/ui/category_screen.dart';
import 'package:market/routes/route_names.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteNames.root: (context) => CategoryScreen(),
};
