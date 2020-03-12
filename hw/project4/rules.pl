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

% Open Skin Lesions
open_skin_lesions(p1).
open_skin_lesions(p8).

% Past MRSA Infections
past_mrsa(p3).
past_mrsa(p5).
past_mrsa(p7).

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