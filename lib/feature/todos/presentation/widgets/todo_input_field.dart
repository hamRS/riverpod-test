import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoInputfieldWidget extends StatelessWidget {
  const TodoInputfieldWidget({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Add todo',
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            height: 35,
            width: 35,
            child: IconButton.filled(
              iconSize: 20,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(60, 118, 181, 1),
                ),
              ),
              onPressed: onPressed,
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
