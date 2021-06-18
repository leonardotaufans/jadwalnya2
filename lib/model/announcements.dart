import 'package:flutter/material.dart';

class Announcements {
  final String id;
  final String name, uid, postDate, contentText;
  final String? profileUri, imageUri;

  Announcements(
      {required this.id,
      required this.name,
      required this.uid,
      required this.postDate,
      required this.contentText,
      this.profileUri,
      this.imageUri});
}
