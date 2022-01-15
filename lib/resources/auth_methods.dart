class AuthMethods {
  String signUpUser(
      {required String email,
      required String password,
      required String userName,
      required String bio}) {
    String response = "";

    if (email.isEmpty || userName.isEmpty || password.isEmpty || bio.isEmpty) {
      response = "Some error occured";
    }

    try {
      // Signup işlemleri
    } catch (err) {
      response = err.toString();
    }
    return response;
  }

  String loginUser(
      {String email = "duzguntutar@gmail.com", String password = "123456"}) {
    String response = "";

    if (email.isEmpty || password.isEmpty) {
      response = "User name or pass is empty";
    }

    if (email != "duzguntutar@gmail.com" || password != "123456") {
      response = "Kullanıcı bulunamadı.";
    }

    return response;
  }
}
