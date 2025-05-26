// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_shop/features/app/router/router.dart';
import 'package:mobile_shop/features/product_details/product_details.dart';

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(right: 10),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
            ],
          ),
          backgroundColor: AppColors.iconColor.withValues(alpha: 0.009),
          body: Column(
            spacing: 10,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(aspectRatio: 31 / 32, child: FlutterLogo()),
                      ProductDetailsAdvantagesRow(),
                      Text(
                        'Томаты сливочных Круглое лето 600г',
                        style: AppTextStyle.text().xl().bold(),
                      ),
                      ProductDetailsRatingRow(),
                      ProductDetailsFavoriteButton(),

                      ProductDetailsSimilarList(),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 15),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          child: OutlinedButton(
            onPressed: () {
              context.router.push(CartRoute());
            },

            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: kCircular15Border),
              side: BorderSide(color: Colors.transparent),
              backgroundColor: AppColors.mainAccent,
              minimumSize: const Size(350, 50),
            ),
            child: Text(
              'Добавить в корзину',
              style: AppTextStyle.text().withColor(Colors.white),
            ),
          ).paddingSymmetric(horizontal: 15),
        ),
      ],
    );
  }
}
