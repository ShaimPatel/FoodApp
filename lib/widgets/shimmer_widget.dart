import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgetPage extends StatefulWidget {
  const ShimmerWidgetPage({super.key});

  @override
  State<ShimmerWidgetPage> createState() => _ShimmerWidgetPageState();
}

class _ShimmerWidgetPageState extends State<ShimmerWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      loop: 5,
      period: const Duration(seconds: 3),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 260,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skelton(
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Skelton(
                height: 10,
                width: 100,
              ),
              const SizedBox(height: 3),
              const Skelton(
                height: 15,
                width: 50,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Skelton(
                    height: 35,
                    width: 90,
                  ),
                  Skelton(
                    height: 35,
                    width: 90,
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

class Skelton extends StatelessWidget {
  final double? height, width;
  const Skelton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
