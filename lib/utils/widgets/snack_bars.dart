import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../../config/global_service.dart';

enum _SnackBarType {
  defaultType,
  error,
  success,
}

showErrorSnackBar(String message) {
  if (GlobalService.globalKey.currentContext != null) {
    _showSnackBar(GlobalService.globalKey.currentContext!, message: message, type: _SnackBarType.error);
  }
}

showSuccessSnackBar(String message) {
  if (GlobalService.globalKey.currentContext != null) {
    _showSnackBar(GlobalService.globalKey.currentContext!, message: message, type: _SnackBarType.success);
  }
}

showSnackBar(String message) {
  if (GlobalService.globalKey.currentContext != null) {
    _showSnackBar(GlobalService.globalKey.currentContext!, message: message, type: _SnackBarType.defaultType);
  }
}

void _showSnackBar(BuildContext context, {required _SnackBarType type, required String message}) {
  Color? getBackgroundColor(_SnackBarType type) {
    switch (type) {
      case _SnackBarType.error:
        return Theme.of(context).colorScheme.error;
      case _SnackBarType.success:
        return AppColors.successColor;
      case _SnackBarType.defaultType:
        return null;
      default:
        return null;
    }
  }

  Color? getForegroundColor(_SnackBarType type) {
    switch (type) {
      case _SnackBarType.error:
        return Theme.of(context).colorScheme.onError;
      case _SnackBarType.success:
        return AppColors.onSuccessColor;
      case _SnackBarType.defaultType:
        return null;
      default:
        return null;
    }
  }

  final Color? backgroundColor = getBackgroundColor(type);
  final Color? foregroundColor = getForegroundColor(type);

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        closeIconColor: foregroundColor,
        backgroundColor: backgroundColor,
        content: Text(
          message,
          overflow: TextOverflow.clip,
          softWrap: true,
          style: TextStyle(color: foregroundColor),
        )),
  );
}
