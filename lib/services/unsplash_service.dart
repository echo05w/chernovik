class UnsplashService {
  static String searchUrl(String query) {
    final encoded = Uri.encodeComponent(query);
    return "https://source.unsplash.com/featured/?$encoded";
  }

  static List<String> searchMultiple(String query, int count) {
    final encoded = Uri.encodeComponent(query);

    return List.generate(
      count,
      (i) => "https://source.unsplash.com/random/800x600/?$encoded&sig=$i",
    );
  }
}
