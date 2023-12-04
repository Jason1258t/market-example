import 'package:flutter/material.dart';
import 'package:market/features/products/data/products_repository.dart';
import 'package:market/features/products/logic/cubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/models/product.dart';
import 'package:market/routes/route_names.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Товары. Категория: "),
          ),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is ProductSuccess) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: buildProductsList());
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildProductsList() {
    final productsList = context.read<ProductsRepository>().currentProductList;

    return ListView.separated(
        itemBuilder: (context, index) => ProductPreviewWidget(
              product: productsList[index],
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: productsList.length);
  }
}

class ProductPreviewWidget extends StatelessWidget {
  final ProductModel product;

  const ProductPreviewWidget({
    super.key,
    required this.product,
  });
  final deboshirUrl =
      "https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/865d2d0e-bac6-4a78-a0ed-17a87b285069/220x330";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteNames.productDetails);
      },
      child: Container(
          clipBehavior: Clip.hardEdge,
          width: size.width * 0.8,
          height: size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text("${product.price} EMRLD",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500))
            ],
          )),
    );
  }
}
