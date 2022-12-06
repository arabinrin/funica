
class CategoryModel {
  final String? category;
  final String? imgIcon;
  CategoryModel({required this.category, required this.imgIcon});
}

List<CategoryModel> categoryModel = [
  CategoryModel(category: 'Sofa', imgIcon: 'assets/icons/chair.png'),
  CategoryModel(category: 'Chairs', imgIcon: 'assets/icons/chair2.png'),
  CategoryModel(category: 'Table', imgIcon: 'assets/icons/table.png'),
  CategoryModel(category: 'Kitchen', imgIcon: 'assets/icons/kitchen.png'),
  CategoryModel(category: 'Lamp', imgIcon: 'assets/icons/lamp.png'),
  CategoryModel(category: 'Cupboard', imgIcon: 'assets/icons/cupboard.png'),
  CategoryModel(category: 'Vase', imgIcon: 'assets/icons/vase.png'),
  CategoryModel(category: 'others', imgIcon: 'assets/icons/more.png'),
];

List<String> categoryNames =
    'Sofa Chairs Table kitchen lamp Cupboard Vase others'.split(' ');
