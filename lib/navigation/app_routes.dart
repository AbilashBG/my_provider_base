enum AppRoutes {
  home,
  counter,
  user,
  product,
  cart,
}

extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.counter:
        return '/counter';
      case AppRoutes.user:
        return '/product';
      case AppRoutes.product:
        return '/user';
      case AppRoutes.cart:
        return '/cart';
      case AppRoutes.home:
      default:
        return '/';
    }
  }
}
