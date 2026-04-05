class EndPoints {
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/';
  static const String loginApi = 'v1/auth/signin';
  static const String registerApi = 'v1/auth/signup';
  static const String getAllCategoriesApi = 'v1/categories';
  static const String getAllBrandsApi = 'v1/brands';
  static const String getAllProductsApi = 'v1/products';
  static const String cartApi = 'v2/cart';
  static const String deleteOrUpdateProductInCartApi = 'v2/cart/{productId}';
  static const String deleteProductFromWishlistApi = 'v1/wishlist/{productId}';
  static const String wishlistApi = 'v1/wishlist';
}
