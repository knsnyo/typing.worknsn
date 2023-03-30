import 'package:app/src/bloc/position_bloc.dart';
import 'package:app/src/components/count.dart';
import 'package:app/src/components/finish_dialog.dart';
import 'package:app/src/components/record.dart';
import 'package:flutter/material.dart';

late PositionBloc positionBloc;

class Position extends StatefulWidget {
  const Position({super.key});

  @override
  State<Position> createState() => _PositionState();
}

class _PositionState extends State<Position> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    positionBloc = PositionBloc();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    focus.unfocus();
    positionBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int arguments = ModalRoute.of(context)!.settings.arguments as int;
    positionBloc.init(arguments);
    return StreamBuilder(
      stream: positionBloc.position,
      builder: (context, snapshot) {
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
                  Text(snapshot.data[0].letter, textScaleFactor: 4.5),
                  Offstage(
                    offstage: true,
                    child: TextFormField(
                      autofocus: true,
                      focusNode: focus,
                      controller: textEditingController,
                      onChanged: (value) {
                        if (!stopwatch.isRunning) {
                          stopwatch.start();
                        }
                        if (textEditingController.text ==
                            snapshot.data[0].letter) {
                          positionBloc.next();
                          countBloc.increment();
                          countBloc.typing(1);
                        } else {
                          countBloc.decrement();
                        }
                        if (countBloc.getMax == countBloc.getCount) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                const FinishDialog(),
                          );
                        }
                        textEditingController.text = '';
                      },
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Text(
                snapshot.data[1].letter,
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
