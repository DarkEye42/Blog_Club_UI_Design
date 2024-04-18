import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.leading,
    this.titleWidget,
    required this.showActionIcon,
    this.onMenuActionTap,
    required this.iconColor,
    required this.showLeading,
  }) : super(key: key);

  final String title;
  final Widget? leading, titleWidget;
  final bool showActionIcon, showLeading;
  final VoidCallback? onMenuActionTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 2.5),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Center(child: titleWidget!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Conditionally render leading widget based on showLeading
                if (showLeading)
                  leading != null
                      ? leading! // If leading is provided, show it
                      : Transform.translate(
                          offset: const Offset(-14, 0),
                          child: BackButton(color: iconColor),
                        )
                else
                  Transform.translate(
                    offset: const Offset(-14, 0),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: null,
                    ),
                  ),

                // Action icon
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: InkWell(
                      onTap: onMenuActionTap,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.menu, color: iconColor),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
