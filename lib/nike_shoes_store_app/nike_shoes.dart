class NikeShoes {
  NikeShoes({
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.images,
    required this.modelNumber,
    required this.color,
  });
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;
}

final shoes = <NikeShoes>[
  NikeShoes(
    model: 'AIR MAX 90 EZ BLACK',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/nike_shoes_store/shoes1_1.png',
      'assets/nike_shoes_store/shoes1_2.png',
      'assets/nike_shoes_store/shoes1_3.png',
    ],
    modelNumber: 90,
    color: 0xFFF6F6F6,
  ),
  NikeShoes(
    model: 'AIR MAX 270 Gold',
    currentPrice: 199,
    oldPrice: 349,
    images: [
      'assets/nike_shoes_store/shoes2_1.png',
      'assets/nike_shoes_store/shoes2_2.png',
      'assets/nike_shoes_store/shoes2_3.png',
    ],
    modelNumber: 270,
    color: 0xFFFCF5EB,
  ),
  NikeShoes(
    model: 'AIR MAX 95 Red',
    currentPrice: 299,
    oldPrice: 399,
    images: [
      'assets/nike_shoes_store/shoes3_1.png',
      'assets/nike_shoes_store/shoes3_2.png',
      'assets/nike_shoes_store/shoes3_3.png',
    ],
    modelNumber: 95,
    color: 0xFFFEEFEF,
  ),
  NikeShoes(
    model: 'AIR MAX 98 FREE',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/nike_shoes_store/shoes4_1.png',
      'assets/nike_shoes_store/shoes4_2.png',
      'assets/nike_shoes_store/shoes4_3.png',
    ],
    modelNumber: 98,
    color: 0xFFEDF3FE,
  )
];
