:- encoding(utf8).
:- consult('schedule.pl').
:- begin_tests(schedule).

% Когда у группы cs_101 предмет programming?
test(when_subject_true, [nondet]) :-
    when_subject(cs_101,programming,monday,2,lab3).

% Русскоязычный алиас к факту занятия.
test(lesson_alias_true, [nondet]) :-
    'занятие'(cs_102,logic_programming,smirnov,tuesday,1,lab1).

% Какие аудитории свободны в среду на 2 паре?
test(free_room_true, [nondet]) :-
    free_room(a201,wednesday,2).

% Русскоязычный алиас к предикату свободной аудитории.
test(free_room_alias_true, [nondet]) :-
    'свободна_аудитория'(seminar2,wednesday,2).

% Получение полного списка свободных аудиторий.
test(free_rooms_wednesday_slot2, true(Rooms == [a201,lab3,net_lab,seminar1,seminar2])) :-
    free_rooms(wednesday,2,Rooms).

% У каких групп ведет занятия преподаватель orlova?
test(teacher_groups_true, true(Groups == [ai_101,cs_101,cs_102,is_101,se_101])) :-
    teacher_groups(orlova,Groups).

% Сколько пар в неделю у группы cs_101?
test(group_load_true, [true(Load == 10), nondet]) :-
    group_load(cs_101,Load).

% Русскоязычный алиас к нагрузке группы.
test(group_load_alias_true, [true(Load == 10), nondet]) :-
    'нагрузка_группы'(ai_101,Load).

% Нагрузка корректно перечисляет все группы при свободной переменной.
test(group_load_enumerates_groups, set(Group-Load == [ai_101-10,cs_101-10,cs_102-10,is_101-10,se_101-10])) :-
    group_load(Group,Load).

% Нагрузка группы по дню также перечисляет реальные группы.
test(group_day_load_enumerates_groups, set(Group-Load == [ai_101-2,cs_101-2,cs_102-2,is_101-2,se_101-2])) :-
    group_day_load(Group,monday,Load).

% Нагрузка преподавателя по дню перечисляет реальных преподавателей.
test(teacher_day_load_enumerates_teachers, set(Teacher-Load == [lebedev-2,orlova-1,petrova-2,smirnov-2,sokolov-2,volkova-1])) :-
    teacher_day_load(Teacher,monday,Load).

% Какой день свободен у преподавателя volkova?
test(teacher_free_day_true, [nondet]) :-
    teacher_free_day(volkova,wednesday).

% Сколько окон в расписании у группы cs_101?
test(schedule_gaps_true, [true(Gaps == 2), nondet]) :-
    schedule_gaps(cs_101,Gaps).

% Русскоязычный алиас к подсчету окон.
test(schedule_gaps_alias_true, [true(Gaps == 2), nondet]) :-
    'окна_в_расписании'(cs_101,Gaps).

% Сколько учебных часов в неделю у преподавателя sokolov?
test(teacher_weekly_hours_true, [true(Hours == 20), nondet]) :-
    teacher_weekly_hours(sokolov,Hours).

% Какие дни минимально загружены у группы cs_101?
test(least_busy_day_true, set(Day == [friday,monday,thursday,tuesday,wednesday])) :-
    least_busy_day(cs_101,Day).

% Предикат минимально загруженного дня перечисляет реальные группы.
test(least_busy_day_enumerates_groups, set(Group == [ai_101,cs_101,cs_102,is_101,se_101])) :-
    least_busy_day(Group,_Day).

% При текущей сетке перегруженных преподавателей нет.
test(overloaded_teacher_false, fail) :-
    overloaded_teacher(_Teacher,_Hours).

% Проверка корректности: конфликтов по группам нет.
test(no_group_conflicts_true, [nondet]) :-
    no_group_conflicts.

% Проверка корректности: конфликтов по преподавателям нет.
test(no_teacher_conflicts_true, [nondet]) :-
    no_teacher_conflicts.

% Проверка корректности: конфликтов по аудиториям, вместимости и оборудованию нет.
test(no_room_conflicts_true, [nondet]) :-
    no_room_conflicts.

% Русскоязычные алиасы к проверкам корректности.
test(no_conflicts_aliases_true, [nondet]) :-
    'нет_конфликтов_групп',
    'нет_конфликтов_преподавателей',
    'нет_конфликтов_аудиторий'.

% Можно ли переставить две пары местами без конфликтов?
test(can_swap_true, [nondet]) :-
    LessonA = lesson(cs_101,english,orlova,wednesday,4,seminar2),
    LessonB = lesson(cs_101,philosophy,volkova,thursday,3,seminar2),
    can_swap(LessonA,LessonB).

% Русскоязычный алиас к предикату перестановки.
test(can_swap_alias_true, [nondet]) :-
    LessonA = lesson(cs_101,english,orlova,wednesday,4,seminar2),
    LessonB = lesson(cs_101,philosophy,volkova,thursday,3,seminar2),
    'можно_переставить'(LessonA,LessonB).

% Ограничение распределения не требует наличия занятий в каждый день.
test(group_distribution_allows_empty_days, [nondet]) :-
    constrain_group_distribution([task(1,cs_101,discrete_math,petrova,1)]).

% Генератор использует учебный план, а не кратность исходных lesson/6.
test(generate_schedule_uses_subject_hours, [true(Count == 2), nondet]) :-
    generate_schedule(GeneratedLessons,_Penalty),
    aggregate_all(count, member(lesson(cs_101,programming,smirnov,_,_,_), GeneratedLessons), Count).

% Генератор строит полное и валидное расписание по расширенному учебному плану.
test(generate_schedule_valid, [true(Count == ExpectedCount), nondet]) :-
    generation_input(InputData),
    length(InputData,ExpectedCount),
    generate_schedule(GeneratedLessons,_Penalty),
    length(GeneratedLessons,Count),
    valid_lessons(GeneratedLessons).

% HTML-экспорт для уровня 3 создает полноценный документ с таблицей.
test(export_generated_schedule_html_creates_document, [nondet]) :-
    tmp_file_stream(text,FileName,PlaceholderStream),
    close(PlaceholderStream),
    export_generated_schedule_html(FileName),
    setup_call_cleanup(
        open(FileName,read,Stream,[encoding(utf8)]),
        read_string(Stream,_,Html),
        close(Stream)
    ),
    delete_file(FileName),
    sub_string(Html,_,_,_,'<!DOCTYPE html>'),
    sub_string(Html,_,_,_,'Сгенерированное расписание'),
    sub_string(Html,_,_,_,'<table>').

:- end_tests(schedule).

% Для демонстрации в REPL можно использовать и обычные запросы:
% ?- when_subject(cs_101,programming,Day,Slot,Room).
% ?- free_rooms(wednesday,2,Rooms).
% ?- teacher_groups(orlova,Groups).
% ?- teacher_free_day(volkova,Day).
% ?- schedule_gaps(cs_101,Gaps).
% ?- overloaded_teacher(Teacher,Hours).
% ?- generate_schedule(GeneratedLessons,Penalty).
% ?- export_schedule_csv('current_schedule.csv').
% ?- export_generated_schedule_csv('generated_schedule.csv').
% ?- export_generated_schedule_html('generated_schedule.html').

:- run_tests.
