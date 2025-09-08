import 'package:get_it/get_it.dart';

import '../cubit/categories_cubit.dart';
import '../cubit/products_cubit.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ApiService>()),
  );

  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<ApiService>()),
  );
}
