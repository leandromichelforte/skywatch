import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';

class VideosLoadingBodyWidget extends StatelessWidget {
  const VideosLoadingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.maxFinite,
        child: ShimmerWidget(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.xbig,
              ),
              const SizedBox(height: SizeConstants.small),
              Container(
                color: Colors.white,
                width: SizeConstants.big,
                height: SizeConstants.large,
              ),
              const SizedBox(height: SizeConstants.tiny),
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.large,
              ),
              const SizedBox(height: SizeConstants.tiny),
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.large,
              ),
              const SizedBox(height: SizeConstants.large),
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.xbig,
              ),
              const SizedBox(height: SizeConstants.small),
              Container(
                color: Colors.white,
                width: SizeConstants.big,
                height: SizeConstants.large,
              ),
              const SizedBox(height: SizeConstants.tiny),
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.large,
              ),
              const SizedBox(height: SizeConstants.tiny),
              Container(
                color: Colors.white,
                width: SizeConstants.xbig,
                height: SizeConstants.large,
              ),
              const SizedBox(height: SizeConstants.large)
            ],
          ),
        ),
      ),
    );
  }
}
