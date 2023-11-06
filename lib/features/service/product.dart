import 'package:minimal_ecommerce_app/features/models/product.dart';
import 'package:minimal_ecommerce_app/utils/constants/asset.dart';

abstract class IProduct {
  List<Product> getProduct();
}

final class ProductService extends IProduct {
  final List<Product> products = [
    Product(
        name: 'Product 1',
        price: 99.99,
        description: 'Product description.... ',
        image: AssetEnum.shoe.path),
    Product(
        name: 'Product 2',
        price: 40.99,
        description: 'Product description.... ',
        image: AssetEnum.sweatshirt.path),
    Product(
        name: 'Product 3',
        price: 20000,
        description: 'Product description.... ',
        image: AssetEnum.watch.path),
    Product(
        name: 'Product 4',
        price: 80.25,
        description: 'Product description.... ',
        image: AssetEnum.sunglass.path),
  ];

  @override
  List<Product> getProduct() {
    return products;
  }
}
