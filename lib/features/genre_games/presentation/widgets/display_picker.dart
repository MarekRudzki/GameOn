// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/utils/custom_theme.dart';

class DisplayPicker extends StatelessWidget {
  final Function(int) callback;
  final int selectedIndex;

  const DisplayPicker({
    super.key,
    required this.callback,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Display options:',
          style: TextStyle(
            color: CustomTheme.theme.colorScheme.primary,
            fontSize: 17,
          ),
        ),
        Container(
          height: 40,
          width: MediaQuery.sizeOf(context).width * 0.35,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 31, 68, 121),
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
                    color: selectedIndex == 0
                        ? CustomTheme.theme.colorScheme.secondary
                        : Colors.grey,
                  ),
                  onTap: () {
                    callback(0);
                  },
                ),
                VerticalDivider(
                  color: CustomTheme.theme.colorScheme.primary,
                  thickness: 1.5,
                  endIndent: 7,
                  indent: 7,
                ),
                InkWell(
                  child: Icon(
                    Icons.view_agenda_outlined,
                    size: 28,
                    color: selectedIndex == 1
                        ? CustomTheme.theme.colorScheme.secondary
                        : Colors.grey,
                  ),
                  onTap: () {
                    callback(1);
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
