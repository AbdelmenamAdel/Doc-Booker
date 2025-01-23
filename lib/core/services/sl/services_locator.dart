import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:markaz_elamal/core/app/app_cubit/app_cubit.dart';
import 'package:markaz_elamal/core/database/api/api_consumer.dart';
import 'package:markaz_elamal/core/database/api/dio_consumer.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  _initCore();
}

void _initCore() {
  sl
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(() => AppCubit());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
}
