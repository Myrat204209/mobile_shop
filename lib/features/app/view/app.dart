import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SubjectBloc()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) => SafeArea(child: AppView()),
      ),
    );
  }
}
