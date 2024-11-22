extension ValidDenominations on int {
  List<int> getValidDenominations() {
    final List<int> denominations = [10, 25, 50, 100, 500, 1000];
    return denominations.where((amount) => amount <= this).toList();
  }
}
