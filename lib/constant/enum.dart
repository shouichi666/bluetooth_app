///
enum StoragePath {
  myaddress,
  friends,
}

///認証プロバイダー
enum AuthProvider {
  email, //メール and パスワード
  google, //Google
  apple, //Apple
}

///使用デバイス
enum Device {
  ios,
  android,
}

///発信中、拒否
enum ConnectState {
  calling, //発信中
  decline, //拒否
  connected, //接続
  disconnect, //接続切れ
}

///
enum CallRole {
  caller,
  receiver,
}

///
enum CallMode {
  voice,
  video,
}

///
enum AudioFile {
  startEffect,
  endEffect,
  ringtone1,
  ringtone2,
}

///
enum AvaterMode {
  myAddress,
  friend,
}

///Firestore取得先 サーバー or キャッシュ
enum FetchMode {
  cache,
  server,
}
