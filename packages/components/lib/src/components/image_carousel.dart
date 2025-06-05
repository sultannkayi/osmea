import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

class OsmeaImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showIndicator;
  final bool enableInfiniteScroll;
  final Function(int)? onPageChanged;
  final BorderRadius? borderRadius;
  final Widget Function(BuildContext, String, int)? imageBuilder;
  final Widget? loadingIndicator;
  final Widget? errorWidget;
  final ThemeType themeType;

  const OsmeaImageCarousel({
    Key? key,
    required this.imageUrls,
    required this.themeType,
    this.height = 250.0,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.fastOutSlowIn,
    this.showIndicator = true,
    this.enableInfiniteScroll = true,
    this.onPageChanged,
    this.borderRadius,
    this.imageBuilder,
    this.loadingIndicator,
    this.errorWidget,
  }) : super(key: key);

  /// Create image carousel with design system from context
  factory OsmeaImageCarousel.fromContext({
    required BuildContext context,
    required List<String> imageUrls,
    double height = 250.0,
    bool autoPlay = true,
    Duration autoPlayInterval = const Duration(seconds: 4),
    Duration animationDuration = const Duration(milliseconds: 500),
    Curve animationCurve = Curves.fastOutSlowIn,
    bool showIndicator = true,
    bool enableInfiniteScroll = true,
    Function(int)? onPageChanged,
    BorderRadius? borderRadius,
    Widget Function(BuildContext, String, int)? imageBuilder,
    Widget? loadingIndicator,
    Widget? errorWidget,
  }) {
    return OsmeaImageCarousel(
      imageUrls: imageUrls,
      themeType: ThemeType.light,
      height: height,
      autoPlay: autoPlay,
      autoPlayInterval: autoPlayInterval,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      showIndicator: showIndicator,
      enableInfiniteScroll: enableInfiniteScroll,
      onPageChanged: onPageChanged,
      borderRadius: borderRadius,
      imageBuilder: imageBuilder,
      loadingIndicator: loadingIndicator,
      errorWidget: errorWidget,
    );
  }

  @override
  State<OsmeaImageCarousel> createState() => _OsmeaImageCarouselState();
}

class _OsmeaImageCarouselState extends State<OsmeaImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isAutoPlaying = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.autoPlay && widget.imageUrls.length > 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startAutoPlay();
      });
    }
  }

  @override
  void dispose() {
    _stopAutoPlay();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    if (!_isAutoPlaying && widget.autoPlay && widget.imageUrls.length > 1) {
      _isAutoPlaying = true;
      Future.delayed(widget.autoPlayInterval, _autoPlayTimerCallback);
    }
  }

  void _stopAutoPlay() {
    _isAutoPlaying = false;
  }

  void _autoPlayTimerCallback() {
    if (!_isAutoPlaying) return;

    if (_currentPage < widget.imageUrls.length - 1) {
      _pageController.nextPage(
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    } else if (widget.enableInfiniteScroll) {
      _pageController.animateToPage(
        0,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    }

    if (mounted && _isAutoPlaying) {
      Future.delayed(widget.autoPlayInterval, _autoPlayTimerCallback);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: widget.borderRadius ??
                  BorderRadius.circular(ComponentDimensions.radiusM),
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.imageUrls.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                  widget.onPageChanged?.call(index);
                },
                itemBuilder: (context, index) {
                  final imageUrl = widget.imageUrls[index];

                  if (widget.imageBuilder != null) {
                    return widget.imageBuilder!(context, imageUrl, index);
                  }

                  return Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return widget.loadingIndicator ??
                          Center(
                            child: CircularProgressIndicator(
                              color: OsmeaColors.primary,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return widget.errorWidget ??
                          const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.red,
                              size: 48,
                            ),
                          );
                    },
                  );
                },
              ),
            ),
          ),
          if (widget.showIndicator && widget.imageUrls.length > 1)
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: ComponentDimensions.spaceS),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imageUrls.length,
                  (index) => Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(
                        horizontal: ComponentDimensions.spaceXXS),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? OsmeaColors.primary
                          : OsmeaColors.border(widget.themeType),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
