part of simple_permissions;

class ActionsRow extends StatelessWidget {
  const ActionsRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: PermissionActionButton(
            'Cancel',
            function: () {
              Navigator.maybePop(context);
            },
          )),
          const SizedBox(
            width: 9,
          ),
          Expanded(
              child: PermissionActionButton(
            'Go to settings',
            function: () => openAppSettings(),
            highlighted: true,
          )),
        ],
      ),
    );
  }
}

class PermissionActionButton extends StatelessWidget {
  final String title;
  final Function()? function;
  final bool highlighted;
  const PermissionActionButton(this.title,
      {this.function, this.highlighted = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: highlighted
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.background,
          ),
          child: Text(
            title,
            style: actionStyle.copyWith(
                color: highlighted
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).colorScheme.onSurface),
          ),
        ));
  }
}
