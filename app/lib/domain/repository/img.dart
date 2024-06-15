import 'package:todo/domain/entities/img.dart';
import 'package:xml/xml.dart';

abstract class ImgRepository {
  Future<XmlDocument> getImgs(String query, {int page = 1, int perPage = 10});

  Future<List<ImgEntity>> getImgsOfTask(String taskId);

  Future<void> addImgs(String taskId, List<ImgEntity> imgs);

  Future<void> removeImg(String imgId);
}
