class Event {
  final String id;
  final String ename;
  final double fees;
  final int evenue;
  final DateTime edate;

  Event({required this.id, required this.ename, required this.fees,required this.evenue, required this.edate});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      ename: json['ename'],
      fees: json['fees'],
      evenue: json['evenue'],
      edate: json['edate'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ename': ename,
      'fees': fees,
      'evenue': evenue,
      'edate': edate
    };
  }

}
