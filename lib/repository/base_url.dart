import 'package:http_class/model/model.dart';

/// ロジックを持たない抽象メソッドをもつクラス抽象を定義する
abstract class BaseUrl {
  /// こちらの抽象メソッドはロジックを持たず、継承したクラスで上書きして、ロジックを変更する。
  /// モデルであるAlbumクラスを型に使って、fetchAlbumメソッドで
  /// [http通信]でデータを[GET]するときに使う.
  Future<Album> fetchAlbum();
}
