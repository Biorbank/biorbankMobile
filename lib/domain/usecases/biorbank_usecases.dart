import 'package:biorbank/domain/repository/biorbank_repository.dart';

class AppUseCases {
  final AppRepository repository;

  AppUseCases(this.repository);

  Future<List<dynamic>> execute() {
    return repository.gettingData();
  }
}