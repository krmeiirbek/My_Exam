import '../entities/entities.dart';
import '../utils/utils.dart';

class CourseAPI {
  static Future<GetAllCoursesResponseEntity> getCourses() async {
    var response = await HttpUtil().get(
      '/api/v1/courses',
    );
    return GetAllCoursesResponseEntity.fromJson(response);
  }
}