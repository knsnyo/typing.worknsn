import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/finish_dialog.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/viewmodel/word_view_model.dart';
import 'package:flutter/material.dart';

class Word extends StatefulWidget {
  const Word({super.key});

  @override
  State<Word> createState() => _WordState();
}

class _WordState extends State<Word> {
  final WordViewModel _wordViewModel = WordViewModel();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focus.unfocus();
    _wordViewModel.dispose();
    countViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _wordViewModel.init();
    return StreamBuilder(
      stream: _wordViewModel.wordStream,
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
                  Text(snapshot.data[0].word as String, textScaleFactor: 3),
                  TextFormField(
                    autofocus: true,
                    focusNode: _focus,
                    controller: _textEditingController,
                    textAlign: TextAlign.center,
                    onChanged: (value) async {
                      if (!stopwatch.isRunning) {
                        stopwatch.start();
                      }
                      if (_textEditingController.text ==
                          snapshot.data[0].word) {
                        await _wordViewModel.next();
                        countViewModel.increment = null;
                        countViewModel.total =
                            _textEditingController.text.length;
                        _textEditingController.text = '';
                      }
                      if (countViewModel.isMax()) {
                        showDialog<AlertDialog>(
                          barrierDismissible: false,
                          context: scaffoldKey.currentContext ?? context,
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
                snapshot.data[1].word as String,
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
