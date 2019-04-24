import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class Storage {
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
}
