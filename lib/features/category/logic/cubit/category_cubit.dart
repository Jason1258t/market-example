import 'package:bloc/bloc.dart';
import 'package:market/features/category/data/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  Future<void> loadCategoryList() async {
    emit(CategoryLoading());

    try {
      await categoryRepository.loadCategoryList();
      print(categoryRepository.categoryList);
      emit(CategorySuccess());
    } catch (e) {
      print(e);
      emit(CategoryFailure());
    }
  }
}
