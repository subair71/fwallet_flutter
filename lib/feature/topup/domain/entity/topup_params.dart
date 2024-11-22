// domain/entities/beneficiary.dart
class TopUp {
  final String id;
  final String name;
  final String benId;
  final String nickname;
  final double amount;
  final double balance;

  TopUp(
      {required this.id,
      required this.name,
      required this.benId,
      required this.nickname,
      required this.balance,
      required this.amount});
}
