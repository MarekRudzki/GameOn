import 'package:flutter/material.dart';
import 'package:gameon/features/home_page/presentation/widgets/data_provider_button.dart';
import 'package:gameon/features/home_page/presentation/widgets/on_will_pop_alert_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool? exitResult = await showDialog(
          context: context,
          builder: (context) => const OnWillPopAlertDialog(),
        );
        return exitResult ?? false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 43, 42, 48),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Games',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                      Spacer(),
                      DataProviderButton()
                    ],
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 100,
                          height: 50,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
