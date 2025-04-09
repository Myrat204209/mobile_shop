import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset(
            //     'assets/images/back.jpg',
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                BlocBuilder<ConnectionBloc, ConnectionState>(
                  builder: (context, state) {
                    // You might want this within a Scaffold or Stack
                    if (state is ConnectionOffline) {
                      return Container(
                        color: Colors.red,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'No Internet Connection',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else if (state is ConnectionOnline) {
                      // Optionally show connection type or just nothing
                      print("Connection Types: ${state.connectionType}");
                      return const SizedBox.shrink(); // Or display connection type info
                    } else {
                      // Initial or loading state
                      return const SizedBox.shrink(); // Or a loading indicator?
                    }
                  },
                ),
                // Example: Disabling a button
                BlocBuilder<ConnectionBloc, ConnectionState>(
                  builder: (context, state) {
                    final isOffline = state is ConnectionOffline;
                    return ElevatedButton(
                      // Disable onPressed if offline
                      onPressed:
                          isOffline
                              ? null
                              : () {
                                /* Make network call */
                              },
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
