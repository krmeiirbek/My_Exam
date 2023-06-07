import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';

import '../entities/entities.dart';
import '../utils/utils.dart';

class SubjectAPI {
  static Future<GetAllSubjectsResponseEntity> getSubjects(
      {GetAllSubjectsRequestEntity? params}) async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist("SubjectAPI");
    print("isCacheExist: $isCacheExist");
    if(!isCacheExist){
      var response = await HttpUtil().get(
        '/api/v1/subjects',
        queryParameters: params?.toJson(),
      );
      APICacheDBModel cacheDBModel = APICacheDBModel(key: "SubjectAPI", syncData: jsonEncode(response));
      await APICacheManager().addCacheData(cacheDBModel);
      return GetAllSubjectsResponseEntity.fromJson(response);
    }
    else {
      var cacheData = await APICacheManager().getCacheData("SubjectAPI");
      print(cacheData);
      return GetAllSubjectsResponseEntity.fromJson(jsonDecode(cacheData.syncData));
    }
  }
}
