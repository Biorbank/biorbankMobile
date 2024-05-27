import 'package:biorbank/data/datasources/biorbank_datasource.dart';
import 'package:biorbank/domain/repository/biorbank_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final AppDataSource dataSource;

  AppRepositoryImpl(this.dataSource);

  @override
  Future<List<dynamic>> gettingData() {
    return dataSource.getData();
  }
}