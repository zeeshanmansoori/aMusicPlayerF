class Restrictions {
  Restrictions({
      required this.reason,});

  factory Restrictions.fromJson(dynamic json) {
    var reason = json['reason'];
    return Restrictions(reason: reason);
  }
  String reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reason'] = reason;
    return map;
  }

}