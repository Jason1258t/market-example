import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/api/api_service.dart';
import 'package:market/features/category/logic/cubit/category_cubit.dart';
import 'package:market/features/products/data/products_repository.dart';
import 'package:market/features/products/logic/cubit/product_cubit.dart';


final ApiService apiService = ApiService();

class MyRepositoryProvider extends StatelessWidget {
  const MyRepositoryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => (api: apiService),
          lazy: false,
        ),
        RepositoryProvider(
          create: (context) => ProductsRepository(api: apiService),
          lazy: false,
        ),
      ],
      child: Container(),
    );
  }
}

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
      ],
      child: Container(),
    );
  }
}
