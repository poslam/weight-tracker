import 'package:wtracker/data/mappers/img.dart';
import 'package:wtracker/domain/entities/img.dart';
import 'package:wtracker/domain/repository/img.dart';
import 'package:uuid/uuid.dart';
import 'package:xml/xml.dart';

class ImgUseCase {
  final ImgRepository imgRepository;
  final ImgMapper imgMapper;

  ImgUseCase({required this.imgRepository, required this.imgMapper});

  Future<List<String>> getImgs(String query, int page, int perPage) async {
    XmlDocument imgsRaw =
        await imgRepository.getImgs(query, page: page, perPage: perPage);

    return await imgMapper.mapXmlDoc(imgsRaw);
  }

  Future<List<ImgEntity>> getImgsOfTask(String taskId) async {
    return await imgRepository.getImgsOfTask(taskId);
  }

  Future<void> addImgs(String taskId, List<String> imgUrls) async {
    final List<ImgEntity> imgs = imgUrls
        .map(
            (url) => ImgEntity(id: const Uuid().v8(), url: url, taskId: taskId))
        .toList();

    await imgRepository.addImgs(taskId, imgs);
  }

  Future<void> removeImg(String taskId) async {
    return await imgRepository.removeImg(taskId);
  }
}
