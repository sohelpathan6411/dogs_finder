import 'package:dartz/dartz.dart';
import 'package:dogs_finder/app/data/model/breed_model.dart';
import 'package:dogs_finder/app/data/model/imges_list_model.dart';
import 'package:dogs_finder/app/data/model/random_image_model.dart';
import 'package:dogs_finder/app/modules/splash/services/dogs_repo.dart';
import 'package:dogs_finder/core/base/dio_client.dart';
import 'package:dogs_finder/core/consts/api_consts.dart';
import 'package:dogs_finder/core/network/network_check_service.dart';

class DogsRepoImpl extends DogsRepo with NetworkCheckService {
  final DioClient _dioClient;

  DogsRepoImpl(this._dioClient);

  @override
  Future<Either<BreedModel, Exception>> getBreeds() async {
    bool data = await checkInternet();

    if (!data) {
      return Right(Exception('No Network found'));
    } else {
      try {
        try {
          var url = getBreedsUrl;

          var result = await _dioClient.request(url, Method.get);

          return result.fold((l) {
            try {
              BreedModel data = BreedModel.fromJson(l.data);

              return Left(data);
            } catch (e) {
              return Right(Exception(""));
            }
          }, (r) => Right(Exception(r)));
        } catch (e) {
          return Right(Exception(""));
        }
      } catch (e) {
        return Right(Exception(e));
      }
    }
  }

  @override
  Future<Either<RandomImageModel, Exception>> getRandomImage(
      {breed, subBreed}) async {
    bool data = await checkInternet();

    if (!data) {
      return Right(Exception('No Network found'));
    } else {
      try {
        String url; //filter by breed OR by (breed and subbreed)
        if (subBreed == '') {
          url = "/breed/$breed/images/random";
        } else {
          url = "/breed/$breed/$subBreed/images/random";
        }

        var result = await _dioClient.request(url, Method.get);

        return result.fold((l) {
          try {
            RandomImageModel data = RandomImageModel.fromJson(l.data);

            return Left(data);
          } catch (e) {
            return Right(Exception(""));
          }
        }, (r) => Right(Exception(r)));
      } catch (e) {
        return Right(Exception(e));
      }
    }
  }

  @override
  Future<Either<ImagesListModel, Exception>> getImagesList(
      {breed, subBreed}) async {
    bool data = await checkInternet();

    if (!data) {
      return Right(Exception('No Network found'));
    } else {
      try {
        String url; //filter by breed OR by (breed and subbreed)
        if (subBreed == '') {
          url = "/breed/$breed/images";
        } else {
          url = "/breed/$breed/$subBreed/images";
        }

        var result = await _dioClient.request(url, Method.get);

        return result.fold((l) {
          try {
            ImagesListModel data = ImagesListModel.fromJson(l.data);

            return Left(data);
          } catch (e) {
            return Right(Exception(""));
          }
        }, (r) => Right(Exception(r)));
      } catch (e) {
        return Right(Exception(e));
      }
    }
  }
}
