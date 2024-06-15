import 'package:drift/drift.dart';
import 'package:todo/data/datasources/db.dart';
import 'package:todo/domain/entities/img.dart';
import 'package:xml/xml.dart';

class ImgMapper {
  Future<List<String>> mapXmlDoc(XmlDocument xml) async {
    final photos = xml.children[2].children[1].children;
    final List<String> photosUrl = [];

    for (var i = 1; i < photos.length; i += 2) {
      final id = photos[i].attributes[0].value;
      final secret = photos[i].attributes[2].value;
      final serverId = photos[i].attributes[3].value;

      photosUrl
          .add('https://live.staticflickr.com/$serverId/${id}_${secret}_w.jpg');
    }

    return photosUrl;
  }

  Future<ImgModelCompanion> mapImgEntity(ImgEntity img) async {
    ImgModelCompanion taskModel = ImgModelCompanion(
      id: Value(img.id),
      url: Value(img.url),
      taskId: Value(img.taskId),
    );

    return taskModel;
  }

  Future<ImgEntity> mapImgModel(ImgModelData img) async {
    return ImgEntity(
      id: img.id,
      url: img.url,
      taskId: img.taskId,
    );
  }
}
