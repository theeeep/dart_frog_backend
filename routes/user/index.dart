import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return switch (context.request.method) {
    HttpMethod.get => _getUsers(),
    _ => Response(body: 'Nothing to show')
  };
}

Response _getUsers() {
  return Response.json(
    body: [
      {
        'name': 'Deepak',
        'lastName': 'Kumar',
      },
      {
        'name': 'Rishav',
        'lastName': 'Kumar',
      },
    ],
  );
}
