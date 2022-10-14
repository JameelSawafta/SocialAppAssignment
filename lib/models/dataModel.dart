class DataModel {
  String? content;
  String? image;
  bool? isFavourite;
  DataUserModel? dataUserModel;
  DataModel({
    this.content,
    this.image,
    this.isFavourite = false,
    this.dataUserModel,
  });
  DataModel.fromJson(Map<String,dynamic> json){
    content = json['content'];
    image = json['image'];
    isFavourite = json['isFavourite'];
    dataUserModel = json['dataUserModel'] != null ? DataUserModel.fromJson(json['dataUserModel']) : null;
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['content'] = this.content;
    data['image'] = this.image;
    data['isFavourite'] = this.isFavourite;
    if(this.dataUserModel != null){
      data['dataUserModel'] = this.dataUserModel!.toJson();
    }
    return data;
  }

}

class DataUserModel {
  String? name;
  String? image;
  DataUserModel({
    this.name,
    this.image,
  });
  DataUserModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    image = json['image'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}