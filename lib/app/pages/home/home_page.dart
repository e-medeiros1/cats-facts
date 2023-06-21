import 'package:cats_facts/app/controller/api_controller.dart';
import 'package:cats_facts/app/core/helper/size_extensions.dart';
import 'package:cats_facts/app/core/styles/colors_style.dart';
import 'package:cats_facts/app/core/styles/texts_style.dart';
import 'package:cats_facts/app/data/http/http_client.dart';
import 'package:cats_facts/app/repository/cat_repository_interface.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiController apiController =
      ApiController(factRepository: CatRepository(client: HttpClient()));

  @override
  void initState() {
    apiController.getFacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'CATS FACTS',
                  style: context.textsStyle.textTitle.copyWith(
                      fontSize: context.percentHeight(.07),
                      color: context.colors.white),
                ),
                Text(
                  'Discover a random (but important!) cat fact!',
                  style: context.textsStyle.textRegular.copyWith(
                      fontSize: context.percentHeight(.021),
                      color: context.colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: context.percentHeight(.20),
                  width: context.percentWidth(.70),
                  child: AnimatedBuilder(
                    animation: Listenable.merge([
                      apiController.isLoading,
                      apiController.state,
                      apiController.messageError,
                    ]),
                    builder: (context, child) {
                      if (apiController.isLoading.value == true) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (apiController.messageError.value.isNotEmpty) {
                        return Center(
                            child: Text(apiController.messageError.value));
                      }
                      if (apiController.state.value.isEmpty) {
                        return Center(
                            child: Text(
                          'Facts not found!',
                          style: context.textsStyle.textTitle.copyWith(
                              fontSize: context.percentHeight(.02),
                              color: context.colors.white),
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            final item = apiController.myList.value;

                            return Center(
                              child: Text(
                                item.first.text,
                                style: context.textsStyle.textMedium.copyWith(
                                  fontSize: context.percentHeight(.025),
                                  color: context.colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.colors.primary),
                        elevation: const MaterialStatePropertyAll(1),
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(15)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      setState(() {
                        apiController.shuffleList();
                      });
                    },
                    child: Text(
                      'Get a new fact!',
                      style: context.textsStyle.textRegular.copyWith(
                          fontSize: context.percentHeight(.03),
                          color: context.colors.white),
                    )),
                Image.asset('assets/images/cat.png',
                    fit: BoxFit.fitHeight, scale: 1.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
