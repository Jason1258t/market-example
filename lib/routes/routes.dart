import 'package:flutter/material.dart';
import 'package:market/features/category/ui/category_screen.dart';
import 'package:market/features/products/ui/products_details_screen.dart';
import 'package:market/features/products/ui/products_screen.dart';
import 'package:market/routes/route_names.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteNames.root: (context) => CategoryScreen(),
  RouteNames.product: (context) => ProductListScreen(),
  RouteNames.productDetails: (context) => ProductDetailsScreen()
};
