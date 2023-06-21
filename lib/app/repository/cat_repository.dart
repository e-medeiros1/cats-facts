import 'package:cats_facts/app/model/cat_model.dart';

abstract class ICatRepository {
  Future<List<CatModel>>getFacts();
}

