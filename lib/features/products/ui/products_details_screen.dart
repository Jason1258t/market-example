import 'package:flutter/material.dart';
import 'package:market/features/products/data/products_repository.dart';
import 'package:market/features/products/logic/product_details/product_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/utils/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final category =
        (ModalRoute.of(context)!.settings.arguments as Map)['category'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("ТОВАР")),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductDetailsLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is ProductDetailsSuccessl) {
                  return buildProductInfoWidget(category);
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductInfoWidget(String category) {
    final product = context.read<ProductsRepository>().lastOpenedProduct;
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Image.network(
          product.imageUrl ?? deboshirUrl,
          width: double.infinity,
          height: size.width * 0.6,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              deboshirUrl,
              width: double.infinity,
              height: size.width * 0.6,
              fit: BoxFit.fill,
            );
          },
        ),
        Text(
          product.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(category,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        Text(product.productDescription,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
      ],
    );
  }
}
