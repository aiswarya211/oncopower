class ImageResource {
  static String _imagePNG(String name) => "assets/images/$name.png";

  static String _imageJPG(String name) => "assets/images/$name.jpg";

  static String oncopowerLogo = _imagePNG("oncopower_logo");
  
  static String onVisionIcon = _imagePNG("vision");

///[JPG]
  static String onRoutesFound = _imageJPG("no_routes_found");
}