import 'package:dio/dio.dart';
import 'package:wtracker/data/datasources/db.dart';
import 'package:wtracker/data/mappers/img.dart';
import 'package:wtracker/domain/entities/img.dart';
import 'package:wtracker/domain/repository/img.dart';
import 'package:xml/xml.dart';

class ImgRepositoryData implements ImgRepository {
  final Dio dio;
  final ImgMapper imgMapper;
  final AppDatabase db;

  ImgRepositoryData({
    required this.dio,
    required this.imgMapper,
    required this.db,
  });

  @override
  Future<XmlDocument> getImgs(String query,
      {int page = 1, int perPage = 10}) async {
    final resp = await dio.get(
      'https://www.flickr.com/services/rest',
      queryParameters: {
        'method': 'flickr.photos.search',
        'api_key': '6216a24381f8a25ef6baa20f552dfc0f',
        'text': query,
        'page': page,
        'per_page': perPage
      },
    );
    final XmlDocument xml = XmlDocument.parse(resp.toString());

    return xml;
  }

  @override
  Future<List<ImgEntity>> getImgsOfTask(String taskId) async {
    final q = await Future.wait((await (db.select(db.imgModel)
              ..where((img) => img.taskId.equals(taskId)))
            .get())
        .map((img) => imgMapper.mapImgModel(img))
        .toList());

    return q;
  }

  @override
  Future<void> addImgs(String taskId, List<ImgEntity> imgs) async {
    final List<ImgModelCompanion> imgsDb = await Future.wait(
        imgs.map((img) => imgMapper.mapImgEntity(img)).toList());

    await db.batch((batch) {
      batch.insertAll(db.imgModel, imgsDb);
    });
  }

  @override
  Future<void> removeImg(String imgId) async {
    (db.delete(db.imgModel)..where((img) => img.id.equals(imgId))).go();
  }
}
