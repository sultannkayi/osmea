import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

enum OsmeaCarouselIndicatorPosition { bottom, top, outside, none }

enum OsmeaCarouselIndicatorStyle { dots, numbers, progressBar, none }

class OsmeaCarousel extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final double? width;
  final Duration autoPlayInterval;
  final Duration animationDuration;
  final bool infiniteScroll;
  final bool autoPlay;
  final Curve animationCurve;
  final bool showArrowButtons;
  final OsmeaCarouselIndicatorPosition indicatorPosition;
  final OsmeaCarouselIndicatorStyle indicatorStyle;
  final ThemeType themeType;
  final void Function(int)? onPageChanged;
  final bool showItemCount;
  final double viewportFraction;
  final EdgeInsets padding;
  final bool enlargeCenterItem;

  const OsmeaCarousel({
    Key? key,
    required this.items,
    required this.height,
    this.width,
    this.autoPlayInterval = const Duration(seconds: 5),
    this.animationDuration = const Duration(milliseconds: 800),
    this.infiniteScroll = true,
    this.autoPlay = false,
    this.animationCurve = Curves.fastOutSlowIn,
    this.showArrowButtons = true,
    this.indicatorPosition = OsmeaCarouselIndicatorPosition.bottom,
    this.indicatorStyle = OsmeaCarouselIndicatorStyle.dots,
    required this.themeType,
    this.onPageChanged,
    this.showItemCount = false,
    this.viewportFraction = 1.0,
    this.padding = EdgeInsets.zero,
    this.enlargeCenterItem = false,
  }) : super(key: key);

  @override
  State<OsmeaCarousel> createState() => _OsmeaCarouselState();
}

class _OsmeaCarouselState extends State<OsmeaCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: widget.viewportFraction,
    );

    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    Future.delayed(widget.autoPlayInterval, () {
      if (!mounted) return;

      if (_currentPage == widget.items.length - 1 && !widget.infiniteScroll) {
        _pageController.animateToPage(
          0,
          duration: widget.animationDuration,
          curve: widget.animationCurve,
        );
      } else {
        _pageController.nextPage(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
        );
      }

      _startAutoPlay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height +
          (widget.indicatorPosition == OsmeaCarouselIndicatorPosition.outside
              ? 30
              : 0),
      width: widget.width,
      child: Column(
        children: [
          if (widget.indicatorPosition == OsmeaCarouselIndicatorPosition.top ||
              widget.indicatorPosition ==
                  OsmeaCarouselIndicatorPosition.outside)
            _buildIndicator(),
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.items.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                    if (widget.onPageChanged != null) {
                      widget.onPageChanged!(index);
                    }
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: widget.padding,
                      child: widget.items[index],
                    );
                  },
                ),
                if (widget.showArrowButtons) _buildNavigationButtons(),
                if (widget.indicatorPosition ==
                        OsmeaCarouselIndicatorPosition.bottom &&
                    widget.indicatorStyle != OsmeaCarouselIndicatorStyle.none)
                  Positioned(
                    bottom: ComponentDimensions.spaceS,
                    left: 0,
                    right: 0,
                    child: _buildIndicator(),
                  ),
                if (widget.showItemCount)
                  Positioned(
                    top: ComponentDimensions.spaceS,
                    right: ComponentDimensions.spaceS,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ComponentDimensions.spaceS,
                        vertical: ComponentDimensions.spaceXXS,
                      ),
                      decoration: BoxDecoration(
                        color: OsmeaColors.surface(widget.themeType)
                            .withAlpha(179), // ~70% opacity
                        borderRadius:
                            BorderRadius.circular(ComponentDimensions.radiusS),
                      ),
                      child: Text(
                        '${_currentPage + 1}/${widget.items.length}',
                        style: TextStyle(
                          color: OsmeaColors.onSurface(widget.themeType),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (widget.indicatorPosition ==
                  OsmeaCarouselIndicatorPosition.outside &&
              widget.indicatorStyle != OsmeaCarouselIndicatorStyle.none)
            SizedBox(height: ComponentDimensions.spaceS),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNavigationButton(
          Icons.chevron_left,
          () {
            _pageController.previousPage(
              duration: widget.animationDuration,
              curve: widget.animationCurve,
            );
          },
        ),
        _buildNavigationButton(
          Icons.chevron_right,
          () {
            _pageController.nextPage(
              duration: widget.animationDuration,
              curve: widget.animationCurve,
            );
          },
        ),
      ],
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      child: Material(
        color: OsmeaColors.surface(widget.themeType)
            .withAlpha(179), // ~70% opacity
        elevation: 0,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(ComponentDimensions.spaceXXS),
            child: Icon(
              icon,
              color: OsmeaColors.onSurface(widget.themeType),
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    switch (widget.indicatorStyle) {
      case OsmeaCarouselIndicatorStyle.dots:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? OsmeaColors.primary
                    : OsmeaColors.border(widget.themeType),
              ),
            );
          }),
        );
      case OsmeaCarouselIndicatorStyle.numbers:
        return Text(
          '${_currentPage + 1}/${widget.items.length}',
          style: TextStyle(
            color: OsmeaColors.onSurface(widget.themeType),
            fontSize: 14,
          ),
        );
      case OsmeaCarouselIndicatorStyle.progressBar:
        return Container(
          width: 100,
          height: 4,
          margin: EdgeInsets.symmetric(vertical: ComponentDimensions.spaceS),
          decoration: BoxDecoration(
            color: OsmeaColors.border(widget.themeType),
            borderRadius: BorderRadius.circular(ComponentDimensions.radiusXS),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: widget.items.isEmpty
                ? 0
                : (_currentPage + 1) / widget.items.length,
            child: Container(
              decoration: BoxDecoration(
                color: OsmeaColors.primary,
                borderRadius:
                    BorderRadius.circular(ComponentDimensions.radiusXS),
              ),
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class OsmeaImageCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final double height;
  final OsmeaCarouselIndicatorPosition indicatorPosition;
  final OsmeaCarouselIndicatorStyle indicatorStyle;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final ThemeType themeType;
  final BoxFit imageFit;
  final BorderRadius? borderRadius;
  final void Function(int)? onPageChanged;

  const OsmeaImageCarousel({
    Key? key,
    required this.imageUrls,
    required this.themeType,
    this.height = 200,
    this.indicatorPosition = OsmeaCarouselIndicatorPosition.bottom,
    this.indicatorStyle = OsmeaCarouselIndicatorStyle.dots,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 5),
    this.imageFit = BoxFit.cover,
    this.borderRadius,
    this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageWidgets = imageUrls.map((url) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.network(
          url,
          fit: imageFit,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                color: OsmeaColors.primary,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: OsmeaColors.secondary.withAlpha(26), // ~10% opacity
              child: Center(
                child: Icon(
                  Icons.broken_image,
                  color: OsmeaColors.textSecondary(themeType),
                  size: 32,
                ),
              ),
            );
          },
        ),
      );
    }).toList();

    return OsmeaCarousel(
      items: imageWidgets,
      height: height,
      indicatorPosition: indicatorPosition,
      indicatorStyle: indicatorStyle,
      autoPlay: autoPlay,
      autoPlayInterval: autoPlayInterval,
      themeType: themeType,
      onPageChanged: onPageChanged,
    );
  }
}
