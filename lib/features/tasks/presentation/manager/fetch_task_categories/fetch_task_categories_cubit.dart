import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_minder/core/entities/task_category_entity.dart';

import '../../../domain/use_cases/fetch_task_categories_usecase.dart';
import 'fetch_task_categories_state.dart';

class FetchTaskCategoriesCubit extends Cubit<FetchTaskCategoriesStates> {
  final FetchTaskCategoriesUseCase _fetchTaskCategoriesUseCase;
  FetchTaskCategoriesCubit(this._fetchTaskCategoriesUseCase)
      : super(FetchTaskCategoriesInitial());

  static FetchTaskCategoriesCubit of(context) => BlocProvider.of(context);

  List<TaskCategoryEntity> taskCategories = [];
  List<TaskCategoryEntity> get nonSmartTaskCategories =>
      taskCategories.where((taskCat) => !taskCat.isSmart).toList();
  Future<void> fetchTaskCategories() async {
    final result = await _fetchTaskCategoriesUseCase.execute();

    result.fold(
      (failure) {
        emit(FetchTaskCategoriesFailure(errorMessage: failure.errorMessage));
      },
      (taskCats) {
        taskCategories.clear();
        taskCategories.addAll(taskCats);
        emit(FetchTaskCategoriesSuccess(taskCats: taskCats));
      },
    );
  }
}
