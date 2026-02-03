class CollectionModel {
  final String title;
  List<String>? images;

  CollectionModel({required this.title, required this.images});
}

List<CollectionModel> collections = [
  CollectionModel(
    title: "T-Shirts Collection",
    images: [
      "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
      "https://images.unsplash.com/photo-1512436991641-6745cdb1723f",
      "https://images.unsplash.com/photo-1523381210434-271e8be1f52b",
      "https://images.unsplash.com/photo-1503341504253-dff4815485f1",
      "https://images.unsplash.com/photo-1495121605193-b116b5b09a18",
    ],
  ),
  CollectionModel(
    title: "Hoodies Collection",
    images: [
      "https://images.unsplash.com/photo-1556821840-3a63f95609a7",
      "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf",
      "https://images.unsplash.com/photo-1593030761757-71fae45fa0e7",
      "https://images.unsplash.com/photo-1618354691373-d851c5c3a990",
      "https://images.unsplash.com/photo-1585386959984-a41552231658",
    ],
  ),
  CollectionModel(
    title: "Shoes Collection",
    images: [
      "https://rukminim2.flixcart.com/image/480/640/xif0q/shoe/7/d/4/6-195-40-asteroid-black-original-imah7byzffjfevkg.jpeg?q=90",
      "https://www.campusshoes.com/cdn/shop/files/VESPER_VESPER_L.GRY-M.BLU_07.webp?v=1758174842",
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77",
      "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519",
    ],
  ),
];
