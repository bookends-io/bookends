import 'package:bookends/models/basic.dart';

abstract class IBackend {
  Future<bool> setup({
    required String url,
  });

  Future<List<Bookend>> getBookends();

  Future<List<Response>> getResponses();

  Future<bool> pushResponse(Response response);

  Future<String> getUserInfo();
}
