import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          primary: true,
          centerTitle: true,
          title: Text('Home'),
          floating: true,
          backgroundColor: Colors.red,
          pinned: true,
          snap: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: ColoredBox(
              color: Colors.yellow,
              child: TextFormField(initialValue: 'Value'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              BlocBuilder<ConnectivityBloc, ConnectivityState>(
                builder: (context, state) {
                  // You might want this within a Scaffold or Stack
                  if (state is ConnectivityOffline) {
                    return Container(
                      color: Colors.red,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'No Internet Connectivity',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is ConnectivityOnline) {
                    return const SizedBox.shrink();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              BlocBuilder<ConnectivityBloc, ConnectivityState>(
                builder: (context, state) {
                  final isOffline = state is ConnectivityOffline;
                  return ElevatedButton(
                    onPressed: isOffline ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isOffline ? Colors.grey : Colors.blue,
                    ),
                    child: const Text('Submit Data'),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
