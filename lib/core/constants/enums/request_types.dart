enum RequestTypes {
  post,
  get,
  put,
  delete,
}

extension NetworkTypeExtension on RequestTypes? {
  String get value {
    switch (this) {
      case RequestTypes.get:
        return 'GET';
      case RequestTypes.post:
        return 'POST';
      case RequestTypes.put:
        return 'PUT';
      case RequestTypes.delete:
        return 'DELETE';
      default:
        return 'ERROR';
    }
  }
}
