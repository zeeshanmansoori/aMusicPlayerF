class Pair<A, B> {
  final A first;
  final B second;

  Pair(
    this.first,
    this.second,
  );

  @override
  String toString() {
    return 'Pair{first: $first, second: $second}';
  }
}
