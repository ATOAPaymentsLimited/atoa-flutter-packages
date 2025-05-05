/*
  DLS Utility is a singleton class for toggling event tracking
*/
class DlsUtility {
  factory DlsUtility() => _instance;
  DlsUtility._();

  static final _instance = DlsUtility._();

  static bool enableTracking = false;
}
