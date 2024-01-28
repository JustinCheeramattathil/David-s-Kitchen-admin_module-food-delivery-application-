// ignore_for_file: unused_element
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adminmodule/model/category_model.dart';
import 'package:adminmodule/repository/category_repository.dart';
import 'package:image_picker/image_picker.dart';

class CategoryController extends ChangeNotifier {
  final CategoryRepository _categoryRepository;

  CategoryController(this._categoryRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;


  File? _selectedImage;
  File? get image => _selectedImage;
// Function used to pick image from the gallery of the device
   void setImage(File? image) {
    _selectedImage = image;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    setImage(File(pickedImage.path));
  }

  

  Future<void> addCategory(CategoryModel categorymodel) async {
    await _categoryRepository.addCategory(categorymodel);
    getCategories();
  }

  Future<void> getCategories() async {
    _categories = await _categoryRepository.getCategories();
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


}
