%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Age
age(p1, 16).
age(p2, 0).
age(p3, 59).
age(p4, 39).
age(p5, 28).
age(p6, 80).
age(p7, 54).
age(p8, 15).
age(p9, 53).

% Male
male(p7).
male(p8).
male(p9).

%  Previous Hospitalization (in past 12 months)
prev_hosp(p3).
prev_hosp(p5).
prev_hosp(p6).
prev_hosp(p7).

% Previous Surgery (in past 12 months)
prev_surg(p5).
prev_surg(p6).
prev_surg(p7).

% Is Athlete
athlete(p1).

% Is IV Drug User

% Taken Antibiotics Frequently
freq_antibiotics(p5).
freq_antibiotics(p7).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
age_greater_or_equal_75(Person) :-
    age(Person, Age),
    Age >= 75.

age_under_75(Person) :- age_greater_or_equal_75(Person), !, fail.

age_less_2(Person) :- 
    age(Person, Age),
    Age < 2.

female(Person) :- male(Person), !, fail.