import 'package:flutter/material.dart';
import 'package:test_suitmedia/pages/thrid_page.dart';
import 'package:test_suitmedia/shared/styles.dart';
import 'package:test_suitmedia/widgets/appbar.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.name, this.selectedName = ''});
  final String name;
  final String selectedName;
  static const String routeName = '/second-page';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainAppbar(title: 'Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: blackTextStyle.copyWith(
                    fontWeight: regular,
                  ),
                ),
                Text(
                  name,
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                selectedName.isEmpty ? 'Selected User Name' : selectedName,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 24,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: size.width,
                height: 41,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ThridPage.routeName,
                        arguments: name);
                  },
                  child: const Text('Choose a User'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
