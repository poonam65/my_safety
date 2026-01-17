import 'package:flutter/material.dart';


import 'appcolor.dart';


class ButtonWgt extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final double? width;
  final double? height;
  final Color color;
  final IconData? icon;
  final IconData? backIcon;
  final bool disabledBtn;
  final bool isLoading;

  const ButtonWgt({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.color = AppColor.blueDarkColor,
    this.icon,
    this.backIcon,
    this.disabledBtn = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IgnorePointer(
        ignoring: disabledBtn,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.0),
          child: Ink(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: disabledBtn ? AppColor.greyColor : color,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: AppColor.whiteColor),
                    const SizedBox(width: 5),
                  ],
                  isLoading
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.0,
                    ),
                  )
                      : Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor,
                      fontSize: 14.0,
                    ),
                  ),
                  if (backIcon != null) ...[
                    const SizedBox(width: 5),
                    Icon(backIcon, color: AppColor.whiteColor),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
