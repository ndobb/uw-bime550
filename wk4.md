- [Readings](#readings)
- [Class Notes](#class-notes)

# Readings
## BioPAX
- **Biological Pathway Exchange** - standard language to represent biological pathways at the molecular and cellular level.
- Pathways are models delineated within the entire cellular biochemical network that help describe and understand specific biological processes.
- 300+ pathway/molecular interaction databases and visualiation tools developed pre-BioPAX, but most developed to use their own pathway representation language. Exteremely difficult to combine and reuse.
- BioPAX is an ontology, provides syntax based on OWL.
- Representing a pathway in BioPAX requires being explicit, as an 'active protein' is dependent on context, and may be active in one cellular context but inactive in another.
- Reactome can use BioPAX format.
- BioPAX uses PSI-MI controlled vocabularies and other concepts, coordinating in areas of shared interest.
- Developed through community consensus - workshops, mailing lists, community wiki.

## Mechanism-based Pharmacovigilance over the Life Sciences Linked Open Data Cloud
- Semantic web-based method for predicting drug-drug interactions.
- Mechanism-based pharmacovigilance can lead to the inference of newer DDIs and ADRs
- Use 4 data sources exposed as SPARQL endpoints in LSLOD cloud
    - DrugBank
    - PharmGKB
    - KEGG
    - CTD (Comparitive Toxicogenomics Database)
- Retreive:
    - Drug
    - Protein
    - Pathway
    - Phenotype (adverse reaction)
    - Drug *hasTarget* Protein
    - Drug *hasEnzyme* Protein
    - Drug *hasTransporter* Protein
    - Protein *isPresentIn* Pathway
    - Pathway *isImplicatedIn* Phenotype
- *k*-partite network - nodes can be partitioned into *k* different independent sets.
- To reconcile similar entities, used *x-ref* attributes from Bio2RDF.
- Apriori algorithm prunes the search space of associations such that if a certain combination of drugs and ADRs is infrequent, any larger combination that builds upon the smaller infrequent one will also be infrequent.

## Anatomy Ontology
- Meta
    - Ontologies in Biomedicine and Life Sciences
    - Journal of Biomedical Semantics
    - Mannheim, Germany, 2010. First author based in UK 

- Sought to match terms from real-world data annotations to two major anatomical ontologies to illuminate existing obstacles to integration.
- Annotations taken from
    - ArrayExpress Archive
    - Gene Expression Atlas
    - Europhenome mouse-specific db
- Used for use cases for matching anatomical terms to
    - Foundational Model of Anatomy
    - Species-agnostic ontology, Uberon
- Zooma - ontology mapping tool.
    - Can automatically map terms from a list to ontology terms.
- OntoCat library - provides uniform interface to query heterogeneous ontology resources
- Ontology Mapper - Perl module based on Metaphone and Double Metaphone algorithms that normalizes terms in list to representation of their sounds, and matches similar terms.
- Very low number of matches, <50%. High recall though.

# Class Notes
2020/1/27

- **Endurant** - a thing
- **Perdurant** - a process

- **Class** - a **set** of individuals
- **Individual** - exists in time and space - also known as a 'particular'
- **Universal** - a universal truth about individuals
    - eg, "cat"
        - has fur
        - has four legs
- **Extensional** definition vs **Intentional**
    - Extensional - class based on commonalities among individuals
    - Intentional - class based on truths described among members

- BioPAX
    - Metabolic Pathways
    - Signaling Pathways
    - Gene Regulation

2020/1/29
**Lucy Wang and SPARQL**

