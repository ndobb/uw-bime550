%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Patient
patient(p1).
patient(p2).
patient(p3).
patient(p4).
patient(p5).
patient(p6).
patient(p7).
patient(p8).
patient(p9).
patient(p10).
patient(dummyp1).

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
age(p10, 53).
age(dummyp1, 50).

% Female / Male
male(p7).
male(p8).
male(p9).
male(p10).
male(dummyp1).

%  Previous Hospitalization (in past 12 months)
prev_hosp(p3).
prev_hosp(p5).
prev_hosp(p6).
prev_hosp(p7).
prev_hosp(p10).
prev_hosp(dummyp1).

% Previous Surgery (in past 12 months)
prev_surg(p5).
prev_surg(p6).
prev_surg(p7).
prev_surg(p10).
prev_surg(dummyp1).

% Is Athlete
athlete(p1).

% Is IV Drug User
iv_drug_user(dummyp1).

% Taken Antibiotics Frequently
freq_antibiotics(p5).
freq_antibiotics(p7).

% Urinary Tract Infection
urinary_tract_infection(dummyp1).

% Asthma
asthma(p3).
asthma(p5).
asthma(p8).

% Ischemic Heart Disease
ischemic_heart_disease(dummyp1).

% Cancer
cancer(dummyp1).

% Osteomyelitis
osteomyelitis(p4).

% Necrotizing Pneumonia
necrotizing_pneumonia(dummyp1).

% Diabetes
diabetes(p3).
diabetes(p4).

% Chronic Renal Disease or Impairment
chronic_renal_disease_or_impair(p3).
chronic_renal_disease_or_impair(p6).
chronic_renal_disease_or_impair(p7).

% Chronic Heart Failure
chronic_heart_failure(p5).

% Necrotizing Fasciitis
necrotizing_fasciitis(dummyp1).

% COPD
copd(dummyp1).

% Peripheral Vascular Disease
peripheral_vascular_disease(dummyp1).

% Dementia
dementia(dummyp1).

% Gastrointestinal Disorder
gastrointestinal_disorder(dummyp1).

% Chronic Skin Disorder
chronic_skin_disorder(p1).
chronic_skin_disorder(p3).

% Catheter (anywhere)
catheter(p5).

% Mechanical Ventilation
mechanical_ventilation(p3).
mechanical_ventilation(p5).

% Sepsis
sepsis(p5).
sepsis(p6).
sepsis(p7).
sepsis(p8).

% Open Skin Lesion
open_skin_lesion(p1).
open_skin_lesion(p8).

% Past MRSA Infections
prev_mrsa(p3).
prev_mrsa(p5).
prev_mrsa(p7).

% Previous Vancomycin
prev_vancomycin(p6).
prev_vancomycin(p7).

% Vancomycin
tx_vancomycin(p2).
tx_vancomycin(p3).
tx_vancomycin(p4).
tx_vancomycin(p7).
tx_vancomycin(p8).
tx_vancomycin(p9).

% Linezolid
tx_linezolid(p2).
tx_linezolid(p3).
tx_linezolid(p5).
tx_linezolid(p6).
tx_linezolid(p9).

% Daptomycin
tx_daptomycin(p2).
tx_daptomycin(p7).

% Positive Culture
positive_culture(p5).
positive_culture(p6).
positive_culture(p7).
positive_culture(p8).
positive_culture(p9).
positive_culture(p10).

% Endocarditis
endocarditis(p5).
endocarditis(p6).

% Hospital or Commmunity-Acquired
hospital_acquired(p5).
hospital_acquired(p6).
hospital_acquired(p7).
hospital_acquired(p10).
community_acquired(p8).
community_acquired(p9).

% Pregnant
pregnant(dummyp1).

% Systemic Illness
systemic_illness(dummyp1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
not_member(_, []) :- !.

not_member(X, [H|T]) :-
     X \= H,
    not_member(X, T).

age_greater_or_equal_75(Person) :-
    age(Person, Age),
    Age >= 75.

age_under_75(Person) :- 
    age(Person, Age),
    Age < 75.

age_less_2(Person) :- 
    age(Person, Age),
    Age < 2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predictions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get_score(X, S, P) :-
    ( call(P, X) -> S = 1; S = 0 ).

predict_mrsa(X, S, Threshold) :-
    get_score(X, S1, male),
    get_score(X, S2, prev_hosp),
    get_score(X, S3, prev_surg),
    get_score(X, S4, prev_mrsa),
    get_score(X, S5, catheter),
    get_score(X, S6, freq_antibiotics),
    get_score(X, S7, chronic_skin_disorder),
    %%get_score(X, S8, ischemic_heart_disease),
    %%get_score(X, S9, cancer),
    get_score(X, S10, chronic_renal_disease_or_impair),
    get_score(X, S11, open_skin_lesion),
    S = [ S1, S2, S3, S4, S5, S6, S7, S10, S11 ],
    sum_list(S, T),
    write('MRSA prediction score is ' + T),
    ( T > Threshold -> S = true; S = false ).

predict_hosp_or_comm_acquired_score(X, HAP, CAP) :-

    % Community-acquired
    get_score(X, CA1, age_greater_or_equal_75),
    get_score(X, CA2, male),
    get_score(X, CA3, athlete),
    % get_score(X, CA4, iv_drug_user),
    get_score(X, CA5, prev_mrsa),
    get_score(X, CA6, chronic_skin_disorder),

    % Hospital-acquired
    get_score(X, HA1, male),
    get_score(X, HA2, prev_hosp),
    get_score(X, HA3, prev_mrsa),
    get_score(X, HA4, catheter),
    get_score(X, HA5, freq_antibiotics),
    get_score(X, HA6, chronic_skin_disorder),
    % get_score(X, HA7, ischemic_heart_disease),
    % get_score(X, HA8, cancer),
    get_score(X, HA9, chronic_renal_disease_or_impair),
    get_score(X, HA10, open_skin_lesion),

    % Compare
    CAL = [ CA1, CA2, CA3, CA5, CA6 ],
    HAL = [ HA1, HA2, HA3, HA4, HA5, HA6, HA9 , HA10 ],
    sum_list(CAL, CAS),
    sum_list(HAL, HAS),
    length(CAL, CALEN),
    length(HAL, HALEN),
    CA is (float(CAS / CALEN)),
    HA is (float(HAS / HALEN)),
    write('Community-Acquired prediction is ' + CA + '\n'),
    write('Hospital-Acquired prediction is ' + HA),
    ( CA >= HA -> CAP = true, HAP = false; CAP = false, HAP = true ).

suggest_tx_daptomycin(X) :-
    (
        sepsis(X);
        chronic_renal_disease_or_impair(X);
        cancer(X)
    ),
    age(X, Age),
    Age > 8,
    findall(Preg, pregnant(Preg), PregL),
    not_member(X, PregL).

suggest_tx_linezolid(X) :-
    patient(X),
    findall(D, suggest_tx_daptomycin(D), DL),
    not_member(X, DL),
    prev_vancomycin(X).

suggest_tx_vancomycin(X) :-
    patient(X),
    findall(D, suggest_tx_daptomycin(D), DL),
    findall(L, suggest_tx_linezolid(L), LL),
    not_member(X, DL),
    not_member(X, LL).
