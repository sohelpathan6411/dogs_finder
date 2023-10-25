class RandomImageModel {
  String? message;
  String? status;

  RandomImageModel({this.message, this.status});

  RandomImageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}
