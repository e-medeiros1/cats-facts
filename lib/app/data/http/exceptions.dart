// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotFoundException implements Exception {
  final String message;
  NotFoundException({
    required this.message,
  });
}
