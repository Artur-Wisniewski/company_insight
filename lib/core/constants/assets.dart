class AssetInfo {
  const AssetInfo({required this.path, this.semanticsLabel});

  final String path;
  final String? semanticsLabel;
}

class SvgAssets {
  static const _imageDirectoryPath = 'assets/images';

  static const bookmarkOutline =
      AssetInfo(path: '$_imageDirectoryPath/bookmark_outline.svg', semanticsLabel: 'bookmark fill out icon');
  static const bookmarkFill =
      AssetInfo(path: '$_imageDirectoryPath/bookmark_fill.svg', semanticsLabel: 'bookmark fill icon');
  static const chevronLeft =
      AssetInfo(path: '$_imageDirectoryPath/chevron_left.svg', semanticsLabel: 'arrow left icon');
  static const homeOutline =
      AssetInfo(path: '$_imageDirectoryPath/home_outline.svg', semanticsLabel: 'home outline icon');
  static const homeFill = AssetInfo(path: '$_imageDirectoryPath/home_fill.svg', semanticsLabel: 'home fill icon');
  static const search = AssetInfo(path: '$_imageDirectoryPath/search.svg', semanticsLabel: 'search icon');
  static const emptyBox = AssetInfo(path: '$_imageDirectoryPath/open_box.svg', semanticsLabel: 'empty box icon');
  static const profileOutline =
      AssetInfo(path: '$_imageDirectoryPath/profile_outline.svg', semanticsLabel: 'profile outline icon');
  static const profileFill =
      AssetInfo(path: '$_imageDirectoryPath/profile_fill.svg', semanticsLabel: 'profile fill icon');
  static const trendingUp = AssetInfo(path: '$_imageDirectoryPath/trending_up.svg', semanticsLabel: 'trending up icon');
}
