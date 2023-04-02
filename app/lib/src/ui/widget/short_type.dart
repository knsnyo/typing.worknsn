import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/finish_dialog.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/viewmodel/short_view_model.dart';
import 'package:flutter/material.dart';

class ShortType extends StatefulWidget {
  const ShortType({super.key});

  @override
  State<ShortType> createState() => _ShortTypeState();
}

class _ShortTypeState extends State<ShortType> {
  final ShortViewModel _shortViewModel = ShortViewModel();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _shortViewModel.init();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focus.unfocus();
    _shortViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _shortViewModel.shortStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                snapshot.data[0].short as String,
                textScaleFactor: 1.5,
              ),
            ),
            Flexible(
              flex: 1,
              child: TextFormField(
                autofocus: true,
                focusNode: _focus,
                controller: _textEditingController,
                textAlign: TextAlign.center,
                onChanged: (value) async {
                  if (!stopwatch.isRunning) {
                    stopwatch.start();
                  }
                  if (_textEditingController.text == snapshot.data[0].short) {
                    await _shortViewModel.next();
                    countViewModel.increment = null;
                    countViewModel.total = _textEditingController.text.length;
                    _textEditingController.text = '';
                  }
                  if (countViewModel.isMax()) {
                    showDialog<AlertDialog>(
                      barrierDismissible: false,
                      context: scaffoldKey.currentContext ?? context,
                      builder: (BuildContext context) => const FinishDialog(),
                    );
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
