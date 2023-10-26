import 'package:flutter/material.dart';

class DisplayOptions extends StatefulWidget {
  const DisplayOptions({super.key});

  @override
  State<DisplayOptions> createState() => _DisplayOptionsState();
}

class _DisplayOptionsState extends State<DisplayOptions> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 58, 57, 65),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Icon(
                Icons.grid_view,
                size: 30,
                color: selectedIndex == 0 ? Colors.pinkAccent : Colors.grey,
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            const VerticalDivider(
              color: Colors.white,
              thickness: 1.8,
              endIndent: 7,
              indent: 7,
            ),
            InkWell(
              child: Icon(
                Icons.view_agenda_outlined,
                size: 28,
                color: selectedIndex == 1 ? Colors.pinkAccent : Colors.grey,
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
