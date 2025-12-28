import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

/// Enum to specify the type of image source
enum ImageSourceType { asset, network, auto }

/// Enum to specify the image format
enum ImageFormat { svg, png, jpeg, gif, webp, icon, lottie, auto }

/// Usage:
/// ```dart
/// # For images (auto-detects asset vs network, and format)
/// SmartImageWidget(source: 'assets/images/logo.png')
/// SmartImageWidget(source: 'https://example.com/image.svg')
/// SmartImageWidget(source: Icons.home, color: Colors.blue)
/// ```
class SmartImageWidget extends StatelessWidget {
  const SmartImageWidget({
    super.key,
    required this.source,
    this.defaultImage,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.colorBlendMode,
    this.borderRadius,
    this.backgroundColor,
    this.padding,
    this.sourceType = ImageSourceType.auto,
    this.format = ImageFormat.auto,
    this.alignment = Alignment.center,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.cacheWidth,
    this.cacheHeight,
    this.showPlaceholder = true,
    this.placeholderWidget,
    this.errorWidget,
  });

  final dynamic source;
  final String? defaultImage;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final ImageSourceType sourceType;
  final ImageFormat format;
  final Alignment alignment;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final int? cacheWidth;
  final int? cacheHeight;
  final bool showPlaceholder;
  final Widget? placeholderWidget;
  final Widget? errorWidget;

  /// Root default image path - the ultimate fallback
  static const String rootDefaultImage = 'assets/icons/default_image.png';

  /// Checks if the source is an IconData
  bool get _isIcon => source is IconData;

  /// Gets the source as String (only valid when source is String)
  String get _stringSource => source as String;

  /// Gets the source as IconData (only valid when source is IconData)
  IconData get _iconSource => source as IconData;

  /// Creates a color filter from color and blend mode
  ColorFilter? get _colorFilter => color != null
      ? ColorFilter.mode(color!, colorBlendMode ?? BlendMode.srcIn)
      : null;

  /// Gets appropriate icon size for placeholder/error states
  double get _placeholderIconSize {
    if (width != null && height != null) {
      return (width! < height! ? width! : height!) * 0.4;
    }
    return 24.0;
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = _buildImage(context);

    // Apply border radius if provided (not for icons)
    if (borderRadius != null && !_isIcon) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    // Wrap with background color container if provided
    if (backgroundColor != null) {
      imageWidget = Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        padding: padding,
        alignment: Alignment.center,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildImage(BuildContext context) {
    if (_isIcon) return _buildIcon();

    final src = _stringSource;
    if (src.isEmpty) return _buildErrorWidget(context);

    final resolvedType = _getSourceType(src);
    final resolvedFormat = _getFormat(src);

    return switch (resolvedFormat) {
      ImageFormat.lottie => _buildLottieImage(src, resolvedType),
      ImageFormat.svg => _buildSvgImage(src, resolvedType),
      _ => _buildRasterImage(src, resolvedType, context),
    };
  }

  Widget _buildIcon() {
    return Icon(
      _iconSource,
      size: width ?? height,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  Widget _buildLottieImage(String src, ImageSourceType type) {
    final isNetwork = type == ImageSourceType.network;

    final lottieWidget = isNetwork
        ? Lottie.network(
            src,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) =>
                _buildErrorWidget(context),
          )
        : Lottie.asset(
            src,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) =>
                _buildErrorWidget(context),
          );

    return RepaintBoundary(child: lottieWidget);
  }

  Widget _buildSvgImage(String src, ImageSourceType type) {
    final isNetwork = type == ImageSourceType.network;

    return isNetwork
        ? SvgPicture.network(
            src,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            colorFilter: _colorFilter,
            semanticsLabel: semanticLabel,
            excludeFromSemantics: excludeFromSemantics,
            placeholderBuilder: showPlaceholder
                ? (_) => _buildPlaceholder()
                : null,
          )
        : SvgPicture.asset(
            src,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            colorFilter: _colorFilter,
            semanticsLabel: semanticLabel,
            excludeFromSemantics: excludeFromSemantics,
            placeholderBuilder: showPlaceholder
                ? (_) => _buildPlaceholder()
                : null,
          );
  }

  Widget _buildRasterImage(
    String src,
    ImageSourceType type,
    BuildContext context,
  ) {
    final isNetwork = type == ImageSourceType.network;

    return isNetwork
        ? Image.network(
            src,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            color: color,
            colorBlendMode: colorBlendMode,
            semanticLabel: semanticLabel,
            excludeFromSemantics: excludeFromSemantics,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
            loadingBuilder: showPlaceholder ? _loadingBuilder : null,
            errorBuilder: (_, _, _) => _buildErrorWidget(context),
          )
        : Image.asset(
            src,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            color: color,
            colorBlendMode: colorBlendMode,
            semanticLabel: semanticLabel,
            excludeFromSemantics: excludeFromSemantics,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
            errorBuilder: (_, _, _) => _buildErrorWidget(context),
          );
  }

  Widget _loadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    if (loadingProgress == null) return child;
    final total = loadingProgress.expectedTotalBytes;
    final progress = total != null
        ? loadingProgress.cumulativeBytesLoaded / total
        : null;
    return _buildPlaceholder(progress: progress);
  }

  Widget _buildPlaceholder({double? progress}) {
    if (placeholderWidget != null) return placeholderWidget!;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: borderRadius,
      ),
      child: Center(
        child: SizedBox.square(
          dimension: _placeholderIconSize.clamp(16.0, 48.0),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: progress,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    if (errorWidget != null) return errorWidget!;

    return _FallbackImageWidget(
      fallbackPath: defaultImage ?? rootDefaultImage,
      rootDefaultPath: rootDefaultImage,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      borderRadius: borderRadius,
    );
  }

  /// Determines the actual source type
  ImageSourceType _getSourceType(String src) {
    if (sourceType != ImageSourceType.auto) return sourceType;
    return _ImageUtils.isNetworkSource(src)
        ? ImageSourceType.network
        : ImageSourceType.asset;
  }

  /// Determines the actual image format from extension
  ImageFormat _getFormat(String src) {
    if (format != ImageFormat.auto) return format;
    return _ImageUtils.getFormatFromPath(src);
  }
}

/// Utility class for image-related operations
class _ImageUtils {
  _ImageUtils._();

  static bool isNetworkSource(String src) {
    final lower = src.toLowerCase();
    return lower.startsWith('http://') ||
        lower.startsWith('https://') ||
        lower.startsWith('www.');
  }

  static ImageFormat getFormatFromPath(String src) {
    final path = src.toLowerCase().split('?').first;

    if (path.endsWith('.svg')) return ImageFormat.svg;
    if (path.endsWith('.json')) return ImageFormat.lottie;
    if (path.endsWith('.png')) return ImageFormat.png;
    if (path.endsWith('.jpg') || path.endsWith('.jpeg')) {
      return ImageFormat.jpeg;
    }
    if (path.endsWith('.gif')) return ImageFormat.gif;
    if (path.endsWith('.webp')) return ImageFormat.webp;

    return ImageFormat.png;
  }

  static ColorFilter? createColorFilter(Color? color, BlendMode? blendMode) {
    return color != null
        ? ColorFilter.mode(color, blendMode ?? BlendMode.srcIn)
        : null;
  }
}

/// Internal widget to handle fallback image with cascading error handling
class _FallbackImageWidget extends StatefulWidget {
  const _FallbackImageWidget({
    required this.fallbackPath,
    required this.rootDefaultPath,
    required this.width,
    required this.height,
    required this.fit,
    required this.color,
    required this.colorBlendMode,
    required this.borderRadius,
  });

  final String fallbackPath;
  final String rootDefaultPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BorderRadius? borderRadius;

  @override
  State<_FallbackImageWidget> createState() => _FallbackImageWidgetState();
}

class _FallbackImageWidgetState extends State<_FallbackImageWidget> {
  late _FallbackState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.fallbackPath == widget.rootDefaultPath
        ? _FallbackState.rootDefault
        : _FallbackState.customFallback;
  }

  @override
  Widget build(BuildContext context) {
    return switch (_state) {
      _FallbackState.customFallback => _buildImage(widget.fallbackPath),
      _FallbackState.rootDefault => _buildImage(widget.rootDefaultPath),
      _FallbackState.brokenIcon => _buildBrokenImageIcon(),
    };
  }

  Widget _buildImage(String path) {
    final isNetwork = _ImageUtils.isNetworkSource(path);
    final format = _ImageUtils.getFormatFromPath(path);

    if (format == ImageFormat.svg) {
      return _buildSvgImage(path, isNetwork);
    }
    return _buildRasterImage(path, isNetwork);
  }

  Widget _buildSvgImage(String path, bool isNetwork) {
    final colorFilter = _ImageUtils.createColorFilter(
      widget.color,
      widget.colorBlendMode,
    );

    return isNetwork
        ? SvgPicture.network(
            path,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            colorFilter: colorFilter,
          )
        : SvgPicture.asset(
            path,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            colorFilter: colorFilter,
          );
  }

  Widget _buildRasterImage(String path, bool isNetwork) {
    return isNetwork
        ? Image.network(
            path,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            color: widget.color,
            colorBlendMode: widget.colorBlendMode,
            errorBuilder: (_, _, _) => _onError(),
          )
        : Image.asset(
            path,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            color: widget.color,
            colorBlendMode: widget.colorBlendMode,
            errorBuilder: (_, _, _) => _onError(),
          );
  }

  Widget _onError() {
    // Schedule state update for next frame to avoid build-time setState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _state = switch (_state) {
          _FallbackState.customFallback => _FallbackState.rootDefault,
          _ => _FallbackState.brokenIcon,
        };
      });
    });
    return _buildBrokenImageIcon();
  }

  Widget _buildBrokenImageIcon() {
    final iconSize = _calculateIconSize();

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: widget.borderRadius,
      ),
      child: Icon(
        Icons.broken_image_outlined,
        size: iconSize,
        color: Colors.grey[400],
      ),
    );
  }

  double _calculateIconSize() {
    if (widget.width != null && widget.height != null) {
      final minDim = widget.width! < widget.height!
          ? widget.width!
          : widget.height!;
      return (minDim * 0.4).clamp(16.0, 64.0);
    }
    return 40.0;
  }
}

/// States for the fallback image widget
enum _FallbackState { customFallback, rootDefault, brokenIcon }
