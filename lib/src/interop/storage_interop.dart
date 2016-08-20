@JS('firebase.storage')
library firebase3.storage_interop;

import 'package:func/func.dart';
import 'package:js/js.dart';

import 'app_interop.dart';
import 'firebase_interop.dart';

@JS('Storage')
abstract class StorageJsImpl {
  external AppJsImpl get app;
  external void set app(AppJsImpl a);
  external int get maxOperationRetryTime;
  external void set maxOperationRetryTime(int t);
  external int get maxUploadRetryTime;
  external void set maxUploadRetryTime(int t);
  external ReferenceJsImpl ref([String path]);
  external ReferenceJsImpl refFromURL(String url);
  external void setMaxOperationRetryTime(int time);
  external void setMaxUploadRetryTime(int time);
}

@JS('Reference')
abstract class ReferenceJsImpl {
  external String get bucket;
  external void set bucket(String s);
  external String get fullPath;
  external void set fullPath(String s);
  external String get name;
  external void set name(String s);
  external ReferenceJsImpl get parent;
  external void set parent(ReferenceJsImpl r);
  external ReferenceJsImpl get root;
  external void set root(ReferenceJsImpl r);
  external StorageJsImpl get storage;
  external void set storage(StorageJsImpl s);
  external ReferenceJsImpl child(String path);
  external PromiseJsImpl delete();
  external PromiseJsImpl<String> getDownloadURL();
  external PromiseJsImpl<FullMetadataJsImpl> getMetadata();
  external UploadTaskJsImpl put(blob, [UploadMetadataJsImpl metadata]);
  external String toString();
  external PromiseJsImpl<FullMetadataJsImpl> updateMetadata(
      SettableMetadataJsImpl metadata);
}

//@JS('FullMetadata')
@JS()
@anonymous
class FullMetadataJsImpl extends UploadMetadataJsImpl {
  external String get bucket;
  external List<String> get downloadURLs;
  external String get fullPath;
  external String get generation;
  external String get metageneration;
  external String get name;
  external int get size;
  external String get timeCreated;
  external String get updated;

  external factory FullMetadataJsImpl(
      {String md5Hash,
      String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      String contentType,
      dynamic customMetadata});
}

//@JS('UploadMetadata')
@JS()
@anonymous
class UploadMetadataJsImpl extends SettableMetadataJsImpl {
  external String get md5Hash;
  external void set md5Hash(String s);

  external factory UploadMetadataJsImpl(
      {String md5Hash,
      String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      String contentType,
      dynamic customMetadata});
}

@JS('UploadTask')
abstract class UploadTaskJsImpl implements ThenableJsImpl {
  external UploadTaskSnapshotJsImpl get snapshot;
  external void set snapshot(UploadTaskSnapshotJsImpl t);
  external bool cancel();
  external Function on(String event,
      [nextOrObserver, Func1 error, Func0 complete]);
  external bool pause();
  external bool resume();
  external ThenableJsImpl JS$catch([Func1 onReject]);
  external ThenableJsImpl then([Func1 onResolve, Func1 onReject]);
}

@JS('UploadTaskSnapshot')
abstract class UploadTaskSnapshotJsImpl {
  external int get bytesTransferred;
  external void set bytesTransferred(int b);
  external String get downloadURL;
  external void set downloadURL(String s);
  external FullMetadataJsImpl get metadata;
  external void set metadata(FullMetadataJsImpl m);
  external ReferenceJsImpl get ref;
  external void set ref(ReferenceJsImpl r);
  external String get state;
  external void set state(String s);
  external UploadTaskJsImpl get task;
  external void set task(UploadTaskJsImpl t);
  external int get totalBytes;
  external void set totalBytes(int b);
}

//@JS('SettableMetadata')
@JS()
@anonymous
class SettableMetadataJsImpl {
  external String get cacheControl;
  external void set cacheControl(String s);
  external String get contentDisposition;
  external void set contentDisposition(String s);
  external String get contentEncoding;
  external void set contentEncoding(String s);
  external String get contentLanguage;
  external void set contentLanguage(String s);
  external String get contentType;
  external void set contentType(String s);
  external dynamic get customMetadata;
  external void set customMetadata(dynamic s);
  external factory SettableMetadataJsImpl(
      {String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      String contentType,
      dynamic customMetadata});
}

/// An event that is triggered on a task.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage#.TaskEvent>.
abstract class TaskEvent {
  static const STATE_CHANGED = 'state_changed';
}
