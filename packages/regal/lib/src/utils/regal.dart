class Regal {
  factory Regal() => _instance;
  Regal._();

  static final _instance = Regal._();

  static bool enableTracking = true;
}
