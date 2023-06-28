abstract class CurrentTimeDatasource {
  Future<DateTime> get();
}

class CurrentTimeDatasourceImpl extends CurrentTimeDatasource {
  @override
  Future<DateTime> get() async {
    return DateTime.now();
  }
}