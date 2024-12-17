sealed class SubjectAction {}

class GetAllSubjectsAction extends SubjectAction {}

class SerchSubjectsAction extends SubjectAction {
  final String searchText;

  SerchSubjectsAction(this.searchText);
}
