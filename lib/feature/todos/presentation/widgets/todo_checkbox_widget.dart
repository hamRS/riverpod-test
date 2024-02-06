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
  });

  final void Function() onChecked;
  final String todoLegend;
  final void Function() onDelete;

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
          }
          setState(() {
            checkboxArtboard = artboard;
            _isChecked?.value = !_isChecked!.value;
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
                      onTap: () {
                        setState(() {
                          _isChecked?.value = !_isChecked!.value;
                        });
                        widget.onChecked;
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
              style: const TextStyle(
                color: Color.fromRGBO(62, 102, 146, 1),
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
