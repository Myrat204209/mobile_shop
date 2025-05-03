// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/core.dart';
import 'package:mobile_shop/features/features.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required Connectivity connectivity,
    required PreloaderRepository preloaderRepository,
  }) : _connectivity = connectivity,
       _preloaderRepository = preloaderRepository;

  final Connectivity _connectivity;
  final PreloaderRepository _preloaderRepository;
  @override
  Widget build(BuildContext context) {
    final connectivityBloc = ConnectivityBloc(connectivity: _connectivity);
    final preloaderBloc = PreloaderBloc(
      preloaderRepository: _preloaderRepository,
    )..add(PreloaderLoaded());
    // ..add(ConnectivityObserve());
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: connectivityBloc),
        BlocProvider.value(value: preloaderBloc),
      ],
      child: SafeArea(child: AppView()),
    );
  }
}
