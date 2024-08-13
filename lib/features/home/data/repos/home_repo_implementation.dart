import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';

import 'package:bookly_app/features/home/data/models/book_model.dart';

import 'package:dartz/dartz.dart';

import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo{
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async{
   try {
     var data = await apiService.get(endPoint: 'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest');
     List<BookModel> books = [];
     for(var item in data['items']){
       books.add(BookModel.fromJson(item));
     }
     return right(books);
   } catch (e) {
     return left(ServerFailure());
   }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

}