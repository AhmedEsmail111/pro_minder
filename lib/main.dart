import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locator/locator.dart';
import 'package:pro_minder/core/utils/router.dart';
import 'package:pro_minder/core/utils/services/database_service.dart';
import 'package:pro_minder/core/utils/services/shared_preferences.dart';
import 'package:pro_minder/core/utils/singletone_locator.dart';
import 'package:pro_minder/core/utils/theme.dart';

import 'features/tasks/domain/use_cases/fetch_task_categories_usecase.dart';
import 'features/tasks/presentation/manager/fetch_task_categories/fetch_task_categories_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initMain();
  runApp(const ProMinderApp());
}

class ProMinderApp extends StatelessWidget {
  const ProMinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchTaskCategoriesCubit(
        const Locator().get<FetchTaskCategoriesUseCase>(),
      )..fetchTaskCategories(),
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              theme: darkTheme,
            );
          }),
    );
  }
}

void initMain() async {
  registerSingletonsInstances();
  await ScreenUtil.ensureScreenSize();
  const locator = Locator();
  final dbService = locator.get<DatabaseService>();
  locator.get<CacheService>().init();
  await dbService.initDataBase();
}
