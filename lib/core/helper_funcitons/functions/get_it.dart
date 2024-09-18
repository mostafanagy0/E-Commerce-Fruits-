import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
import 'package:fruits_app/core/services/firestore_service.dart';
import 'package:fruits_app/features/auth/data/repos/auth_tepo_impl.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
        firebaseAuthService: getIt<FirebaseAuthService>(),
        dataBaseService: getIt<DataBaseService>()),
  );
}
