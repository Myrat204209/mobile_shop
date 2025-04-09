// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_shop/core/core.dart';

import 'app_view.dart';

class App extends StatelessWidget {
  const App({super.key, required Connectivity connectivity})
    : _connectivity = connectivity;

  final Connectivity _connectivity;
  @override
  Widget build(BuildContext context) {
    final connectionBloc = ConnectionBloc(connectivity: _connectivity)
      ..add(ConnectionObserve());
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: connectionBloc)],
      child: LayoutBuilder(
        builder: (context, constraints) => SafeArea(child: AppView()),
      ),
    );
  }
}
