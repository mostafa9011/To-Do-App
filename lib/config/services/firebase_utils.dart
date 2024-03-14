import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/app/tasks/models/task_model.dart';
import 'package:todo_app/config/constants/extract_time.dart';

class FirestoreManager {
  CollectionReference<TaskModel> getCollectionRef() {
    var db = FirebaseFirestore.instance;
    return db.collection('Tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, options) =>
              TaskModel.fromJson(snapshot.data()),
          toFirestore: (value, options) => value.toFirestore(),
        );
  }

  Future<void> addTask(TaskModel task) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  Future<void> deleteTask(String id) {
    var collectionRef = getCollectionRef();
    return collectionRef.doc(id).delete();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateTask({required TaskModel taskModel, required String id}) {
    return users
        .doc(id)
        .update(taskModel.toFirestore())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Stream<QuerySnapshot<TaskModel>> getData(DateTime dateTime) {
    var collectionRef = getCollectionRef()
        .where('time', isEqualTo: extractTime(dateTime).millisecondsSinceEpoch);
    // var data =  collectionRef.get();
    return collectionRef.snapshots();
  }
}
