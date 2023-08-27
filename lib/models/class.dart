class ClassNotes {
  final String object;
  final String translation;
  ClassNotes({
    required this.object,
    required this.translation,
  });

  ClassNotes copyWith({
    String? object,
    String? translation,
  }) {
    return ClassNotes(
      object: object ?? this.object,
      translation: translation ?? this.translation,
    );
  }

  factory ClassNotes.fromMap(Map<String, dynamic> map, String language) {
    return ClassNotes(
      object: map['object'] as String,
      translation: map['translation'][language] as String,
    );
  }

  @override
  String toString() => 'ClassNotes(object: $object, translation: $translation)';

  @override
  bool operator ==(covariant ClassNotes other) {
    if (identical(this, other)) return true;

    return other.object == object && other.translation == translation;
  }

  @override
  int get hashCode => object.hashCode ^ translation.hashCode;
}
