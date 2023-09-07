import 'package:universal_io/io.dart';

/// The LocalFileService is used to read and write files to the local storage of the device.
/// Files will be stored in JSON format.
abstract class ILocalFileService {
  /// Initializes the local storage.
  Future<void> init();

  /// Gets a subdirectory from the local storage.
  Directory getSubdirectory(String subdirectory);

  /// Gets all of the files in the local storage and returns the names of the files.
  Future<List<String>> getAllFileNames({
    Directory? directory,
  });

  /// Reads a file from the local storage and returns the contents of the file in JSON format
  Future<Map<String, dynamic>> readFile(
    String fileName, {
    Directory? directory,
  });

  /// Reads all of the files from the local storage and returns the contents of the files in JSON format
  Future<List<Map<String, dynamic>>> readAll({
    Directory? directory,
  });

  /// Writes a file to the local storage, will transform the provided data into a JSON string.
  /// If the file already exists, this will overwrite it.
  Future<void> write(
    String fileName,
    Map<String, dynamic> data, {
    Directory? directory,
  });

  /// Deletes a file from the local storage.
  Future<void> delete(
    String fileName, {
    Directory? directory,
  });

  /// Deletes all of the files and directories from the local storage.
  /// This should be used very carefully
  Future<void> deleteAll();
}
