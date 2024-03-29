import '../entities/entities.dart';
import '../utils/utils.dart';

class CourseAPI {
  static Future<GetAllCoursesResponseEntity> getCourses({required int id}) async {
    var response = await HttpUtil().get(
      '/api/v1/subjects/$id/courses',
    );
    return GetAllCoursesResponseEntity.fromJson(response);
  }
}