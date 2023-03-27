import 'package:app/src/bloc/short_bloc.dart';
import 'package:app/src/components/count.dart';
import 'package:app/src/components/record.dart';
import 'package:flutter/material.dart';

late ShortBloc shortBloc;

class ShortType extends StatefulWidget {
  const ShortType({super.key});

  @override
  State<ShortType> createState() => _ShortTypeState();
}

class _ShortTypeState extends State<ShortType> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    shortBloc = ShortBloc();
    shortBloc.init();
  }

  @override
  void dispose() {
    super.dispose();
    shortBloc.dispose();
    textEditingController.dispose();
    focus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: shortBloc.short,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                snapshot.data[0].short,
                textScaleFactor: 1.5,
              ),
            ),
            Flexible(
              flex: 1,
              child: TextFormField(
                autofocus: true,
                focusNode: focus,
                controller: textEditingController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (!stopwatch.isRunning) {
                    stopwatch.start();
                  }
                  if (textEditingController.text == snapshot.data[0].short) {
                    shortBloc.next();
                    textEditingController.text = '';
                    countBloc.increment();
                  }
                  if (countBloc.getMax == countBloc.getCount) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                'NEXT: ${snapshot.data[1].short}',
                style: const TextStyle(color: Colors.grey),
                textScaleFactor: 1.5,
              ),
            ),
          ],
        );
      },
    );
  }
}
