- [Readings](#readings)
- [Class Notes](#class-notes)

# Readings
## OWLing Clinical Data Repositories with the Ontology Web Language
- Group from Barcalona, Spain, Journal of Medical Informatics

- Objective: design and implement a framework for clinical data repositories capable of continuous change
- Result: Onto Clinical Research Forms (OntoCRF)
- Existing data warehouses usually fail to create structured variables for research use
- Little institutional support for collection of clinical data, especially for research
- General requirements
    1) The ability to efficiently acquire, store, and manage large volumes of structured data, preferably in a centralized repository.
    2) To provide a Web interface for researchers to allow them to have a distributed access to the data in order to introduce new data or to retrieve existing data. Data are usually gathered by 3)3) various researchers, often in different locations.
    4) Data security, including access control, to assure the persistence of the data.
    5) To facilitate the access to the data, including researcher “self-serve” access.
    6) To be able to easily accommodate changes in the structure of the data, minimizing service disruption when such a model change occurs.
- Ontologies resemble databases from an operational perspective (?) because they can be deployed with instance data and answer queries.
- OntoCRF: goal is to combine best of two technologies: expressivity of ontologies with robustness of relational databases.
- Why was OWL chosen?
    - Able to reuse existing ontologies.
    - Able to make automatic reasoning in the future.
- Relational DB with EAV structure is back-end, designed according to OWL spec.
- Ontology editing done with Protege.
- Created plugin for Protege and OWL-DB, uses Jena.

### Metamodel
- Application represented as an instance of *metaclass* application.
- Each form represented as instance of metaclass *DataStructure* class.
- Other classes, such as Role, Organization, Authorization manage access permissions.

### GUI
- Server is Java Spring
- Client jQuery
- GUI created dynamically from OWL metadata

### Eval / Results
- System Usability Scale
- Used by 10 different projects
- Scored "above average", accepted by 60% of users.

### Discussion
- Doesn't work with triples or RDF graphs, but rather with OWL ontologies.

## Ontology 101
- DARPA developing DAML, extending RDF with more expressive constructs.
- Why develop ontology?
    - Share common understanding of structure
    - Enable reuse of domain knowledge
    - Make domain assumptions explicit
    - Separate domain and operational knowledge
    - Analyze domain knowledge
- **Ontology is a formal explicit description of concepts in a domain of discourse, properties of each concept describing various features and attributes of the concept, and restrictions on slots**.
- Classes are the focus of most ontologies.

### Step 1: determine domain
- What is the domain to cover?
- For what will the ontology be used?
- FOr what types of questions should the ontology provide answers?
- Who will use and maintain it?
### Step 2: consider reusing existing ontologies
### Step 3: enumerate important terms
### Step 4: define the classes and class hierarchy
- Top-down
- Bottom-up
- Combination
- Ensuring hierarchy is correct
    - "is-a" relation
    - A single wine is not a subclass of all wines
    - Siblings must be same level of generality
    - Multiple inheritance (eg, Port wine is both a dessert and a red wine)
    - Think about when to introduce a new class, or represent by property values
        - Subclasses usually
            1) have additional properties not in superclass
            2) have restrictions different from superclass
            3) participate in different relationship than superclass
    - If concepts with different slot values become restrictions for slots in other classes, we should create a new class. Otherwise represent in a slot value.
### Step 5: define properties of classes - slots
- Intrinsic (eg, flavor)
- Extrinsic (eg, area produced at)
- Parts, if structured (eg, courses of a meal)
- Relationships to other individuals (eg, maker, grape)
- Inverse slots
    - "produced-by" vs "produces"
### Step 6: define facets of slots
- Cardinality
- Value type (string, num, bool, enum, instance-type, etc)
- Domain and range (allowed classes)
### Step 7: create instances

## Creating the Gene Ontology Resource: Design and Implementation
- Seeks to provide a set of structured vocabularies for specific biological domains that can be used to describe gene products in any organism.
- Three extensive ontologies to describe:
    1) molecular function
    2) biological process
    3) cellular component
- Also provides a community database
- Researchers want to be able to:
    1) ex., know which gene or gene products contribute to the formation and development of an epithelial sheet
    2) expand queries to find gene products in different organisms that share characteristics.
- Development of GO vocabularies is independent of the association of particular gene products with GO terms
- GO ontology is not capturing or trying to represent any of the dynamics or dependencies tha would be requried to describe a pathway.
- Ontology structure: directed acyclic graphs (DAGs)
- "True Path Rule": the pathway from a child term to its top-level parent must always be true.
- "type" versus "part-of" cytoskeleton
- Difficulty in determining how detailed the ontology should be

## The Ontology of the Gene Ontology
- "OBO": Open Biological Ontologies
- GO, in spite of its name, is not an ontology as commonly defined. It is rather a "controlled vocabulary".
- GO's efforts have been directed toward providing a practically useful framework for keeping track of biological annotations.
- Preference given to the speedy population of GO with biological concepts over ontological coherance, stability, and scalability.
- Only certain kinds of organisms have cellular components known as *glycosome*, but expert knowledge is needed to understand that s GO is currently defined, and computers don't have access to such knowledge.
- As the GO expands, the addition of each new term will require the curator to understand the entire structure of GO to avoid redundancy and ensure proper linkages.
- **Universals vs particulars** - distinguish between kind and individual.
- **Continuants vs Occurrents** - continuants continue to exist, occurrents unfold in successive phases, eg viral infection.
- **Dependent vs Independent** - some entities can exist without support from others; others require such support to exist.
- *isa* supposed to mean "instance of", but used as a "kind of". There are also cases where *isa* used to indicate non-necessary subsumption. *transport isa cell growth and/or maintenance* is to be read as indicating *every* transport process is a cell growth or maintenance process, which is not true of certain transports.
- Benefits of GO approach
    - Work could start immediately
    - no complex protocols
    - few formal constraints
    - unique ids allows db annotation without consideration of place in hierarchy
- Drawbacks of GO approach
    - unclear what kinds of reasoning are permissible
    - rationale of subclassifations is unclear, and reasoning that went into current choices has not been preserved
    - no procedures offered by GO that can be validated
    - insufficient rules for determining how to recognize whether a given concept is or is not present in GO

## GO Resource: 20 years on and GOing strong
- 45,000 terms, 134,000 relations, 7 million annotations
- Each annotation includes evidence it is based on using evidence codes from the Evidence and Conclusion Ontology (ECO)
- GO-CAM (Causal Activity Modeling): new framework superceding old but compatible. Each model represented in triples represented using OWL.
- New monthly releases with respective DOIs.
- Recently requested review of 2500 annotations; 70-80% were modified or removed.
- Editing using OWL and Protege.

## KaBOB
- 7 key problems
    1) varying identifiers used across sources refer to the same thing
    2) differing file formats using different lexical representations
    3) conflation of informational entities with biomedical concepts
    4) use of varying non-ontologically grounded semantic models
    5) errors and inconsistency among sources
    6) instability of identifiers and URIs over time
    7) difficulty in tracing and reporting provenance
- 5 steps
    1) source records explictly represented in common info model
    2) references to identifiers are canonicalized
    3) Identifiers mappings across sources used to derive IDs referring to the same thing
    4) identifier sets and corresponding entity are explictly represented
    5) forward-chaining rules used to produce representations grounded in common biomedical models in form of prominent OBOs.
- Ability to query many independent biological databases using a common, community-driven semantic model would facilitate deeper integration and more effective utilization of resoures.
- Researchers' decisions about which db to use should be based on task and criteria, but are often instead based on underlying db representations and schema.
- Souce DB records, schem, and identifiers modeled as instances of information content entities
- ICD = Information Content Entity
- Constructing KaBOB: *"KaBOB, initially an empty triplestore, is built up incrementally. First, ontologies are downloaded and then loaded dir- ectly into the triplestore. Database source files are down- loaded and converted to RDF; the resultant RDF triples are loaded into the ICE section of KaBOB. Forward- chaining rules (OWL- > ICE) generate ICE identifiers for each of the biomedical concepts in the ontologies. (These additional identifiers are required since in our representation records will only contain URIs for identi- fiers not URIs for biomedical concepts themselves, making the ICE-BIO distinction unambiguous). The second set of forward-chaining rules generates identity links between ICE identifiers, specifically, assertions of skos:exactMatch links between identifiers denoting the same biomedical concepts. The next step instanti- ates an ID set in the ICE side of KaBOB corresponding to each unique biomedical concept. Each biomedical concept is then explicitly represented in the BIO section; for example, a gene entity on the BIO side is created for each such set of gene IDs. (This is the first real connection from the ICE section to the BIO section). More forward- chaining rules are then used to create (on the BIO side) other biomedical concepts and assertions referred to within the data source records, e.g., interaction events with protein participants from protein-protein interaction data- base records, processes with participating entities from Gene Ontology annotations, and links from drugs to genes or gene products from drug-related data sources."*
- *union-find* algorithm is an efficient method for building a collection of disjoint sets given a list of pairs of members that are in the same set. Used in KaBOB to incrementally build and merge sets of connected components
- Example use case:
    *"With only PharmGKB integrated as a source of drugs and drug targets, the query above returns the two drugs adefovir dipivoxil and tenofovir. By extending the SELECT statement to include the variable ?gorgporv (the vari- able representing gene-or-gene-product aggregate classes) the query is modified to return gene-drug interacting pairs, instead of just the drugs. Executing this query shows that both drugs interact with the AK2 gene or its products.
    After writing three rules to also integrate DrugBank into KaBOB using the same common biological repre- sentation, the query can be run without changes and the results are extended to 8 genes that collectively interact with 26 different drugs. These eight genes include two from the PFC gene list in Choi et al. (UQCRB, UQCRC1), two more that are mentioned in another gene list in Choi et al. (AK2, UQCRC2) and four that appear in neither gene list (ATP5C1, ATP5D, COX1, UQCRH)."*

# Class Notes
2019/1/15



