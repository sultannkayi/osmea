import 'package:flutter/material.dart';

/// 💡 **Info Text Widget**
///
/// Shows information about the current text configuration.
class InfoTextWidget extends StatelessWidget {
  final Map<String, String> infoMap;
  final bool isDark;

  const InfoTextWidget({
    super.key,
    required this.infoMap,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDark ? Colors.grey.shade800 : Colors.blue.shade50;
    final borderColor = isDark ? Colors.grey.shade700 : Colors.blue.shade200;
    final textColor = isDark ? Colors.white : Colors.blue.shade800;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: textColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Text Configuration',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...infoMap.entries.map((entry) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    '${entry.key}:',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
