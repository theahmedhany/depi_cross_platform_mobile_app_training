import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, required this.size, this.loadingAnimation});

  final double size;
  final String? loadingAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.w,
        height: size.h,
        child: CupertinoActivityIndicator(radius: size / 4),
      ),
    );
  }
}
