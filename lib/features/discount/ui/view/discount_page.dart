import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/features/features.dart';

@RoutePage()
class DiscountPage extends StatelessWidget {
  const DiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreloaderBloc, PreloaderState>(
      builder: (context, state) {
        switch (state.status) {
          case PreloaderStatus.loading:
            return const Center(child: CircularProgressIndicator.adaptive());
          case PreloaderStatus.failure:
            return const Center(child: Text('Error'));
          case PreloaderStatus.success:
            return DiscountView(pageItem: state.preloadItem!.pages[2]);

          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
