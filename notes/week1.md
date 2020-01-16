Ontologies -> Gruber '93 "an explicit specification of a conceptualization"
Model -> surrogate for reality

# Pizza ontology
- types of pizza
- ingredients
- customer DB - when do they order
- when do we need to stock ingredient x?
- which customers are most frequent


- Ingredient
    - Id
    - Text
    - Spicy
    - Cost

- PizzaType
    - Id
    - Text

- Pizza Ingredient Relation
    - PizzaId
    - IngredientId

- Customer
    - Id
    - NationalHealthId
    - FName
    - MName
    - LName

- Store
    - Id
    - Location

- Sale
    - Id
    - CustomerId
    - PizzaId
    - StoreId
    - OrderDateTime
    - OrderType
    - DeliveryDateTime
    - PizzaSaleId

- PizzaSaleInstance
    - SaleId
    - IngredientId
    - Added
    - Removed