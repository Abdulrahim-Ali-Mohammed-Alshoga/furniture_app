import 'package:get/get_utils/get_utils.dart';

class RadioOptionReport {
  final String value;
  final String title;

  RadioOptionReport({required this.value, required this.title});
}

List<RadioOptionReport> radioOptionsReport = [
  RadioOptionReport(value: '1', title: 'Standard'),
  RadioOptionReport(value: '2', title: 'Group By Category'),
  RadioOptionReport(value: '3', title: 'Group By Date'),
];

