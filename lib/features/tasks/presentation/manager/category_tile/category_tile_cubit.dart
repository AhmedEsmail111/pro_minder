import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator/locator.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:pro_minder/core/utils/services/shared_preferences.dart';

import 'category_tile_state.dart';

class CategoryTileCubit extends Cubit<CategoryTileStates> {
  final CacheService _cacheService;
  CategoryTileCubit({required CacheService cacheService})
      : _cacheService = cacheService,
        super(CategoryTileInitial());

  static CategoryTileCubit of(BuildContext context) => BlocProvider.of(context);

  int selectedIndex = const Locator()
          .get<CacheService>()
          .getData(key: chosenCategoryTileIndex) ??
      0;

  String selectedCategoryName = 'Today';
  void changeCurrentSelectedCategory({required int index, required catName}) {
    selectedIndex = index;
    selectedCategoryName = catName;
    if (_cacheService.getData(key: chosenCategoryTileIndex) != selectedIndex) {
      _cacheService.saveData(
          key: chosenCategoryTileIndex, value: selectedIndex);
    }
    emit(ChangeSelectedCategory());
  }
}
