class Endpoints {
  static String baseUrl = 'localhost';

  //Auth
  static String signUp = '$baseUrl/signup';
  static String signIn = '$baseUrl/signin';

  //Note
  static String getNotes = '$baseUrl/all';
  static String createNote = '$baseUrl/add';
  static String getANote = '$baseUrl/note';
  static String editNote = '$baseUrl/edit';
  static String deleteNote = '$baseUrl/delete';
}