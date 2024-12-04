import 'package:food_ninja/core/api/end_points.dart';

class ErrorModel {
  final int statusCode;
  final String message;

  ErrorModel({required this.message, required this.statusCode});
  factory ErrorModel.fromJsom(Map<String, dynamic> jsonData) {
    return ErrorModel(
        message: jsonData[ApiKey.message],
        statusCode: jsonData[ApiKey.statusCode]);
  }
}
