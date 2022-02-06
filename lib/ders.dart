class Ders {
  final String ad;
  final double harfDegeri;
  final int krediDegeri;
  Ders({
    required this.ad,
    required this.harfDegeri,
    required this.krediDegeri,
  });
  @override
  String toString() {
    return "ad: $ad harfDegeri $harfDegeri krediDegeri $krediDegeri";
  }
}
