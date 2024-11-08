import 'package:locator/locator.dart';
import 'package:pro_minder/core/utils/services/database_service.dart';
import 'package:pro_minder/core/utils/services/shared_preferences.dart';
import 'package:pro_minder/features/tasks/data/data_sources/local_tasks_data_source.dart';
import 'package:pro_minder/features/tasks/data/repos/tasks_repo_impl.dart';
import 'package:pro_minder/features/tasks/domain/use_cases/fetch_all_tasks_usecase.dart';
import 'package:pro_minder/features/tasks/domain/use_cases/fetch_task_categories_usecase.dart';

void registerSingletonsInstances() {
  const Locator locator = Locator();

  locator.put<DatabaseService>(DatabaseService());
  locator.put<CacheService>(CacheService());
  locator.put<TasksRepoImpl>(TasksRepoImpl(
    localTasksDataSource: LocalTasksDataSourceImpl(
      dbService: locator.get<DatabaseService>(),
    ),
  ));
  locator.put<FetchTaskCategoriesUseCase>(
    FetchTaskCategoriesUseCase(
      tasksRepo: const Locator().get<TasksRepoImpl>(),
    ),
  );
  locator.put<FetchAllTasksUseCase>(
    FetchAllTasksUseCase(
      tasksRepo: const Locator().get<TasksRepoImpl>(),
    ),
  );
}
