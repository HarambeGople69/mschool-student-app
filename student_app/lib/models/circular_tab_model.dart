import 'dart:io';

class CircularTabModel {
  final String title;
  final String circularFor;
  final String circularAdded;
  final File file;
  final String basename;

  CircularTabModel( {
    required this.title,
    required this.circularFor,
    required this.circularAdded,
    required this.file,
    required this.basename,
  });
}
