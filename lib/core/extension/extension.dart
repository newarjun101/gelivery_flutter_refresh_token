

extension CustomDateFormatter on String? {


  String? removeTimeStamp() {
    String value = "";
    if(this != null || (this??"").isNotEmpty){
      DateTime date = DateTime.parse(this!);
      value  = "${date.day}-${date.month}-${date.year}";
    }
    return value;


}
}