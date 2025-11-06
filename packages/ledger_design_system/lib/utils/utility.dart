/*
  DLS Utility is a singleton class for toggling event tracking
*/
class LedgerUtility {
  factory LedgerUtility() => _instance;
  LedgerUtility._();

  static final _instance = LedgerUtility._();

  static bool enableTracking = false;
}
