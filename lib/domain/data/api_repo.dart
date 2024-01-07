abstract class ApiRepo {
  Future login(String userName, String password);
  Future onLogOut();
  Future getAllAddress(Map<String,dynamic> body);

}
