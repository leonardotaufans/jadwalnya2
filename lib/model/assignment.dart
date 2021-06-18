class Assignment {
  final String id;
  final String name;
  final String desc;
  final String? imageUri; /// If there is image attachment
  final String dueDate;
  final String scheduleId;
  final bool isFinished;
  final String expiryDate;
  final String uploaderId;

  Assignment({required this.id, required this.name, required this.desc,
    required this.dueDate, required this.scheduleId, required this.isFinished,
    required this.expiryDate, required this.uploaderId, this.imageUri,}); /// Image Uri is not required. Duh.
}