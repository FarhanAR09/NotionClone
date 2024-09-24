class Endpoints {
  static String baseUrl = 'localhost';

  //Auth
  static String signUp = '$baseUrl/auth/create';
  static String signIn = '$baseUrl/auth/signin';

  //Note
  static String getNotes = '$baseUrl/api/notes/all';
  static String createNote = '$baseUrl/api/notes/create';
  static String getANote = '$baseUrl/api/notes/note';
  static String editNote = '$baseUrl/api/notes/edit';
  static String deleteNote = '$baseUrl/api/notes/delete';
}