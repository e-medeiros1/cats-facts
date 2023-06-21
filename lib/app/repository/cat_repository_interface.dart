import 'dart:convert';

import 'package:cats_facts/app/data/http/exceptions.dart';
import 'package:cats_facts/app/data/http/http_client.dart';

import '../model/cat_model.dart';
import 'cat_repository.dart';

class CatRepository implements ICatRepository {
  final IHttpClient client;

  CatRepository({required this.client});

  @override
  Future<List<CatModel>> getFacts() async {
    final response =
        await client.get(url: 'https://cat-fact.herokuapp.com/facts');
    if (response.statusCode == 200) {
      final List<CatModel> catFacts = [];

      final body = jsonDecode(response.body);

      body.map((item) {
        final CatModel catFact = CatModel.fromMap(item);
        catFacts.add(catFact);
      }).toList();

      return catFacts;
    } else if (response.status == 404) {
      throw NotFoundException(message: 'Bad request ${response.statusCode}');
    } else {
      throw Exception('Algo deu errado!');
    }
  }
}
