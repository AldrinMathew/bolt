part of http;

class ServerOptions {
  ServerOptions({
    required this.backlog,
    required this.useIPv6Only,
    required this.isSharedServer,
  });
  final int backlog;
  final bool useIPv6Only;
  final bool isSharedServer;
}
