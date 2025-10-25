import 'package:flutter/material.dart';
import 'app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AppAppBar({
    super.key,
    this.title,
    this.enableBackButton = false,
  });

  final String? title;
  final bool enableBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black87,
      automaticallyImplyLeading: false,
      leading: enableBackButton ? InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ): const SizedBox.shrink(),
      title: AppText(
        title: title ?? "",
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
