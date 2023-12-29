class Event{
  final String name;
  final String descp;
  final String date;
  final String stime;
  final String etime;

   Event({
    required this.name,
    required this.descp,
    required this.date,
    required this.stime,
    required this.etime,

});
  @override
  String toString(){
    return 'Question(name: $name, descp: $descp, date: $date, stime: $stime, etime: $etime )';
  }
}