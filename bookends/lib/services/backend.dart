import 'package:bookends/models/basic.dart';
import 'package:bookends/services/i_backend.dart';

class Backend extends IBackend {
  String _url = '';

  @override
  Future<bool> setup({
    required String url,
  }) async {
    _url = url;

    return true;
  }

  @override
  Future<List<Bookend>> getBookends() async {
    return [];
  }

  @override
  Future<List<Bookend>> getResponses() async {
    return [];
  }

  @override
  Future<bool> pushResponse(Bookend bookend) async {
    return true;
  }

  @override
  Future<String> getUserInfo() async {
    return '';
  }
}
