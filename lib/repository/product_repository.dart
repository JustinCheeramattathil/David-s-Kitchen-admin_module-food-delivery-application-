import 'package:adminmodule/core/api/api_base_url.dart';
import 'package:adminmodule/core/api/api_end_url.dart';
import 'package:adminmodule/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final Dio _dio;

  ProductRepository(this._dio);

  final addproductUrl = ApiBaseUrl().baseurl + ApiEndUrl().addProduct;
  final getproductUrl = ApiBaseUrl().baseurl + ApiEndUrl().getAllProduct;

  //Function to convert the file formatted image to string formatted image
  String getimageurl(String url) {
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    return lastPathSegment;
  }

  Future<void>addProduct(ProductModel productmodel)async{

  }
}
