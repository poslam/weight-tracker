import 'package:flutter/material.dart';
import 'package:todo/i18n/strings.g.dart';

class ConfirmationDeleteDialog extends StatelessWidget {
  final Function delFunc;
  final String objId;

  const ConfirmationDeleteDialog(
      {super.key, required this.delFunc, required this.objId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        t.common.confirmDeletion,
        style: const TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(t.common.cancel),
        ),
        TextButton(
          onPressed: () {
            delFunc(objId);
            Navigator.of(context).pop();
          },
          child: Text(t.common.delete),
        )
      ],
    );
  }
}
