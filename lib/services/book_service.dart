import 'package:books_app/models/book.dart';
import 'package:dio/dio.dart';

// 1- create class of the srevice that connects us to the server

class BookService {
  // 2- store a local instance of dio in variable
  final Dio _dio = Dio();
  // 3- url = end point (create var which is base url and save it there)
  final _baseURL = "https://coded-books-api-crud.eapi.joincoded.com/books";
  // 4- Get data from endpoint.. create a function void first

  Future<List<Book>> getBooks() async {
    List<Book> books = [];
    try {
      final response = await _dio.get(_baseURL);
      // print(response);
      books =
          (response.data as List).map((book) => Book.fromJson(book)).toList();
    } catch (e) {
      print(e);
    }
    return books;
  }
}
