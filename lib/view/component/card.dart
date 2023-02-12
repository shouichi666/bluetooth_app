import 'package:flutter/material.dart';
import 'package:habit/constant/size.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    this.flex,
    required this.icon,
    required this.label,
    required this.content,
    required this.value,
    required this.onTap,
    required this.onChanged,
    required this.moreAction,
  });

  final int? flex;
  final Icon icon;
  final String label;
  final String content;
  final bool value;
  final void Function()? onTap;
  final void Function(bool) onChanged;
  final void Function()? moreAction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              if (moreAction != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: moreAction,
                    icon: const Icon(Icons.more_horiz),
                  ),
                ),
              Container(
                padding: const EdgeInsets.fromLTRB(S3, S3, S1, S1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        icon,
                        Text(
                          label,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    GAP2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          content,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Switch(
                          value: value,
                          onChanged: onChanged,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
