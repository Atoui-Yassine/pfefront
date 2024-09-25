class TaskInfo {
  final String id;
  final String taskDefinitionKey;

  TaskInfo({required this.id, required this.taskDefinitionKey});

  @override
  String toString() {
    return 'TaskInfo{id: $id, taskDefinitionKey: $taskDefinitionKey}';
  }
}