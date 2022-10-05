/// モデルとなるAlbumクラスを定義する
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });
  // 常に新しいインスタンスを作成しないときは、factoryを使用する。
  // シングルトンと呼ばれている
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
