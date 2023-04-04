import 'package:app/src/bloc/position/position_bloc.dart';
import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PositionBloc>(
            create: (BuildContext context) => PositionBloc()),
        BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc())
      ],
      child: const Navigation(),
    );
  }
}
