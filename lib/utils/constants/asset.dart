enum AssetEnum {
  shoe('assets/shoe.png'),
  shopBag('assets/shop_bag.json'),
  sweatshirt('assets/sweatshirt.png'),
  sunglass('assets/sunglasses.png'),
  watch('assets/watch.png');

  final String path;
  const AssetEnum(this.path);
}
