import 'package:dartz/dartz.dart';
import 'package:dogs_finder/app/data/model/breed_model.dart';
import 'package:dogs_finder/app/data/model/imges_list_model.dart';
import 'package:dogs_finder/app/data/model/random_image_model.dart';

abstract class DogsRepo {
  Future<Either<BreedModel, Exception>> getBreeds();

  //Random image
  Future<Either<RandomImageModel, Exception>> getRandomImage({breed, subBreed});

  //Images list
  Future<Either<ImagesListModel, Exception>> getImagesList({breed, subBreed});
}
