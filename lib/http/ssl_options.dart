part of http;

class SSLOptions {
  SSLOptions.file({
    required bool withTrustedRoots,
    required bool requestClientCertificate,
    required String certificateFile,
  })  : _requestClientCertificate = requestClientCertificate,
        _context = SecurityContext(withTrustedRoots: withTrustedRoots)
          ..setTrustedCertificates(certificateFile);

  final SecurityContext _context;

  final bool _requestClientCertificate;
}
