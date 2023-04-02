import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/finish_dialog.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/viewmodel/position_view_model.dart';
import 'package:flutter/material.dart';

class Position extends StatefulWidget {
  const Position({super.key});

  @override
  State<Position> createState() => _PositionState();
}

class _PositionState extends State<Position> {
  final PositionViewModel _positionViewModel = PositionViewModel();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focus.unfocus();
    _positionViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int arguments = ModalRoute.of(context)!.settings.arguments as int;
    _positionViewModel.init(arguments);
    return StreamBuilder(
      stream: _positionViewModel.positionStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(snapshot.data[0].letter as String, textScaleFactor: 4.5),
                  Offstage(
                    offstage: true,
                    child: TextFormField(
                      autofocus: true,
                      focusNode: _focus,
                      controller: _textEditingController,
                      onChanged: (value) async {
                        if (!stopwatch.isRunning) {
                          stopwatch.start();
                        }
                        if (_textEditingController.text ==
                            snapshot.data[0].letter) {
                          await _positionViewModel.next();
                          countViewModel.increment = null;
                          countViewModel.total = 1;
                        } else {
                          countViewModel.decrement = null;
                        }
                        if (countViewModel.isMax()) {
                          showDialog<AlertDialog>(
                            barrierDismissible: false,
                            context: scaffoldKey.currentContext ?? context,
                            builder: (BuildContext context) =>
                                const FinishDialog(),
                          );
                        }
                        _textEditingController.text = '';
                      },
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Text(
                snapshot.data[1].letter as String,
                textScaleFactor: 4.5,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }
}
