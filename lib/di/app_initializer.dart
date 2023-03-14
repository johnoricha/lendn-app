import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/sign_in/sign_in_cubit.dart';
import '../core/sign_in/sign_in_state.dart';
import '../core/sign_up/sign_up_cubit.dart';
import '../core/sign_up/sign_up_state.dart';
import '../data/local/local_storage.dart';

class AppInitializer {
  static late GetIt getIt;

  AppInitializer._();

  static void close() {
    getIt.reset();
  }

  static void create() {
    _initStates();
    _initRepos();
    _initNotifiers();
    _initBlocs();
    _initBuilder();
  }

  static dynamic initGetIt() {
    getIt = GetIt.I;
    create();
  }

  static dynamic logout() async {
    try {
      await getIt.reset();
      await initGetIt();
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // logger.d(e);
    }
  }

  static void _initStates() {
    getIt.registerLazySingleton(() => const SignInState());
    getIt.registerLazySingleton(() => const SignUpState());
  }

  static void _initBlocs() {

    getIt.registerLazySingleton(
      () => SignInCubit(
        AppInitializer.getIt<SignInState>(),
        AppInitializer.getIt<LocalStorage>(),
      ),
    );

    getIt.registerLazySingleton(
      () => SignUpCubit(
        AppInitializer.getIt<SignUpState>(),
        AppInitializer.getIt<LocalStorage>(),
      ),
    );
  }

  static void disposeInstance<T extends Cubit<T>>(T cubitInstance) {
    getIt.unregister(instance: cubitInstance);
  }

  static void _initNotifiers() {}

  static void _initRepos() {
    getIt.registerLazySingleton(() => LocalStorage());
  }

static void _initBuilder() {
  // getIt.registerLazySingleton(() => GlobalBuilder());
}
}
