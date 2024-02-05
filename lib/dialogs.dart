import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  const Dialogs._();

  static Future<bool?> showConfirmDialog(BuildContext context) async {
    final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;

    return isCupertino
        ? showCupertinoDialog<bool>(
            context: context,
            builder: (context) => const ConfirmDialog(),
          )
        : showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => const ConfirmDialog(),
          );
  }

  static Future<bool?> showConfirmModal(BuildContext context) async {
    final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;

    return isCupertino
        ? showCupertinoModalPopup(
            context: context,
            builder: (context) => const ConfirmModal(),
          )
        : showModalBottomSheet(
            context: context,
            builder: (context) => const ConfirmModal(),
          );
  }
}

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;

    return isCupertino
        ? CupertinoAlertDialog(
            title: const Text('CupertinoAlertDialog title'),
            content: const Text('CupertinoAlertDialog content'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          )
        : AlertDialog(
            title: const Text('AlertDialogg title'),
            content: const Text('AlertDialog content'),
            actions: [
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('NO'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('YES'),
              ),
            ],
          );
  }
}

class ConfirmModal extends StatelessWidget {
  const ConfirmModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;

    return isCupertino
        ? CupertinoActionSheet(
            title: const Text('CupertinoActionSheet title'),
            message: const Text('CupertinoActionSheet message'),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Later'),
            ),
          )
        : SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Text('Column title'),
                  subtitle: Text('Column subtitle'),
                ),
                ListTile(
                  leading: const Icon(Icons.check),
                  title: const Text('Yes'),
                  onTap: () => Navigator.of(context).pop(true),
                ),
                ListTile(
                  leading: const Icon(Icons.close),
                  title: const Text('No'),
                  onTap: () => Navigator.of(context).pop(false),
                ),
                ListTile(
                  leading: const Icon(Icons.snooze),
                  title: const Text('Later'),
                  onTap: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
          );
  }
}