class CategoryModel {
  final String name;
  final String image;

  CategoryModel({
    required this.name,
    required this.image,
  });
}

final categoryList = [
  CategoryModel(
    name: "beauty",
    image:
        "https://th.bing.com/th/id/R.7e1b3f28735054b036852a692b423e5c?rik=QvGSu1sfqeMIyw&pid=ImgRaw&r=0",
  ),
  CategoryModel(
    name: "fragrances",
    image:
        "https://images.unsplash.com/photo-1541643600914-78b084683601?q=80&w=1904&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  CategoryModel(
    name: "furniture",
    image:
        "https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ),
  CategoryModel(
    name: "groceries",
    image:
        "https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  CategoryModel(
    name: "mens-shirts",
    image:
        "https://images.pexels.com/photos/27065134/pexels-photo-27065134/free-photo-of-a-bearded-man-posing-in-a-patterned-shirt-and-a-hat.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ),
  CategoryModel(
    name: "mens-watches",
    image:
        "https://images.pexels.com/photos/380782/pexels-photo-380782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ),
  CategoryModel(
    name: "mobile-accessories",
    image:
        "https://img.freepik.com/free-photo/modern-stationary-collection-arrangement_23-2149309682.jpg?w=1380&t=st=1721295724~exp=1721296324~hmac=8d7298cbae07b62ce18672a66540c7b36da4fb1ca3f19cb30e59adc889507dd5",
  ),
];
