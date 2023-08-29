/// The LocalFileService is used to read and write files to the local storage of the device.
/// Files will be stored in JSON format.
abstract class ILocalFileService {
  /// Initializes the local storage.
  Future<void> init();

  /// Gets all of the files in the local storage and returns the names of the files.
  Future<List<String>> getAllFileNames();

  /// Reads a file from the local storage and returns the contents of the file in JSON format
  Future<Map<String, dynamic>> readFile(String fileName);

  /// Reads all of the files from the local storage and returns the contents of the files in JSON format
  Future<List<Map<String, dynamic>>> readAll();

  /// Writes a file to the local storage, will transform the provided data into a JSON string.
  /// If the file already exists, this will overwrite it.
  Future<void> write(String fileName, Map<String, dynamic> data);

  /// Deletes a file from the local storage.
  Future<void> delete(String key);

  /// Deletes all of the files from the local storage.
  Future<void> deleteAll();
}
