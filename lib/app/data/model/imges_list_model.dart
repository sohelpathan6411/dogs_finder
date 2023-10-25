class ImagesListModel {
  List<String>? message;
  String? status;

  ImagesListModel({this.message, this.status});

  ImagesListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    status = json['status'];
  }
}
