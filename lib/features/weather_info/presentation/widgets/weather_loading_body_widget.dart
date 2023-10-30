import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';

class WeatherLoadingBodyWidget extends StatelessWidget {
  const WeatherLoadingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.maxFinite,
        child: ShimmerWidget(
          child: Column(
            children: [
              const SizedBox(height: SizeConstants.xxxlarge),
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.medium,
              ),
              const SizedBox(height: SizeConstants.tiny),
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.medium,
              ),
              const SizedBox(height: SizeConstants.xxxlarge),
              Container(
                color: Colors.white,
                width: SizeConstants.big,
                height: SizeConstants.big,
              ),
              const SizedBox(height: SizeConstants.xxlarge),
              Container(
                color: Colors.white,
                width: SizeConstants.xxxlarge,
                height: SizeConstants.large,
              ),
              const SizedBox(height: SizeConstants.xxlarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: SizeConstants.xxxlarge,
                    height: SizeConstants.xxlarge,
                  ),
                  Container(
                    color: Colors.white,
                    width: SizeConstants.xxxlarge,
                    height: SizeConstants.xxlarge,
                  ),
                ],
              ),
              const SizedBox(height: SizeConstants.xxlarge),
              Container(
                color: Colors.white,
                width: SizeConstants.big,
                height: SizeConstants.xxlarge,
              ),
              const SizedBox(height: SizeConstants.xxlarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: SizeConstants.xxxlarge,
                    height: SizeConstants.large,
                  ),
                  Container(
                    color: Colors.white,
                    width: SizeConstants.xxxlarge,
                    height: SizeConstants.large,
                  ),
                ],
              ),
              const SizedBox(height: SizeConstants.xxlarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: SizeConstants.xxlarge,
                    height: SizeConstants.large,
                  ),
                  Container(
                    color: Colors.white,
                    width: SizeConstants.xxlarge,
                    height: SizeConstants.large,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
