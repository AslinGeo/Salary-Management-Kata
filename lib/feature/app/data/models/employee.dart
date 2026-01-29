class Employee {
  final int? id;
  final String fullName;
  final String jobTitle;
  final String country;
  final double salary;

  Employee({
    this.id,
    required this.fullName,
    required this.jobTitle,
    required this.country,
    required this.salary,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullName,
      'job_title': jobTitle,
      'country': country,
      'salary': salary,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      fullName: map['full_name'],
      jobTitle: map['job_title'],
      country: map['country'],
      salary: map['salary'],
    );
  }
}
