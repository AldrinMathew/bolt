part of http;

class BoltServer {
  /// BoltServer
  ///
  /// [options] is a set of options to configure the server's behaviour
  ///
  /// [ssl] represents all options associated with secure binding using SSL/TLS
  BoltServer({
    ServerOptions? options,
    SSLOptions? ssl,
  })  : _sslOptions = ssl,
        _options = options ??
            ServerOptions(
              backlog: 0,
              useIPv6Only: false,
              isSharedServer: false,
            );

  final ServerOptions _options;

  final SSLOptions? _sslOptions;

  HttpServer? _server;

  dynamic host;

  int? port;

  bool get listening => _server != null;
}
