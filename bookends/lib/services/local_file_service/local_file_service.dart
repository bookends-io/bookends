import 'dart:convert';

import 'package:bookends/services/local_file_service/i_local_file_service.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

class LocalFileService implements ILocalFileService {
  Directory _directory = Directory('');

  @override
  Future<void> init() async {
    if (kIsWeb) {
      return;
    }
    _directory = await getApplicationDocumentsDirectory();
  }

  @override
  Directory getSubdirectory(String subdirectory) {
    if (kIsWeb) {
      return Directory('');
    }

    final Directory d = Directory('${_directory.path}/$subdirectory');

    // If the dir doesn't exist, make it!
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }

    return d;
  }

  @override
  Future<List<String>> getAllFileNames({
    Directory? directory,
  }) async {
    if (kIsWeb) {
      return [];
    }

    final files = (directory ?? _directory).listSync();
    final List<String> fileNames = files
        .map(
          (file) => file.uri.pathSegments.last,
        )
        .toList();
    return fileNames;
  }

  @override
  Future<List<Map<String, dynamic>>> readAll({
    Directory? directory,
  }) async {
    if (kIsWeb) {
      return [];
    }

    List<Map<String, dynamic>> jsonList = [];
    final files = (directory ?? _directory).listSync();

    for (var file in files) {
      if (file is File) {
        String content = await File(file.path).readAsString();
        Map<String, dynamic> jsonContent = jsonDecode(content);
        jsonList.add(jsonContent);
      }
    }

    // print("JSON List: $jsonList");
    return jsonList;
  }

  @override
  Future<Map<String, dynamic>> readFile(
    String fileName, {
    Directory? directory,
  }) async {
    if (kIsWeb) {
      return {};
    }

    final Directory d = directory ?? _directory;
    final file = File('${d.path}/$fileName');
    if (!file.existsSync()) {
      return {};
    }
    String content = await file.readAsString();
    Map<String, dynamic> jsonContent = jsonDecode(content);
    return jsonContent;
  }

  @override
  Future<void> write(
    String fileName,
    Map<String, dynamic> data, {
    Directory? directory,
  }) async {
    if (kIsWeb) {
      return;
    }

    final Directory d = directory ?? _directory;
    final file = File('${d.path}/$fileName');
    String jsonStr = jsonEncode(data);
    await file.writeAsString(jsonStr);
  }

  @override
  Future<void> delete(
    String fileName, {
    Directory? directory,
  }) async {
    if (kIsWeb) {
      return;
    }

    final Directory d = directory ?? _directory;
    final file = File('${d.path}/$fileName');
    await file.delete();
  }

  @override
  Future<void> deleteAll() async {
    if (kIsWeb) {
      return;
    }

    final files = _directory.listSync();
    for (var file in files) {
      file.delete(recursive: true);
    }
  }
}
