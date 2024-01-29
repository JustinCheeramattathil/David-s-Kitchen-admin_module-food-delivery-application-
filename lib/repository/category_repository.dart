import 'dart:developer';

import 'package:adminmodule/core/api/api_base_url.dart';
import 'package:adminmodule/core/api/api_end_url.dart';
import 'package:adminmodule/model/category_model.dart';
import 'package:dio/dio.dart';

class CategoryRepository {
  final Dio _dio;
  CategoryRepository(this._dio);

  final addcategoryurl = ApiBaseUrl().baseurl + ApiEndUrl().addCategory;
  final getcategoryurl = ApiBaseUrl().baseurl + ApiEndUrl().getCategory;

//Function to convert the file formatted image to string formatted image
  String getimageurl(String url) {
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    return lastPathSegment;
  }

//This is the function called for adding category through api
  Future<void> addCategory(CategoryModel categorymodel) async {
    final image = categorymodel.image;
    final imagepath = getimageurl(image.imagepath);
    log(imagepath
        .toString()); //stores the image url in string format before passing through the api
    try {
      FormData formdata = FormData.fromMap({
        'category': categorymodel.name,
        'image': await MultipartFile.fromFile(categorymodel.image.imagepath,
            filename: imagepath)
      });
      log('Image Path: ${categorymodel.image.imagepath}');

      log('Request data: ${formdata.fields}');
      Response response = await _dio.post(
        addcategoryurl,
        data: formdata,
      );
      log(addcategoryurl.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('category added successfully');
        log(response.data.toString());
        return response.data;
      } else {
        throw DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error: 'Failed to add category.Status code:${response.statusCode}');
      }
    } catch (e) {
      throw DioException(
        requestOptions: RequestOptions(path: addcategoryurl),
        type: DioExceptionType.badResponse,
        error: 'Error adding category:$e',
      );
      // log('Error adding category: ${e.toString()}');
    }
  }

  ///
//Function used to get the whole categories from the api to frontend in a list format
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dio.get(getcategoryurl);
      if (response.statusCode == 200) {
        // Assuming the API response contains a list of categories in a 'data' field
        final List<dynamic> categoryData = response.data['data'];
        // Mapping the category data to a list of CategoryModel
        final List<CategoryModel> categories = categoryData
            .map(
              (category) => CategoryModel.fromJson(category),
            )
            .toList();
        return categories;
      } else {
        // throw DioException(
        //     requestOptions: response.requestOptions,
        //     response: response,
        //     type: DioExceptionType.badResponse,
        //     error:
        //         'Failed to get categories.Status code:${response.statusCode}');
        log('Failed to get the categories');
      }
    } catch (e) {
      // throw DioException(
      //     requestOptions: RequestOptions(path: getcategoryurl),
      //     type: DioExceptionType.badResponse,
      //     error: 'Error getting categories:$e');
      log('Error in getting the categories:$e');
      return [];
    }
    return [];
  }
}
