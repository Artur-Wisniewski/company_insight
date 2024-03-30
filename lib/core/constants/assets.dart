class AssetInfo {
  const AssetInfo({required this.path, this.semanticsLabel});

  final String path;
  final String? semanticsLabel;
}

class SvgAssets {
  static const _imageDirectoryPath = 'assets/images';

  static const AssetInfo blur = AssetInfo(path: '$_imageDirectoryPath/blur.svg', semanticsLabel: 'Blur');
}
