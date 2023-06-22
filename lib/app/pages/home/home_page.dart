import 'package:cats_facts/app/controller/api_controller.dart';
import 'package:cats_facts/app/core/helper/size_extensions.dart';
import 'package:cats_facts/app/core/styles/colors_style.dart';
import 'package:cats_facts/app/core/styles/texts_style.dart';
import 'package:cats_facts/app/data/http/http_client.dart';
import 'package:cats_facts/app/pages/home/components/custom_text.dart';
import 'package:cats_facts/app/repository/cat_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'components/custom_elevated_button.dart';

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
                CustomText(
                    text: 'CATS FACTS', fontSize: context.percentHeight(.07)),
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
                        return Center(
                          child: Lottie.network(
                              'https://assets6.lottiefiles.com/packages/lf20_9zddpfah.json',
                              fit: BoxFit.cover,
                              height: context.percentHeight(.1)),
                        );
                      }
                      if (apiController.messageError.value.isNotEmpty) {
                        return Center(
                            child: Text(apiController.messageError.value));
                      }
                      if (apiController.state.value.isEmpty) {
                        return Center(
                          child: CustomText(
                            text: 'Facts not found!',
                            fontSize: context.percentHeight(.02),
                          ),
                        );
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
                CustomElevatedButton(onPressed: () {
                  setState(() {
                    apiController.shuffleList();
                  });
                }),
                Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_tr1pjkop.json',
                    fit: BoxFit.cover,
                    height: context.percentHeight(.4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
