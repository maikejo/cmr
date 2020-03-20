import './wallet.dart';
import './category.dart';
import './location.dart';
import './friend.dart';

class Transaction {
  Transaction({this.category, this.time, this.memo, this.wallet, this.friend, this.location, this.money});

  Category category;
  DateTime time;
  String memo;
  Wallet wallet;
  Friend friend;
  Location location;
  double money;
}