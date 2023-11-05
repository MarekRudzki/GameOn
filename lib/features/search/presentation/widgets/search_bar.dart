import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTextFieldChanged;
  final Function() onIconTap;
  final Function() onTextFieldSubmitted;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onTextFieldChanged,
    required this.onIconTap,
    required this.onTextFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final searchTextFieldWidth = MediaQuery.sizeOf(context).width * 0.7;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 27, 62, 110),
          width: 7,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: searchTextFieldWidth,
            child: TextField(
              controller: controller,
              onChanged: (value) {
                onTextFieldChanged(value);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                border: InputBorder.none,
                hintText: 'Search for a game...',
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 27, 62, 110),
                ),
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              onSubmitted: (value) {
                onTextFieldSubmitted();
              },
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                onIconTap();
              },
              child: Container(
                height: 60,
                color: const Color.fromARGB(255, 27, 62, 110),
                child: const Icon(
                  Icons.search,
                  color: Colors.pinkAccent,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
