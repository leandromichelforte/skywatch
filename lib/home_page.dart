import 'package:flutter/material.dart';

import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/resources.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          IconPaths.logo,
        ),
        const SizedBox(height: SizeConstants.xxxlarge),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeConstants.xxxlarge,
          ),
          child: Column(children: [
            PrimaryButtonWidget(
              onPressed: () => Navigator.pushNamed(
                context,
                NamedRoutes.videos,
              ),
              text: VideosStringsConstants.videos,
            ),
            const SizedBox(height: SizeConstants.large),
            PrimaryButtonWidget(
              onPressed: () =>
                  Navigator.pushNamed(context, NamedRoutes.weather),
              text: WeatherStringsConstants.viewWeather,
            ),
          ]),
        ),
      ],
    ));
  }
}
