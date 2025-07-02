import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({Key? key}) : super(key: key);

  static const List<DividerVariant> _variants = [
    DividerVariant.classic,
    DividerVariant.dashed,
    DividerVariant.dotted,
    DividerVariant.gradient,
    DividerVariant.fade,
    DividerVariant.zigzag,
    DividerVariant.wave,
    DividerVariant.double,
    DividerVariant.icon,
    DividerVariant.angled,
    DividerVariant.label,
  ];


  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: const Text('Divider Variants Showcase'),
        backgroundColor: Colors.deepPurple.shade50,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _variants.length,
        separatorBuilder: (_, __) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final variant = _variants[index];
          final variantLabel = _getVariantLabel(variant);
          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: OsmeaComponents.padding(
              padding: const EdgeInsets.all(16),
              child: OsmeaComponents.column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    variantLabel,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Horizontal'),
                  const SizedBox(height: 8),
                  OsmeaComponents.row(
                    children: [
                      Expanded(
                        child: OsmeaComponents.container(
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(30),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: OsmeaComponents.divider(
                            variant: variant,
                            direction: Axis.horizontal,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Vertical'),
                  const SizedBox(height: 8),
                  OsmeaComponents.container(
                    width: 60,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: OsmeaComponents.divider(
                      variant: variant,
                      direction: Axis.vertical,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getVariantLabel(DividerVariant variant) {
    switch (variant) {
      case DividerVariant.classic:
        return 'Classic';
      case DividerVariant.dashed:
        return 'Dashed';
      case DividerVariant.dotted:
        return 'Dotted';
      case DividerVariant.gradient:
        return 'Gradient';
      case DividerVariant.fade:
        return 'Fade';
      case DividerVariant.zigzag:
        return 'Zigzag';
      case DividerVariant.wave:
        return 'Wave';
      case DividerVariant.double:
        return 'Double';
      case DividerVariant.icon:
        return 'Icon';
      case DividerVariant.angled:
        return 'Angled';
      case DividerVariant.label:
        return 'Label';
      default:
        return 'Classic';
    }
  }
}
