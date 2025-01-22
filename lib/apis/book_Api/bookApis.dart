import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:libraryproject/models/book/bookModel.dart';
import 'package:libraryproject/services/apiClient.dart';

class BookService {
  Future<String> createBook({required Book book}) async {
    try {
      final formData = FormData.fromMap({
        "serialNumber": book.serialNumber,
        "title": book.title,
        "author": book.author,
        "genre": book.genre,
        "publisher": book.publisher,
        "publicationYear": book.publicationYear,
        "price": book.price,
        if (book.cover != null)
          'cover': await MultipartFile.fromFile(book.cover!.path,
              contentType: MediaType('image', 'jpg')),
      });
      final response = await ApiClient.dio.post('/createBook', data: formData);
      log("res: ${response.data.toString()}");
      if (response.data['result'] == "success") {
        return "Success";
      } else {
        return "Failed!";
      }
    } catch (error) {
      return "failed due to: $error";
    }
  }

  Future<List<Book>> getAllBooks() async {
    List<Book> books = [];
    try {
      final response = await ApiClient.dio.get("/getAllBooks");
      if (response.data['result'] == "success") {
        for (var item in response.data['data']) {
          books.add(Book.fromJson(item));
        }
        return books;
      } else {
        return [];
      }
    } catch (error) {
      log("Error: $error");
      return [];
    }
  }

  Future<List<dynamic>> getAllGenres() async {
    try {
      final response = await ApiClient.dio.get("/getAllGenres");
      if (response.data['result'] == "success") {
        return response.data['data'];
      } else {
        return [];
      }
    } catch (error) {
      log("Error: $error");
      return [];
    }
  }

  Future<List<Book>> getBooksByGenre(String genre) async {
    List<Book> books = [];
    try {
      final response = await ApiClient.dio.get("/getAllBooks/$genre");
      if (response.data['result'] == "success") {
        for (var item in response.data['data']) {
          books.add(Book.fromJson(item));
        }
        return books;
      } else {
        return [];
      }
    } catch (error) {
      log("Error: $error");
      return [];
    }
  }
}
