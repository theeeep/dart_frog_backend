import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getUsers(),
    HttpMethod.post => _createUser(context),
    _ => Future.value(Response(body: 'Nothing to show'))
  };
}

Future<Response> _getUsers() async {
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

Future<Response> _createUser(RequestContext context) async {
  final json = (await context.request.json()) as Map<String, dynamic>;
  final name = json['name'];
  final lastName = json['lastName'];

  // TODO :  Insert user information into DB

  return Response.json(
    body: {
      'message': 'User Created!',
      'user': {
        'name': name,
        'lastName': lastName,
      },
    },
  );
}
