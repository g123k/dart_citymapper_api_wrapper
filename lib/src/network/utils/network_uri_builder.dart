import 'package:path/path.dart';

class URIBuilder {
  final String _base;
  final String _path;
  final String _endpoint;
  final bool _https;
  final Map<String, dynamic> _queries;

  URIBuilder(String base, String basePath, String endPoint)
      : assert(base.isNotEmpty),
        assert(basePath.isNotEmpty),
        assert(endPoint.isNotEmpty),
        assert(base.startsWith('http')),
        _https = base.startsWith('https'),
        _base = _cleanBaseUrl(base),
        _path = basePath,
        _endpoint = endPoint,
        _queries = <String, dynamic>{};

  URIBuilder addQuery(String arg, dynamic value) {
    _queries[arg] = value.toString();
    return this;
  }

  Uri build() {
    if (_https) {
      return Uri.https(_base, join(_path, _endpoint), _queries);
    } else {
      return Uri.http(_base, join(_path, _endpoint), _queries);
    }
  }

  static String _cleanBaseUrl(String baseUrl) {
    String url = baseUrl.replaceFirst(RegExp(r'http[s]?://'), '');

    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }

    return url;
  }
}
