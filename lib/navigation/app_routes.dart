enum AppRoutes {
  home,
  counter,
  user,
  product,
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
      case AppRoutes.home:
      default:
        return '/';
    }
  }
}
