class shloks {
  final int s_n;
  final String shlok;
  final String hindi;
  final String gujarati;
  final String english;

  shloks({
    required this.s_n,
    required this.shlok,
    required this.hindi,
    required this.english,
    required this.gujarati,
  });

  factory shloks.fromMap({required Map data}) {
    return shloks(
      s_n: data["s_n"],
      shlok: data["shlok"],
      hindi: data["hindi"],
      english: data["english"],
      gujarati: data["gujarati"],
    );
  }
}
