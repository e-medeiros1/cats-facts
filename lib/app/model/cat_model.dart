// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatModel {
  final String text;
  CatModel({
    required this.text,
  });

  factory  CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(text: map['text'] ?? '' );
  }
}
