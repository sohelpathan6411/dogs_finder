class BreedModel {
  Map<String, dynamic>? message;
  String? status;

  BreedModel({this.message, this.status});

  BreedModel.fromJson(Map<String, dynamic> json) {
    if (json['message'] is Map) {
      message = json['message'];
    }
    if (json['status'] is String) {
      status = json['status'];
    }
  }
}
