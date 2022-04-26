part of simple_permissions;

class PermissionsRequiredAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? featureName;
  const PermissionsRequiredAlertDialog(
      {required this.title, required this.content, this.featureName, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        title,
        style: titleStyle,
      ),
      content: Text(content, style: paragraphStyle),
      actions: const [
        ActionsRow(),
      ],
    );
  }
}
