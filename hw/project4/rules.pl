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

% Urinary Tract Infection

% Asthma
asthma(p3).
asthma(p5).
asthma(p8).

% Ischemic Heart Disease

% Cancer

% Osteomyelitis
osteomyelitis(p4).

% Necrotizing Pneumonia

% Diabetes
diabetes(p3).
diabetes(p4).

% Chronic Renal Disease
chronic_renal_disease(p3).

% Chronic Heart Failure
chronic_heart_failure(p5).

% Necrotizing Fasciitis

% COPD

% Peripheral Vascular Disease

% Dementia

% Gastrointestinal Disorder

% Chronic Skin Disorder
chronic_skin_disorder(p1).
chronic_skin_disorder(p3).

% Catheter (anywhere)
catheter(p5).

% Mechanical Ventilation
mechanical_ventilation(p3).
mechanical_ventilation(p5).

% Sepic shock

% Open Skin Lesion
open_skin_lesion(p1).
open_skin_lesion(p8).

% Past MRSA Infections
prev_mrsa(p3).
prev_mrsa(p5).
prev_mrsa(p7).

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

% Admitted to ICU
admitted_icu(p2).
admitted_icu(p8).

% Survival >= 30 days
survival_greater_equal_30(p1).
survival_greater_equal_30(p2).
survival_greater_equal_30(p3).
survival_greater_equal_30(p4).
survival_greater_equal_30(p5).
survival_greater_equal_30(p7).
survival_greater_equal_30(p9).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
age_greater_or_equal_75(Person) :-
    age(Person, Age),
    Age >= 75.

age_under_75(Person) :- not(age_greater_or_equal_75(Person)).

age_less_2(Person) :- 
    age(Person, Age),
    Age < 2.

female(Person) :- not(male(Person)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predictions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get_score(X, S, P) :-
    ( call(P, X) -> S = 1; S = 0 ).

predict_mrsa(X, S, Threshold) :-
    predict_mrsa_score(X, L),
    sum_list(L, T),
    write('Prediction score is ' + T),
    ( T > Threshold -> S = true; S = false ).

predict_mrsa_score(X, S) :-
    get_score(X, S1, male),
    get_score(X, S2, prev_hosp),
    get_score(X, S3, prev_surg),
    get_score(X, S4, prev_mrsa),
    get_score(X, S5, catheter),
    get_score(X, S6, freq_antibiotics),
    get_score(X, S7, chronic_skin_disorder),
    %%get_score(X, S8, ischemic_heart_disease),
    %%get_score(X, S9, cancer),
    get_score(X, S10, chronic_renal_disease),
    get_score(X, S11, open_skin_lesion),
    S = [ S1, S2, S3, S4, S5, S6, S7, S10, S11 ].


predict_hosp_or_comm_aqcuired_score(X, HAP, CAP) :-

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
    get_score(X, HA9, chronic_renal_disease),
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