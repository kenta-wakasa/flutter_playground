import 'dart:async';
import 'dart:convert';
import 'dart:io';

///This class allows you to create a simple server on `http://localhost:[port]/` in order to be able to load your assets file on a server. The default [port] value is `8080`.
class MyHttpServer {
  MyHttpServer({int port = 8080}) {
    _port = port;
  }
  HttpServer _server;
  int _port = 8080;

  final String _javaScript = ''
      'document.test_name = \'Hello Local Http Server\';\n'
      'document.my_name = \'kenta-wakasa\';\n';

  Future<void> start() async {
    if (_server != null) {
      throw Exception('Server already started on http://localhost:$_port');
    }

    final completer = Completer<String>();

    await runZoned(
      () async {
        _server = await HttpServer.bind('127.0.0.1', _port);
        _server.listen(
          (HttpRequest request) async {
            var path = request.requestedUri.path;
            print('New req: ${request.requestedUri}');
            path = (path.startsWith('/')) ? path.substring(1) : path;
            path += (path.endsWith('/')) ? 'index.html' : '';
            if (path == 'testdata') {
              request.response.headers.contentType =
                  ContentType('text', 'javascript', charset: 'utf-8');
              request.response.add(
                utf8.encode(_javaScript),
              );
              await request.response.close();
            } else {
              print('Not supported: $path');
              request.response.addError('Not supported: $path');
              await request.response.close();
              return;
            }
          },
        );
        completer.complete('complete!');
      },
    );
    runZonedGuarded(
      () {},
      (e, stackTrace) {
        print('Error: $e $stackTrace');
        completer.completeError('Error: $e $stackTrace');
      },
    );

    return completer.future;
  }

  ///Closes the server.
  Future<void> close() async {
    if (_server != null) {
      await _server.close(force: true);
      print('Server running on http://localhost:$_port closed');
      _server = null;
    }
  }

  String get address {
    return _server?.address?.address;
  }
}
