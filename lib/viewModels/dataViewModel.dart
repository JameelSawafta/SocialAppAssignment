import '../models/dataModel.dart';

class DataViewModel {
  DataModel? dataModel;
  DataViewModel({this.dataModel});

  get content => dataModel?.content;
  get image => dataModel?.image;
  get isFavourite => dataModel?.isFavourite;
  get dataUserModel => dataModel?.dataUserModel;

}