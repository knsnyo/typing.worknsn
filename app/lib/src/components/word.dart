import 'package:app/src/components/count.dart';
import 'package:app/src/components/finish_dialog.dart';
import 'package:app/src/components/record.dart';
import 'package:flutter/material.dart';
import 'package:app/src/bloc/word_bloc.dart';

late WordBloc wordBloc;

class Word extends StatefulWidget {
  const Word({super.key});

  @override
  State<Word> createState() => _WordState();
}

class _WordState extends State<Word> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    wordBloc = WordBloc();
    wordBloc.init();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    focus.unfocus();
    wordBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: wordBloc.word,
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
                  Text(snapshot.data[0].word, textScaleFactor: 3),
                  TextFormField(
                    autofocus: true,
                    focusNode: focus,
                    controller: textEditingController,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (!stopwatch.isRunning) {
                        stopwatch.start();
                      }
                      if (textEditingController.text == snapshot.data[0].word) {
                        wordBloc.next();
                        countBloc.increment();
                        countBloc.typing(textEditingController.text.length);
                        textEditingController.text = '';
                      }
                      if (countBloc.getMax == countBloc.getCount) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const FinishDialog(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            Flexible(
              child: Text(
                snapshot.data[1].word,
                textScaleFactor: 3,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }
}
