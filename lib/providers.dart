import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/api/api_service.dart';
import 'package:market/app.dart';
import 'package:market/features/category/data/category_repository.dart';
import 'package:market/features/category/logic/cubit/category_cubit.dart';
import 'package:market/features/products/data/products_repository.dart';
import 'package:market/features/products/logic/cubit/product_cubit.dart';
import 'package:market/features/products/logic/product_details/product_details_cubit.dart';

class MyRepositoryProvider extends StatelessWidget {
  MyRepositoryProvider({super.key});
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CategoryRepository(api: apiService),
          lazy: false,
        ),
        RepositoryProvider(
          create: (context) => ProductsRepository(api: apiService),
          lazy: false,
        ),
      ],
      child: MyBlocProvider(),
    );
  }
}

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) =>
              CategoryCubit(RepositoryProvider.of<CategoryRepository>(context)),
          lazy: false,
        ),
        BlocProvider(
          create: (context) =>
              ProductCubit(RepositoryProvider.of<ProductsRepository>(context)),
          lazy: false,
        ),
        BlocProvider(
          create: (context) =>
              ProductDetailsCubit(RepositoryProvider.of<ProductsRepository>(context)),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}
