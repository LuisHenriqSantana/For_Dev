import 'package:for_dev/data/cache/cache.dart';
import 'package:for_dev/data/models/models.dart';
import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/helpers/helpers.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class LocalLoadSurveys implements LoadSurveys{
  final CacheStorage cacheStorage;

  LocalLoadSurveys({@required this.cacheStorage});

  Future<List<SurveyEntity>> load() async {
    try {
      final data = await cacheStorage.fetch('surveys');
      if (data?.isEmpty != false) {
        throw Exception();
      }
      return data.map<SurveyEntity>((json) =>
          LocalSurveyModel.fromJson(json).toEntity()).toList();
    } catch(error){
      throw DomainError.unexpected;
    }
  }

  Future<void> validate() async {
    final data = await cacheStorage.fetch('surveys');
    try{
      data.map<SurveyEntity>((json) =>
          LocalSurveyModel.fromJson(json).toEntity()).toList();
    } catch(error){
      await cacheStorage.delete('surveys');
    }
  }
}