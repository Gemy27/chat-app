class Messagemodel{
  final String message;
  final String id;
  const Messagemodel(this.message,this.id);
  factory Messagemodel.fromJson(jsondata)
  {
    return Messagemodel(jsondata['message'],jsondata['id']);
  }
}