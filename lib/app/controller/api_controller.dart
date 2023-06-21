// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cats_facts/app/data/http/exceptions.dart';
import 'package:flutter/material.dart';

import '../model/cat_model.dart';
import '../repository/cat_repository.dart';

class ApiController {
  final ICatRepository factRepository;
  ApiController({
    required this.factRepository,
  });

  final ValueNotifier<List<CatModel>> myList =
      ValueNotifier<List<CatModel>>([]);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<CatModel>> state = ValueNotifier<List<CatModel>>([]);

  final ValueNotifier<String> messageError = ValueNotifier<String>('');

  getFacts() async {
    isLoading.value = true;
    try {
      final result = await factRepository.getFacts();
      state.value = result;
      myList.value = result;
    } on NotFoundException catch (e) {
      messageError.value = e.message;
      log('Algo deu errado!');
    } catch (e) {
      messageError.value = e.toString();
    }
    isLoading.value = false;
  }

  shuffleList() {
    myList.value.shuffle();
  }
}
