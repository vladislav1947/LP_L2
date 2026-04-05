:- encoding(utf8).
:- use_module(library(clpfd)).
:- use_module(library(lists)).

% Базовые домены расписания.

day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).

day_index(monday,1).
day_index(tuesday,2).
day_index(wednesday,3).
day_index(thursday,4).
day_index(friday,5).

slot(1).
slot(2).
slot(3).
slot(4).
slot(5).
slot(6).

slot_time(1,'08:30-10:00').
slot_time(2,'10:15-11:45').
slot_time(3,'12:00-13:30').
slot_time(4,'13:45-15:15').
slot_time(5,'15:30-17:00').
slot_time(6,'17:15-18:45').

pair_hours(2).

absolute_slot(Day,Slot,AbsoluteSlot) :-
    day_index(Day,DayIndex),
    AbsoluteSlot is (DayIndex - 1) * 6 + Slot.

absolute_slot_to_day_slot(AbsoluteSlot,Day,Slot) :-
    DayIndex is ((AbsoluteSlot - 1) // 6) + 1,
    Slot is ((AbsoluteSlot - 1) mod 6) + 1,
    day_index(Day,DayIndex).

% Учебные группы.

group(cs_101).
group(cs_102).
group(ai_101).
group(se_101).
group(is_101).

group_size(cs_101,28).
group_size(cs_102,27).
group_size(ai_101,24).
group_size(se_101,25).
group_size(is_101,30).

% Предметы, преподаватели и аудитории.

subject(discrete_math).
subject(programming).
subject(logic_programming).
subject(databases).
subject(computer_networks).
subject(physics).
subject(english).
subject(philosophy).
subject(algorithms).
subject(project_practice).

subject_hours(discrete_math,2).
subject_hours(programming,3).
subject_hours(logic_programming,3).
subject_hours(databases,3).
subject_hours(computer_networks,3).
subject_hours(physics,2).
subject_hours(english,2).
subject_hours(philosophy,2).
subject_hours(algorithms,2).
subject_hours(project_practice,3).

subject_requirement(discrete_math,projector).
subject_requirement(programming,computers).
subject_requirement(logic_programming,computers).
subject_requirement(databases,computers).
subject_requirement(computer_networks,networks).
subject_requirement(physics,lab_kit).
subject_requirement(english,projector).
subject_requirement(philosophy,none).
subject_requirement(algorithms,projector).
subject_requirement(project_practice,computers).

teacher(petrova).
teacher(smirnov).
teacher(sokolov).
teacher(lebedev).
teacher(volkova).
teacher(orlova).

teaches(petrova,discrete_math).
teaches(petrova,algorithms).
teaches(smirnov,programming).
teaches(smirnov,logic_programming).
teaches(sokolov,databases).
teaches(sokolov,computer_networks).
teaches(sokolov,project_practice).
teaches(lebedev,physics).
teaches(lebedev,project_practice).
teaches(volkova,philosophy).
teaches(orlova,english).

room(a101,40,[projector]).
room(a102,32,[projector]).
room(a201,36,[projector]).
room(lab1,32,[projector,computers]).
room(lab2,30,[projector,computers]).
room(lab3,30,[projector,computers]).
room(net_lab,30,[projector,computers,networks]).
room(phy_lab,30,[projector,lab_kit]).
room(seminar1,26,[]).
room(seminar2,30,[projector]).

room_index(1,a101).
room_index(2,a102).
room_index(3,a201).
room_index(4,lab1).
room_index(5,lab2).
room_index(6,lab3).
room_index(7,net_lab).
room_index(8,phy_lab).
room_index(9,seminar1).
room_index(10,seminar2).

% Основные факты расписания на одну учебную неделю.

lesson(cs_101,discrete_math,petrova,monday,1,a101).
lesson(cs_102,programming,smirnov,monday,1,lab1).
lesson(ai_101,english,orlova,monday,1,a102).
lesson(se_101,physics,lebedev,monday,1,phy_lab).
lesson(is_101,databases,sokolov,monday,1,lab2).

lesson(cs_101,programming,smirnov,monday,2,lab3).
lesson(cs_102,discrete_math,petrova,monday,2,a201).
lesson(ai_101,physics,lebedev,monday,2,phy_lab).
lesson(se_101,philosophy,volkova,monday,2,seminar2).
lesson(is_101,computer_networks,sokolov,monday,2,net_lab).

lesson(cs_101,algorithms,petrova,tuesday,1,a101).
lesson(cs_102,logic_programming,smirnov,tuesday,1,lab1).
lesson(ai_101,philosophy,volkova,tuesday,1,seminar1).
lesson(se_101,computer_networks,sokolov,tuesday,1,net_lab).
lesson(is_101,physics,lebedev,tuesday,1,phy_lab).

lesson(cs_101,physics,lebedev,tuesday,3,phy_lab).
lesson(cs_102,english,orlova,tuesday,3,a102).
lesson(ai_101,programming,smirnov,tuesday,3,lab2).
lesson(se_101,discrete_math,petrova,tuesday,3,a101).
lesson(is_101,project_practice,sokolov,tuesday,3,lab1).

lesson(cs_101,logic_programming,smirnov,wednesday,2,lab1).
lesson(cs_102,databases,sokolov,wednesday,2,lab2).
lesson(ai_101,discrete_math,petrova,wednesday,2,a101).
lesson(se_101,english,orlova,wednesday,2,a102).
lesson(is_101,physics,lebedev,wednesday,2,phy_lab).

lesson(cs_101,english,orlova,wednesday,4,seminar2).
lesson(cs_102,algorithms,petrova,wednesday,4,a201).
lesson(ai_101,databases,sokolov,wednesday,4,lab3).
lesson(se_101,programming,smirnov,wednesday,4,lab1).
lesson(is_101,project_practice,lebedev,wednesday,4,lab2).

lesson(cs_101,databases,sokolov,thursday,2,lab2).
lesson(cs_102,physics,lebedev,thursday,2,phy_lab).
lesson(ai_101,logic_programming,smirnov,thursday,2,lab1).
lesson(se_101,algorithms,petrova,thursday,2,a101).
lesson(is_101,english,orlova,thursday,2,a102).

lesson(cs_101,philosophy,volkova,thursday,3,seminar2).
lesson(cs_102,computer_networks,sokolov,thursday,3,net_lab).
lesson(ai_101,physics,lebedev,thursday,3,phy_lab).
lesson(se_101,logic_programming,smirnov,thursday,3,lab2).
lesson(is_101,discrete_math,petrova,thursday,3,a101).

lesson(cs_101,project_practice,lebedev,friday,1,lab1).
lesson(cs_102,philosophy,volkova,friday,1,seminar2).
lesson(ai_101,algorithms,petrova,friday,1,a201).
lesson(se_101,databases,sokolov,friday,1,lab2).
lesson(is_101,programming,smirnov,friday,1,lab3).

lesson(cs_101,computer_networks,sokolov,friday,2,net_lab).
lesson(cs_102,algorithms,petrova,friday,2,a101).
lesson(ai_101,project_practice,lebedev,friday,2,lab1).
lesson(se_101,english,orlova,friday,2,a102).
lesson(is_101,logic_programming,smirnov,friday,2,lab2).

% Русскоязычный алиас к основному факту занятия.

'занятие'(Group,Subject,Teacher,Day,Slot,Room) :-
    lesson(Group,Subject,Teacher,Day,Slot,Room).

% Вспомогательные предикаты.

scheduled_lesson(lesson(Group,Subject,Teacher,Day,Slot,Room)) :-
    lesson(Group,Subject,Teacher,Day,Slot,Room).

room_has_equipment(Room,none) :-
    room(Room,_,_).
room_has_equipment(Room,Equipment) :-
    room(Room,_,EquipmentList),
    member(Equipment,EquipmentList).

room_suitable(Room,Group,Subject) :-
    group_size(Group,GroupSize),
    room(Room,Capacity,_),
    Capacity >= GroupSize,
    subject_requirement(Subject,Equipment),
    room_has_equipment(Room,Equipment).

lesson_key(lesson(Group,_,_,Day,Slot,_),Key) :-
    day_index(Day,DayIndex),
    Key = DayIndex-Slot-Group.

extract_values([],[]).
extract_values([_-Value|Rest],[Value|Values]) :-
    extract_values(Rest,Values).

sort_lessons(Lessons,SortedLessons) :-
    findall(Key-Lesson,
        (
            member(Lesson,Lessons),
            lesson_key(Lesson,Key)
        ),
        Pairs
    ),
    keysort(Pairs,SortedPairs),
    extract_values(SortedPairs,SortedLessons).

sorted_schedule(SortedLessons) :-
    findall(lesson(Group,Subject,Teacher,Day,Slot,Room),
        lesson(Group,Subject,Teacher,Day,Slot,Room),
        Lessons
    ),
    sort_lessons(Lessons,SortedLessons).

% Уровень 1. Базовые аналитические запросы.

when_subject(Group,Subject,Day,Slot,Room) :-
    lesson(Group,Subject,_,Day,Slot,Room).

free_room(Room,Day,Slot) :-
    room(Room,_,_),
    \+ lesson(_,_,_,Day,Slot,Room).

'свободна_аудитория'(Room,Day,Slot) :-
    free_room(Room,Day,Slot).

free_rooms(Day,Slot,Rooms) :-
    setof(Room, free_room(Room,Day,Slot), Rooms).

teacher_groups(Teacher,Groups) :-
    teacher(Teacher),
    setof(Group, Subject^Day^Slot^Room^lesson(Group,Subject,Teacher,Day,Slot,Room), Groups).

group_load(Group,LessonCount) :-
    group(Group),
    aggregate_all(count, lesson(Group,_,_,_,_,_), LessonCount).

'нагрузка_группы'(Group,LessonCount) :-
    group_load(Group,LessonCount).

group_day_load(Group,Day,LessonCount) :-
    group(Group),
    day(Day),
    aggregate_all(count, lesson(Group,_,_,Day,_,_), LessonCount).

teacher_day_load(Teacher,Day,LessonCount) :-
    teacher(Teacher),
    day(Day),
    aggregate_all(count, lesson(_,_,Teacher,Day,_,_), LessonCount).

teacher_free_day(Teacher,Day) :-
    teacher(Teacher),
    day(Day),
    \+ lesson(_,_,Teacher,Day,_,_).

group_day_slots(Group,Day,Slots) :-
    findall(Slot, lesson(Group,_,_,Day,Slot,_), RawSlots),
    sort(RawSlots,Slots).

day_gap_count([],0).
day_gap_count([_],0).
day_gap_count(Slots,GapCount) :-
    min_list(Slots,FirstSlot),
    max_list(Slots,LastSlot),
    length(Slots,LessonCount),
    GapCount is LastSlot - FirstSlot + 1 - LessonCount.

schedule_gaps(Group,GapCount) :-
    findall(DayGap,
        (
            day(Day),
            group_day_slots(Group,Day,Slots),
            day_gap_count(Slots,DayGap)
        ),
        DayGaps
    ),
    sum_list(DayGaps,GapCount).

'окна_в_расписании'(Group,GapCount) :-
    schedule_gaps(Group,GapCount).

teacher_weekly_hours(Teacher,Hours) :-
    teacher(Teacher),
    pair_hours(PairHours),
    aggregate_all(count, lesson(_,_,Teacher,_,_,_), LessonCount),
    Hours is LessonCount * PairHours.

least_busy_day(Group,Day) :-
    setof(LessonCount-DayName, group_day_load(Group,DayName,LessonCount), Counts),
    Counts = [MinCount-_|_],
    member(MinCount-Day, Counts).

% Уровень 2. Проверка корректности и метрики качества.

group_conflict(Group,Day,Slot,Lessons) :-
    group(Group),
    day(Day),
    slot(Slot),
    findall(lesson(Group,Subject,Teacher,Day,Slot,Room),
        lesson(Group,Subject,Teacher,Day,Slot,Room),
        Lessons
    ),
    length(Lessons,ConflictCount),
    ConflictCount > 1.

teacher_conflict(Teacher,Day,Slot,Lessons) :-
    teacher(Teacher),
    day(Day),
    slot(Slot),
    findall(lesson(Group,Subject,Teacher,Day,Slot,Room),
        lesson(Group,Subject,Teacher,Day,Slot,Room),
        Lessons
    ),
    length(Lessons,ConflictCount),
    ConflictCount > 1.

room_slot_conflict(Room,Day,Slot,Lessons) :-
    room(Room,_,_),
    day(Day),
    slot(Slot),
    findall(lesson(Group,Subject,Teacher,Day,Slot,Room),
        lesson(Group,Subject,Teacher,Day,Slot,Room),
        Lessons
    ),
    length(Lessons,ConflictCount),
    ConflictCount > 1.

room_capacity_violation(Group,Subject,Day,Slot,Room) :-
    lesson(Group,Subject,_,Day,Slot,Room),
    group_size(Group,GroupSize),
    room(Room,Capacity,_),
    GroupSize > Capacity.

room_equipment_violation(Group,Subject,Day,Slot,Room) :-
    lesson(Group,Subject,_,Day,Slot,Room),
    subject_requirement(Subject,Equipment),
    \+ room_has_equipment(Room,Equipment).

no_group_conflicts :-
    \+ group_conflict(_,_,_,_).

'нет_конфликтов_групп' :-
    no_group_conflicts.

no_teacher_conflicts :-
    \+ teacher_conflict(_,_,_,_).

'нет_конфликтов_преподавателей' :-
    no_teacher_conflicts.

no_room_conflicts :-
    \+ room_slot_conflict(_,_,_,_),
    \+ room_capacity_violation(_,_,_,_,_),
    \+ room_equipment_violation(_,_,_,_,_).

'нет_конфликтов_аудиторий' :-
    no_room_conflicts.

overloaded_teacher(Teacher,Hours) :-
    teacher_weekly_hours(Teacher,Hours),
    Hours > 20.

lessons_group_conflict(Lessons,Group,Day,Slot) :-
    group(Group),
    day(Day),
    slot(Slot),
    findall(1, member(lesson(Group,_,_,Day,Slot,_),Lessons), Matches),
    length(Matches,ConflictCount),
    ConflictCount > 1.

lessons_teacher_conflict(Lessons,Teacher,Day,Slot) :-
    teacher(Teacher),
    day(Day),
    slot(Slot),
    findall(1, member(lesson(_,_,Teacher,Day,Slot,_),Lessons), Matches),
    length(Matches,ConflictCount),
    ConflictCount > 1.

lessons_room_conflict(Lessons,Room,Day,Slot) :-
    room(Room,_,_),
    day(Day),
    slot(Slot),
    findall(1, member(lesson(_,_,_,Day,Slot,Room),Lessons), Matches),
    length(Matches,ConflictCount),
    ConflictCount > 1.

lessons_room_violation(Lessons,Group,Subject,Day,Slot,Room) :-
    member(lesson(Group,Subject,_,Day,Slot,Room),Lessons),
    \+ room_suitable(Room,Group,Subject).

valid_lessons(Lessons) :-
    \+ lessons_group_conflict(Lessons,_,_,_),
    \+ lessons_teacher_conflict(Lessons,_,_,_),
    \+ lessons_room_conflict(Lessons,_,_,_),
    \+ lessons_room_violation(Lessons,_,_,_,_,_).

lesson_conflicts_with_schedule(lesson(Group,_,Teacher,Day,Slot,Room),ExcludedLessons) :-
    lesson(OtherGroup,OtherSubject,OtherTeacher,Day,Slot,OtherRoom),
    ExistingLesson = lesson(OtherGroup,OtherSubject,OtherTeacher,Day,Slot,OtherRoom),
    \+ memberchk(ExistingLesson,ExcludedLessons),
    (
        Group = OtherGroup
    ;
        Teacher = OtherTeacher
    ;
        Room = OtherRoom
    ).

swapped_lessons(
    lesson(Group1,Subject1,Teacher1,Day1,Slot1,Room1),
    lesson(Group2,Subject2,Teacher2,Day2,Slot2,Room2),
    lesson(Group1,Subject1,Teacher1,Day2,Slot2,Room2),
    lesson(Group2,Subject2,Teacher2,Day1,Slot1,Room1)
).

valid_swapped_lesson(lesson(Group,Subject,Teacher,Day,Slot,Room),ExcludedLessons) :-
    day(Day),
    slot(Slot),
    room(Room,_,_),
    room_suitable(Room,Group,Subject),
    \+ lesson_conflicts_with_schedule(lesson(Group,Subject,Teacher,Day,Slot,Room),ExcludedLessons).

can_swap(LessonA,LessonB) :-
    scheduled_lesson(LessonA),
    scheduled_lesson(LessonB),
    LessonA \= LessonB,
    swapped_lessons(LessonA,LessonB,SwappedA,SwappedB),
    valid_swapped_lesson(SwappedA,[LessonA,LessonB]),
    valid_swapped_lesson(SwappedB,[LessonA,LessonB]).

'можно_переставить'(LessonA,LessonB) :-
    can_swap(LessonA,LessonB).

% Уровень 3. Генерация допустимого расписания средствами CLP(FD).
% Генератор использует каталог обязательных занятий без фиксированных дней,
% затем распределяет их по 30 слотам, минимизируя окна.

suitable_room_indices(Group,Subject,Indices) :-
    findall(Index,
        (
            room_index(Index,Room),
            room_suitable(Room,Group,Subject)
        ),
        Indices
    ).

prepare_tasks([],_,[],[]).
prepare_tasks([data(Group,Subject,Teacher)|Rest],Index,
    [task(Index,Group,Subject,Teacher,AbsoluteSlot)|TaskRest],
    [AbsoluteSlot|SlotVars]
) :-
    AbsoluteSlot #>= 1,
    AbsoluteSlot #=< 30,
    NextIndex is Index + 1,
    prepare_tasks(Rest,NextIndex,TaskRest,SlotVars).

constrain_tasks([]).
constrain_tasks([Task|Rest]) :-
    constrain_task(Task,Rest),
    constrain_tasks(Rest).

constrain_task(_,[]).
constrain_task(task(_,Group,_,Teacher,Slot), [task(_,OtherGroup,_,OtherTeacher,OtherSlot)|Rest]) :-
    ( Group == OtherGroup -> Slot #\= OtherSlot ; true ),
    ( Teacher == OtherTeacher -> Slot #\= OtherSlot ; true ),
    constrain_task(task(_,Group,_,Teacher,Slot),Rest).

slot_match_bool(SlotVar,AbsoluteSlot,Bool) :-
    Bool in 0..1,
    (SlotVar #= AbsoluteSlot) #<==> Bool.

occupied_slot_for_group_day(Tasks,Group,Day,SlotNumber,Occupied) :-
    absolute_slot(Day,SlotNumber,AbsoluteSlot),
    findall(Bool,
        (
            member(task(_,Group,_,_,SlotVar),Tasks),
            slot_match_bool(SlotVar,AbsoluteSlot,Bool)
        ),
        MatchBools
    ),
    sum(MatchBools,#=,MatchCount),
    Occupied in 0..1,
    (MatchCount #>= 1) #<==> Occupied.

window_hole(Prefix,Current,Suffix,Hole) :-
    sum(Prefix,#=,PrefixCount),
    sum(Suffix,#=,SuffixCount),
    Before in 0..1,
    After in 0..1,
    Empty in 0..1,
    (PrefixCount #>= 1) #<==> Before,
    (SuffixCount #>= 1) #<==> After,
    (Current #= 0) #<==> Empty,
    Hole in 0..1,
    Hole #<==> (Empty #/\ Before #/\ After).

window_holes([],_,_,[]).
window_holes([Current|Suffix],Prefix,Index,Holes) :-
    ( Index > 1, Suffix \= [] ->
        window_hole(Prefix,Current,Suffix,Hole),
        Holes = [Hole|RestHoles]
    ;
        Holes = RestHoles
    ),
    append(Prefix,[Current],NewPrefix),
    NextIndex is Index + 1,
    window_holes(Suffix,NewPrefix,NextIndex,RestHoles).

group_day_penalty_from_occupied(OccupiedSlots,Penalty) :-
    window_holes(OccupiedSlots,[],1,HoleBools),
    sum(HoleBools,#=,Penalty).

group_day_profile(Tasks,Group,Day,OccupiedSlots,DayLoad,DayPenalty) :-
    findall(Occupied,
        (
            slot(SlotNumber),
            occupied_slot_for_group_day(Tasks,Group,Day,SlotNumber,Occupied)
        ),
        OccupiedSlots
    ),
    sum(OccupiedSlots,#=,DayLoad),
    group_day_penalty_from_occupied(OccupiedSlots,DayPenalty).

constrain_group_distribution(Tasks) :-
    forall(
        (group(Group), day(Day)),
        (
            group_day_profile(Tasks,Group,Day,_,DayLoad,_),
            DayLoad #=< 3
        )
    ).

compactness_penalty(Tasks,TotalPenalty) :-
    findall(DayPenalty,
        (
            group(Group),
            day(Day),
            group_day_profile(Tasks,Group,Day,_,_,DayPenalty)
        ),
        Penalties
    ),
    sum(Penalties,#=,TotalPenalty).

room_assignment_key(task(_,Group,Subject,_,AbsoluteSlot),Key) :-
    suitable_room_indices(Group,Subject,RoomIndices),
    length(RoomIndices,OptionCount),
    Key = AbsoluteSlot-OptionCount-Group.

sort_tasks_for_room_assignment(Tasks,SortedTasks) :-
    findall(Key-Task,
        (
            member(Task,Tasks),
            room_assignment_key(Task,Key)
        ),
        Pairs
    ),
    keysort(Pairs,SortedPairs),
    extract_values(SortedPairs,SortedTasks).

assign_rooms(Tasks,AssignedTasks) :-
    sort_tasks_for_room_assignment(Tasks,SortedTasks),
    assign_rooms_sorted(SortedTasks,[],ReversedTasks),
    reverse(ReversedTasks,AssignedTasks).

assign_rooms_sorted([],AssignedTasks,AssignedTasks).
assign_rooms_sorted([task(Index,Group,Subject,Teacher,AbsoluteSlot)|Rest],CurrentAssignments,AssignedTasks) :-
    suitable_room_indices(Group,Subject,RoomIndices),
    member(RoomIndex,RoomIndices),
    \+ member(assigned_task(_,_,_,_,AbsoluteSlot,RoomIndex),CurrentAssignments),
    assign_rooms_sorted(
        Rest,
        [assigned_task(Index,Group,Subject,Teacher,AbsoluteSlot,RoomIndex)|CurrentAssignments],
        AssignedTasks
    ).

task_to_lesson(assigned_task(_,Group,Subject,Teacher,AbsoluteSlot,RoomIndex), lesson(Group,Subject,Teacher,Day,Slot,Room)) :-
    absolute_slot_to_day_slot(AbsoluteSlot,Day,Slot),
    room_index(RoomIndex,Room).

required_lessons_count(Subject,LessonCount) :-
    subject_hours(Subject,Hours),
    pair_hours(PairHours),
    LessonCount is (Hours + PairHours - 1) // PairHours.

curriculum_entries(Entries) :-
    setof(entry(Group,Subject,Teacher),
        Day^Slot^Room^lesson(Group,Subject,Teacher,Day,Slot,Room),
        Entries
    ).

replicate_term(0,_,[]) :-
    !.
replicate_term(Count,Term,[Term|Rest]) :-
    Count > 0,
    NextCount is Count - 1,
    replicate_term(NextCount,Term,Rest).

expand_curriculum_entries([],[]).
expand_curriculum_entries([entry(Group,Subject,Teacher)|Rest],Data) :-
    required_lessons_count(Subject,LessonCount),
    replicate_term(LessonCount,data(Group,Subject,Teacher),CurrentData),
    expand_curriculum_entries(Rest,RestData),
    append(CurrentData,RestData,Data).

generation_input(Data) :-
    curriculum_entries(Entries),
    expand_curriculum_entries(Entries,Data).

generate_schedule(GeneratedLessons) :-
    generate_schedule(GeneratedLessons,_).

generate_schedule(GeneratedLessons,TotalPenalty) :-
    generation_input(Data),
    prepare_tasks(Data,1,Tasks,SlotVars),
    constrain_tasks(Tasks),
    constrain_group_distribution(Tasks),
    compactness_penalty(Tasks,TotalPenalty),
    append(SlotVars,[TotalPenalty],OptimizationVars),
    labeling([ffc,min(TotalPenalty)],OptimizationVars),
    assign_rooms(Tasks,AssignedTasks),
    maplist(task_to_lesson,AssignedTasks,UnsortedLessons),
    sort_lessons(UnsortedLessons,GeneratedLessons).

% Экспорт текущего или сгенерированного расписания в CSV.

write_csv_row(Stream,lesson(Group,Subject,Teacher,Day,Slot,Room)) :-
    slot_time(Slot,TimeRange),
    format(Stream,"~w,~w,~w,~w,~w,~w,~w~n",[Group,Subject,Teacher,Day,Slot,TimeRange,Room]).

export_lessons_csv(FileName,Lessons) :-
    setup_call_cleanup(
        open(FileName,write,Stream,[encoding(utf8)]),
        (
            write(Stream,"group,subject,teacher,day,slot,time,room\n"),
            forall(member(Lesson,Lessons), write_csv_row(Stream,Lesson))
        ),
        close(Stream)
    ).

export_schedule_csv(FileName) :-
    sorted_schedule(Lessons),
    export_lessons_csv(FileName,Lessons).

export_generated_schedule_csv(FileName) :-
    generate_schedule(Lessons),
    export_lessons_csv(FileName,Lessons).
