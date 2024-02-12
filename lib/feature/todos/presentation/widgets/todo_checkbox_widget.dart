import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class TodoCheckboxWidget extends StatefulWidget {
  const TodoCheckboxWidget({
    super.key,
    required this.onChecked,
    required this.todoLegend,
    required this.onDelete,
    this.defaultValue = false,
  });

  final void Function() onChecked;
  final String todoLegend;
  final void Function() onDelete;
  final bool defaultValue;

  @override
  State<TodoCheckboxWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoCheckboxWidget> {
  Artboard? checkboxArtboard;
  SMIBool? _isChecked;

  @override
  void initState() {
    rootBundle.load('assets/animations/animated_checkbox.riv').then(
      (value) async {
        try {
          final file = RiveFile.import(value);
          final artboard = file.mainArtboard;
          var controller = StateMachineController.fromArtboard(
            artboard,
            'onTapState',
          );
          if (controller != null) {
            artboard.addController(controller);
            _isChecked = controller.findSMI('checkButton');

            if (!widget.defaultValue) {
              _isChecked?.value = !_isChecked!.value;
            }
          }
          setState(() {
            checkboxArtboard = artboard;
          });
        } catch (e) {
          throw UnimplementedError();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: checkboxArtboard == null
                  ? SizedBox()
                  : InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onTap: () async {
                        widget.onChecked();
                      },
                      child: Rive(
                        artboard: checkboxArtboard!,
                      ),
                    ),
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              widget.todoLegend,
              style: TextStyle(
                decoration: _isChecked != null && _isChecked!.value
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: _isChecked != null && !_isChecked!.value
                    ? Color.fromRGBO(62, 102, 146, 1)
                    : Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: widget.onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
