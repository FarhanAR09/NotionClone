class Endpoints {
  static String baseUrl = 'localhost/api';

  //Auth
  static String signUp = '$baseUrl/users/create';
  static String signIn = '$baseUrl/auth/signin';

  //Note
  static String getNotes = '$baseUrl/all';
  static String createNote = '$baseUrl/add';
  static String getANote = '$baseUrl/note';
  static String editNote = '$baseUrl/edit';
  static String deleteNote = '$baseUrl/delete';
}