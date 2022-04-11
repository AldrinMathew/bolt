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

  Future<void> _bind(dynamic host, int port) async {
    if (_sslOptions != null) {
      _server ??= await HttpServer.bindSecure(
        host,
        port,
        _sslOptions!._context,
        requestClientCertificate: _sslOptions!._requestClientCertificate,
        backlog: _options.backlog,
        shared: _options.isSharedServer,
        v6Only: _options.useIPv6Only,
      );
    } else {
      _server ??= await HttpServer.bind(host, port,
          backlog: _options.backlog,
          v6Only: _options.useIPv6Only,
          shared: _options.isSharedServer);
    }
  }
}
