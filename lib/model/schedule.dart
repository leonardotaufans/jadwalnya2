import 'package:jadwalnya/model/assignment.dart';

class Schedule {
  final String id;
  final String name;
  final String day;
  final String startTime, endTime;
  final String location;
  final String? color, altName;
  final String? imageUri;
  final List<Assignment>? assignment;
  Schedule({required this.id, required this.name, required this.day,
            required this.startTime, required this.endTime,
            required this.location,
            this.color, this.altName, this.imageUri, this.assignment}); /// If there is imageUri, no need for color/altName

  getAssignmentAmount() {
    return assignment!.length;
  }
}