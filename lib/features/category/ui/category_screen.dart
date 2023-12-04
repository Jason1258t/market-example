import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/features/category/data/category_repository.dart';
import 'package:market/features/category/logic/cubit/category_cubit.dart';
import 'package:market/models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).loadCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Каталог"),
            ),
            body: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is CategorySuccess) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: buildCategoryWidget());
                } else {
                  return Center(
                    child: Text("Server error"),
                  );
                }
              },
            )),
      ),
    );
  }

  Widget buildCategoryWidget() {
    final categoryData = context.read<CategoryRepository>().categoryList;

    return GridView.builder(
        itemCount: categoryData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) =>
            CategoryItemWidget(category: categoryData[index]));
  }
}

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryItemWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                category.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/nature.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              right: 5,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Text(
                    "${category.fullName}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
