- [Readings](#readings)
- [Class Notes](#class-notes)

# Readings
## MYCIN

## DINTO
- Pharmacological knowledge representation and reasoning
    - 2 main subtypes
        1) those using semantic networks
        2) those based on description logics (DLs) representations and/or rules

- **Pharmacokinetik (PK)** - one drug affects levels of another in body.
- **Pharmacodynamic (PD)** - one drug alters the effects of another drug without altering concentration.

- DINTO includes both PKs and PDs
- Drugs can have several relationships with the same protein
- MYCIN incorporated Certainty Factor, DINTO does not perhaps?

# Class notes
2020/02/03

FMA
    - Cornelius ROsse
    - Jim Brinkley
    - "Onard" Mejino

Comparing KR paradigms
    - Relational DBs
    - RDF linked data
    - RDFS object-oriented (is it really?)
    - OWL: descriptive logics
    - Other logics

SELECT *
WHERE 
{
    ?dx rdf:type
    ?dx rdf:subclassOf* :Diagnosis
}

2020/02/05

- Description logic
- Intentional definitions ("descriptions") of classes