// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $CategoryModelTable extends CategoryModel
    with TableInfo<$CategoryModelTable, CategoryModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_model';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CategoryModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CategoryModelTable createAlias(String alias) {
    return $CategoryModelTable(attachedDatabase, alias);
  }
}

class CategoryModelData extends DataClass
    implements Insertable<CategoryModelData> {
  final String id;
  final String name;
  final DateTime createdAt;
  const CategoryModelData(
      {required this.id, required this.name, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CategoryModelCompanion toCompanion(bool nullToAbsent) {
    return CategoryModelCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory CategoryModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryModelData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CategoryModelData copyWith({String? id, String? name, DateTime? createdAt}) =>
      CategoryModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class CategoryModelCompanion extends UpdateCompanion<CategoryModelData> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CategoryModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryModelCompanion.insert({
    required String id,
    required String name,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<CategoryModelData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryModelCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return CategoryModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskModelTable extends TaskModel
    with TableInfo<$TaskModelTable, TaskModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'is_favourite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favourite" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category_model (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, isCompleted, isFavourite, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_model';
  @override
  VerificationContext validateIntegrity(Insertable<TaskModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['is_favourite']!, _isFavouriteMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TaskModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      isFavourite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favourite'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $TaskModelTable createAlias(String alias) {
    return $TaskModelTable(attachedDatabase, alias);
  }
}

class TaskModelData extends DataClass implements Insertable<TaskModelData> {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final bool isCompleted;
  final bool isFavourite;
  final String categoryId;
  const TaskModelData(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.isCompleted,
      required this.isFavourite,
      required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_favourite'] = Variable<bool>(isFavourite);
    map['category_id'] = Variable<String>(categoryId);
    return map;
  }

  TaskModelCompanion toCompanion(bool nullToAbsent) {
    return TaskModelCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      isCompleted: Value(isCompleted),
      isFavourite: Value(isFavourite),
      categoryId: Value(categoryId),
    );
  }

  factory TaskModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskModelData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isFavourite': serializer.toJson<bool>(isFavourite),
      'categoryId': serializer.toJson<String>(categoryId),
    };
  }

  TaskModelData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          bool? isCompleted,
          bool? isFavourite,
          String? categoryId}) =>
      TaskModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        isCompleted: isCompleted ?? this.isCompleted,
        isFavourite: isFavourite ?? this.isFavourite,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('TaskModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, description, createdAt, isCompleted, isFavourite, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.isCompleted == this.isCompleted &&
          other.isFavourite == this.isFavourite &&
          other.categoryId == this.categoryId);
}

class TaskModelCompanion extends UpdateCompanion<TaskModelData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<bool> isCompleted;
  final Value<bool> isFavourite;
  final Value<String> categoryId;
  final Value<int> rowid;
  const TaskModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskModelCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    this.isCompleted = const Value.absent(),
    this.isFavourite = const Value.absent(),
    required String categoryId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        categoryId = Value(categoryId);
  static Insertable<TaskModelData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<bool>? isCompleted,
    Expression<bool>? isFavourite,
    Expression<String>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskModelCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<bool>? isCompleted,
      Value<bool>? isFavourite,
      Value<String>? categoryId,
      Value<int>? rowid}) {
    return TaskModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isCompleted: isCompleted ?? this.isCompleted,
      isFavourite: isFavourite ?? this.isFavourite,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FilterModelTable extends FilterModel
    with TableInfo<$FilterModelTable, FilterModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FilterModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category_model (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<int> name = GeneratedColumn<int>(
      'name', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, categoryId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'filter_model';
  @override
  VerificationContext validateIntegrity(Insertable<FilterModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FilterModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FilterModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $FilterModelTable createAlias(String alias) {
    return $FilterModelTable(attachedDatabase, alias);
  }
}

class FilterModelData extends DataClass implements Insertable<FilterModelData> {
  final int id;
  final String categoryId;
  final int name;
  const FilterModelData(
      {required this.id, required this.categoryId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<String>(categoryId);
    map['name'] = Variable<int>(name);
    return map;
  }

  FilterModelCompanion toCompanion(bool nullToAbsent) {
    return FilterModelCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
    );
  }

  factory FilterModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FilterModelData(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      name: serializer.fromJson<int>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<String>(categoryId),
      'name': serializer.toJson<int>(name),
    };
  }

  FilterModelData copyWith({int? id, String? categoryId, int? name}) =>
      FilterModelData(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('FilterModelData(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilterModelData &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name);
}

class FilterModelCompanion extends UpdateCompanion<FilterModelData> {
  final Value<int> id;
  final Value<String> categoryId;
  final Value<int> name;
  const FilterModelCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
  });
  FilterModelCompanion.insert({
    this.id = const Value.absent(),
    required String categoryId,
    required int name,
  })  : categoryId = Value(categoryId),
        name = Value(name);
  static Insertable<FilterModelData> custom({
    Expression<int>? id,
    Expression<String>? categoryId,
    Expression<int>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
    });
  }

  FilterModelCompanion copyWith(
      {Value<int>? id, Value<String>? categoryId, Value<int>? name}) {
    return FilterModelCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<int>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilterModelCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ImgModelTable extends ImgModel
    with TableInfo<$ImgModelTable, ImgModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImgModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES task_model (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, url, taskId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'img_model';
  @override
  VerificationContext validateIntegrity(Insertable<ImgModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ImgModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImgModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_id'])!,
    );
  }

  @override
  $ImgModelTable createAlias(String alias) {
    return $ImgModelTable(attachedDatabase, alias);
  }
}

class ImgModelData extends DataClass implements Insertable<ImgModelData> {
  final String id;
  final String url;
  final String taskId;
  const ImgModelData(
      {required this.id, required this.url, required this.taskId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['url'] = Variable<String>(url);
    map['task_id'] = Variable<String>(taskId);
    return map;
  }

  ImgModelCompanion toCompanion(bool nullToAbsent) {
    return ImgModelCompanion(
      id: Value(id),
      url: Value(url),
      taskId: Value(taskId),
    );
  }

  factory ImgModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImgModelData(
      id: serializer.fromJson<String>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      taskId: serializer.fromJson<String>(json['taskId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url': serializer.toJson<String>(url),
      'taskId': serializer.toJson<String>(taskId),
    };
  }

  ImgModelData copyWith({String? id, String? url, String? taskId}) =>
      ImgModelData(
        id: id ?? this.id,
        url: url ?? this.url,
        taskId: taskId ?? this.taskId,
      );
  @override
  String toString() {
    return (StringBuffer('ImgModelData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, taskId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImgModelData &&
          other.id == this.id &&
          other.url == this.url &&
          other.taskId == this.taskId);
}

class ImgModelCompanion extends UpdateCompanion<ImgModelData> {
  final Value<String> id;
  final Value<String> url;
  final Value<String> taskId;
  final Value<int> rowid;
  const ImgModelCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.taskId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImgModelCompanion.insert({
    required String id,
    required String url,
    required String taskId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        url = Value(url),
        taskId = Value(taskId);
  static Insertable<ImgModelData> custom({
    Expression<String>? id,
    Expression<String>? url,
    Expression<String>? taskId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (taskId != null) 'task_id': taskId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImgModelCompanion copyWith(
      {Value<String>? id,
      Value<String>? url,
      Value<String>? taskId,
      Value<int>? rowid}) {
    return ImgModelCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      taskId: taskId ?? this.taskId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImgModelCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('taskId: $taskId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $CategoryModelTable categoryModel = $CategoryModelTable(this);
  late final $TaskModelTable taskModel = $TaskModelTable(this);
  late final $FilterModelTable filterModel = $FilterModelTable(this);
  late final $ImgModelTable imgModel = $ImgModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoryModel, taskModel, filterModel, imgModel];
}

typedef $$CategoryModelTableInsertCompanionBuilder = CategoryModelCompanion
    Function({
  required String id,
  required String name,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$CategoryModelTableUpdateCompanionBuilder = CategoryModelCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$CategoryModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryModelTable,
    CategoryModelData,
    $$CategoryModelTableFilterComposer,
    $$CategoryModelTableOrderingComposer,
    $$CategoryModelTableProcessedTableManager,
    $$CategoryModelTableInsertCompanionBuilder,
    $$CategoryModelTableUpdateCompanionBuilder> {
  $$CategoryModelTableTableManager(_$AppDatabase db, $CategoryModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoryModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoryModelTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CategoryModelTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryModelCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String id,
            required String name,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryModelCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$CategoryModelTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $CategoryModelTable,
    CategoryModelData,
    $$CategoryModelTableFilterComposer,
    $$CategoryModelTableOrderingComposer,
    $$CategoryModelTableProcessedTableManager,
    $$CategoryModelTableInsertCompanionBuilder,
    $$CategoryModelTableUpdateCompanionBuilder> {
  $$CategoryModelTableProcessedTableManager(super.$state);
}

class $$CategoryModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoryModelTable> {
  $$CategoryModelTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter taskModelRefs(
      ComposableFilter Function($$TaskModelTableFilterComposer f) f) {
    final $$TaskModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.taskModel,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) =>
            $$TaskModelTableFilterComposer(ComposerState(
                $state.db, $state.db.taskModel, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter filterModelRefs(
      ComposableFilter Function($$FilterModelTableFilterComposer f) f) {
    final $$FilterModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.filterModel,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) =>
            $$FilterModelTableFilterComposer(ComposerState($state.db,
                $state.db.filterModel, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CategoryModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoryModelTable> {
  $$CategoryModelTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaskModelTableInsertCompanionBuilder = TaskModelCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  required DateTime createdAt,
  Value<bool> isCompleted,
  Value<bool> isFavourite,
  required String categoryId,
  Value<int> rowid,
});
typedef $$TaskModelTableUpdateCompanionBuilder = TaskModelCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<bool> isCompleted,
  Value<bool> isFavourite,
  Value<String> categoryId,
  Value<int> rowid,
});

class $$TaskModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskModelTable,
    TaskModelData,
    $$TaskModelTableFilterComposer,
    $$TaskModelTableOrderingComposer,
    $$TaskModelTableProcessedTableManager,
    $$TaskModelTableInsertCompanionBuilder,
    $$TaskModelTableUpdateCompanionBuilder> {
  $$TaskModelTableTableManager(_$AppDatabase db, $TaskModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaskModelTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TaskModelTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> isFavourite = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaskModelCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            isCompleted: isCompleted,
            isFavourite: isFavourite,
            categoryId: categoryId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            required DateTime createdAt,
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> isFavourite = const Value.absent(),
            required String categoryId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TaskModelCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            isCompleted: isCompleted,
            isFavourite: isFavourite,
            categoryId: categoryId,
            rowid: rowid,
          ),
        ));
}

class $$TaskModelTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TaskModelTable,
    TaskModelData,
    $$TaskModelTableFilterComposer,
    $$TaskModelTableOrderingComposer,
    $$TaskModelTableProcessedTableManager,
    $$TaskModelTableInsertCompanionBuilder,
    $$TaskModelTableUpdateCompanionBuilder> {
  $$TaskModelTableProcessedTableManager(super.$state);
}

class $$TaskModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TaskModelTable> {
  $$TaskModelTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isFavourite => $state.composableBuilder(
      column: $state.table.isFavourite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$CategoryModelTableFilterComposer get categoryId {
    final $$CategoryModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categoryModel,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoryModelTableFilterComposer(ComposerState($state.db,
                $state.db.categoryModel, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter imgModelRefs(
      ComposableFilter Function($$ImgModelTableFilterComposer f) f) {
    final $$ImgModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.imgModel,
        getReferencedColumn: (t) => t.taskId,
        builder: (joinBuilder, parentComposers) =>
            $$ImgModelTableFilterComposer(ComposerState(
                $state.db, $state.db.imgModel, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TaskModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TaskModelTable> {
  $$TaskModelTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isFavourite => $state.composableBuilder(
      column: $state.table.isFavourite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$CategoryModelTableOrderingComposer get categoryId {
    final $$CategoryModelTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $state.db.categoryModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$CategoryModelTableOrderingComposer(ComposerState($state.db,
                    $state.db.categoryModel, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$FilterModelTableInsertCompanionBuilder = FilterModelCompanion
    Function({
  Value<int> id,
  required String categoryId,
  required int name,
});
typedef $$FilterModelTableUpdateCompanionBuilder = FilterModelCompanion
    Function({
  Value<int> id,
  Value<String> categoryId,
  Value<int> name,
});

class $$FilterModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FilterModelTable,
    FilterModelData,
    $$FilterModelTableFilterComposer,
    $$FilterModelTableOrderingComposer,
    $$FilterModelTableProcessedTableManager,
    $$FilterModelTableInsertCompanionBuilder,
    $$FilterModelTableUpdateCompanionBuilder> {
  $$FilterModelTableTableManager(_$AppDatabase db, $FilterModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FilterModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FilterModelTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$FilterModelTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<int> name = const Value.absent(),
          }) =>
              FilterModelCompanion(
            id: id,
            categoryId: categoryId,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String categoryId,
            required int name,
          }) =>
              FilterModelCompanion.insert(
            id: id,
            categoryId: categoryId,
            name: name,
          ),
        ));
}

class $$FilterModelTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $FilterModelTable,
    FilterModelData,
    $$FilterModelTableFilterComposer,
    $$FilterModelTableOrderingComposer,
    $$FilterModelTableProcessedTableManager,
    $$FilterModelTableInsertCompanionBuilder,
    $$FilterModelTableUpdateCompanionBuilder> {
  $$FilterModelTableProcessedTableManager(super.$state);
}

class $$FilterModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FilterModelTable> {
  $$FilterModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$CategoryModelTableFilterComposer get categoryId {
    final $$CategoryModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categoryModel,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoryModelTableFilterComposer(ComposerState($state.db,
                $state.db.categoryModel, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FilterModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FilterModelTable> {
  $$FilterModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$CategoryModelTableOrderingComposer get categoryId {
    final $$CategoryModelTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $state.db.categoryModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$CategoryModelTableOrderingComposer(ComposerState($state.db,
                    $state.db.categoryModel, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$ImgModelTableInsertCompanionBuilder = ImgModelCompanion Function({
  required String id,
  required String url,
  required String taskId,
  Value<int> rowid,
});
typedef $$ImgModelTableUpdateCompanionBuilder = ImgModelCompanion Function({
  Value<String> id,
  Value<String> url,
  Value<String> taskId,
  Value<int> rowid,
});

class $$ImgModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ImgModelTable,
    ImgModelData,
    $$ImgModelTableFilterComposer,
    $$ImgModelTableOrderingComposer,
    $$ImgModelTableProcessedTableManager,
    $$ImgModelTableInsertCompanionBuilder,
    $$ImgModelTableUpdateCompanionBuilder> {
  $$ImgModelTableTableManager(_$AppDatabase db, $ImgModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ImgModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ImgModelTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ImgModelTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> taskId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ImgModelCompanion(
            id: id,
            url: url,
            taskId: taskId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String id,
            required String url,
            required String taskId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ImgModelCompanion.insert(
            id: id,
            url: url,
            taskId: taskId,
            rowid: rowid,
          ),
        ));
}

class $$ImgModelTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ImgModelTable,
    ImgModelData,
    $$ImgModelTableFilterComposer,
    $$ImgModelTableOrderingComposer,
    $$ImgModelTableProcessedTableManager,
    $$ImgModelTableInsertCompanionBuilder,
    $$ImgModelTableUpdateCompanionBuilder> {
  $$ImgModelTableProcessedTableManager(super.$state);
}

class $$ImgModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ImgModelTable> {
  $$ImgModelTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$TaskModelTableFilterComposer get taskId {
    final $$TaskModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskId,
        referencedTable: $state.db.taskModel,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TaskModelTableFilterComposer(ComposerState(
                $state.db, $state.db.taskModel, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ImgModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ImgModelTable> {
  $$ImgModelTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$TaskModelTableOrderingComposer get taskId {
    final $$TaskModelTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskId,
        referencedTable: $state.db.taskModel,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TaskModelTableOrderingComposer(ComposerState(
                $state.db, $state.db.taskModel, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$CategoryModelTableTableManager get categoryModel =>
      $$CategoryModelTableTableManager(_db, _db.categoryModel);
  $$TaskModelTableTableManager get taskModel =>
      $$TaskModelTableTableManager(_db, _db.taskModel);
  $$FilterModelTableTableManager get filterModel =>
      $$FilterModelTableTableManager(_db, _db.filterModel);
  $$ImgModelTableTableManager get imgModel =>
      $$ImgModelTableTableManager(_db, _db.imgModel);
}
