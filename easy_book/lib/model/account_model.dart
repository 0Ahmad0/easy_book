class AccountModel {
  final int id;
  final String cardGuide;
  final String? mainAccount;
  final String cardCode;
  final String accountName;
  final String? latinName;

  AccountModel({
    required this.id,
    required this.cardGuide,
    this.mainAccount,
    required this.cardCode,
    required this.accountName,
    this.latinName,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      cardGuide: json['cardGuide'],
      mainAccount: json['mainAccount'],
      cardCode: json['cardCode'],
      accountName: json['accountName'],
      latinName: json['latinName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardGuide': cardGuide,
      'mainAccount': mainAccount,
      'cardCode': cardCode,
      'accountName': accountName,
      'latinName': latinName,
    };
  }
}
