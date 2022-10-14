import '../models/dataModel.dart';
import '../repository/dataRepository.dart';
import 'allData.dart';

class DataLocal extends DataRepository{
  @override
  List<DataModel> getAllData() {
    List<DataModel> data = [];
    data = allData;
    return data;
  }

  @override
  Future<List<DataModel>> getAllDataAPI() {
    // TODO: implement getAllDataAPI
    throw UnimplementedError();
  }
  /*
  @override
  Future<DataModel> getDataById(int id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }
  */
}