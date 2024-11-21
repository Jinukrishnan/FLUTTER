import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService{
  late Client client;
  late Databases databases;


  static const endpoint = 'https://cloud.appwrite.io/v1';
  static const projectId = '673efa28000d20d2dea3';
  static const databaseId = '673efa7e003bb0b4b3e3';
  static const collectionId = '673efa8700138a187358';

    AppwriteService() {
    client = Client();
    client.setEndpoint(endpoint);
    client.setProject(projectId);
    databases = Databases(client);
  }

  Future <Document> addTask(String _task)async{
    try {
      
      final documentId=ID.unique();
      final result=await databases.createDocument(databaseId: databaseId, collectionId: collectionId, documentId: documentId, data: {'task':_task,'isCompleted':false});
      return result;
    } catch (e) {
      print("Error creating task $e");
      rethrow;
    }
  }
  // get tasks
   Future<List<Document>> getTasks() async {
    try {
      final result = await databases.listDocuments(
        collectionId: collectionId,
        databaseId: databaseId,
      );
      return result.documents;
    } catch (e) {
      print('Error loading tasks: $e');
      rethrow;
    }
  }

  // complted task
   Future<Document> updateTaskStatus(String documentId, bool completed) async {
    try {
      final result = await databases.updateDocument(
        collectionId: collectionId,
        documentId: documentId,
        data: {'isCompleted': completed},
        databaseId: databaseId,
      );
      return result;
    } catch (e) {
      print('Error updating task status: $e');
      rethrow;
    }
  }

  // delete task
    Future<void> deleteTask(String documentId) async {
    try {
      await databases.deleteDocument(
        collectionId: collectionId,
        documentId: documentId,
        databaseId: databaseId,
      );
    } catch (e) {
      print('Error deleting task: $e');
      rethrow;
    }
  }

}