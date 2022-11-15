import 'package:flutter/material.dart';
import 'package:test_suitmedia/pages/second_page.dart';
import 'package:test_suitmedia/services/palyndrome_services.dart';
import 'package:test_suitmedia/utils/constants.dart';
import 'package:test_suitmedia/widgets/forms.dart';
import 'package:test_suitmedia/widgets/scaffold_messager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController palindromeController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            '${imageAssets}background_page_one.png',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(bottom: 58),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          '${imageAssets}photo_chooser.png',
                        ),
                      ),
                    ),
                  ),
                  CustomFormField(
                    controller: nameController,
                    hint: 'Name',
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomFormField(
                    hint: 'Palindrone',
                    controller: palindromeController,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 41,
                    child: ElevatedButton(
                      onPressed: () {
                        if (palindromeController.text.isNotEmpty) {
                          if (PalydromeServices.palyndromeTest(
                              text: palindromeController.text)) {
                            scaffoldMessage(
                                context: context,
                                message: 'is Palindrome',
                                color: Colors.green);
                          } else {
                            scaffoldMessage(
                                context: context,
                                message: 'Not Palindrome',
                                color: Colors.red);
                          }
                        } else {
                          scaffoldMessage(
                            context: context,
                            message: 'Please Fill Sentence',
                            color: Colors.red,
                          );
                        }
                      },
                      child: const Text('CHECK'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 41,
                    child: ElevatedButton(
                      onPressed: () {
                        if (nameController.text.isNotEmpty) {
                          Navigator.pushNamed(
                            context,
                            SecondPage.routeName,
                            arguments: {
                              'name': nameController.text,
                              'selected_name': '',
                            },
                          );
                        } else {
                          scaffoldMessage(
                            context: context,
                            message: 'Please Fill Name',
                            color: Colors.red,
                          );
                        }
                      },
                      child: const Text('NEXT'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
