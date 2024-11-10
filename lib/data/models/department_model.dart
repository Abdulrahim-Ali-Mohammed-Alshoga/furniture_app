



import 'package:furniture_app/core/utils/utils1/extensions.dart';

import 'base_model.dart';

class DepartmentModel extends BaseModel {
  String? _departmentId;
  String? _departmentName;

  DepartmentModel({
    String? departmentId,
    String? departmentName,
  }) : super(id: departmentId, name: departmentName) {
    _departmentId = departmentId;
    _departmentName = departmentName;
  }

  String? get departmentId => _departmentId;

  String get departmentName => _departmentName.orEmpty;

  factory DepartmentModel.fromMap(Map<String, dynamic> json) => DepartmentModel(
        departmentId: json["departmentId"],
        departmentName: json["name"],
      );

  DepartmentModel copyWith({
    required String departmentName,
  }) {
    return DepartmentModel(
      departmentId: _departmentId,
      departmentName: departmentName,
    );
  }

  Map<String, dynamic> toMap() => {
        "departmentId": _departmentId,
        "name": _departmentName,
      };
}
