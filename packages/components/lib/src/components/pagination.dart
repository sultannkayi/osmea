import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

class OsmeaPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final ThemeType themeType;
  final int maxVisiblePages;

  const OsmeaPagination({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    required this.themeType,
    this.maxVisiblePages = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine which page numbers to show
    List<int> pageNumbers = _getVisiblePageNumbers();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Previous button
        _buildPageButton(
          icon: Icons.chevron_left,
          onTap: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),

        // Page numbers
        ...pageNumbers.map((pageNumber) {
          if (pageNumber == -1) {
            // Ellipsis
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '...',
                style: OsmeaTypography.bodyMedium(themeType),
              ),
            );
          } else {
            return _buildPageButton(
              pageNumber: pageNumber,
              isActive: pageNumber == currentPage,
              onTap: () => onPageChanged(pageNumber),
            );
          }
        }).toList(),

        // Next button
        _buildPageButton(
          icon: Icons.chevron_right,
          onTap: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
        ),
      ],
    );
  }

  Widget _buildPageButton({
    int? pageNumber,
    IconData? icon,
    bool isActive = false,
    VoidCallback? onTap,
  }) {
    final bool isDisabled = onTap == null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isActive ? OsmeaColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
            border: !isActive
                ? Border.all(
                    color: isDisabled
                        ? OsmeaColors.border(themeType)
                        : OsmeaColors.textSecondary(themeType),
                    width: ComponentDimensions.borderWidthThin,
                  )
                : null,
          ),
          child: Center(
            child: icon != null
                ? Icon(
                    icon,
                    size: 18,
                    color: isDisabled
                        ? OsmeaColors.textSecondary(themeType)
                        : isActive
                            ? Colors.white
                            : OsmeaColors.onSurface(themeType),
                  )
                : Text(
                    pageNumber.toString(),
                    style: OsmeaTypography.bodyMedium(themeType).copyWith(
                      color: isActive
                          ? Colors.white
                          : OsmeaColors.onSurface(themeType),
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  List<int> _getVisiblePageNumbers() {
    if (totalPages <= maxVisiblePages) {
      // If total pages is less than or equal to max visible pages, show all pages
      return List.generate(totalPages, (index) => index + 1);
    }

    List<int> visiblePages = [];

    // Always show first page
    visiblePages.add(1);

    // Calculate the middle visible pages
    int leftSide = (maxVisiblePages - 2) ~/ 2;
    int rightSide = (maxVisiblePages - 2) - leftSide;

    // Adjust when near the beginning or end
    if (currentPage <= leftSide + 1) {
      // Near the beginning, show pages 1 to maxVisiblePages-1, then ellipsis, then last page
      visiblePages
          .addAll(List.generate(maxVisiblePages - 2, (index) => index + 2));
      visiblePages.add(-1); // Ellipsis
      visiblePages.add(totalPages);
    } else if (currentPage >= totalPages - rightSide) {
      // Near the end, show first page, ellipsis, then last maxVisiblePages-1 pages
      visiblePages.add(-1); // Ellipsis
      visiblePages.addAll(List.generate(maxVisiblePages - 2,
          (index) => totalPages - (maxVisiblePages - 2) + index + 1));
    } else {
      // In the middle, show first page, ellipsis, some pages around current, ellipsis, last page
      visiblePages.add(-1); // Ellipsis
      int start = currentPage - leftSide + (rightSide > leftSide ? 0 : 1);
      int end = currentPage + rightSide - (rightSide > leftSide ? 0 : 1);
      visiblePages
          .addAll(List.generate(end - start + 1, (index) => start + index));
      visiblePages.add(-1); // Ellipsis
      visiblePages.add(totalPages);
    }

    return visiblePages;
  }
}
