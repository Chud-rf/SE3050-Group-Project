**Database Normalization Report**
	
This report shows how our database design achieves Third Normal form (3 NF) across all core tables.

**Overview of Normal Forms**

**First Normal Form (1 NF)**: “The first normal form (1 NF) states that every attribute type of a relation must be atomic and single-valued. Hence, no composite or multi-valued attribute types are tolerated.”(312)

**Second Normal Form (2 NF)**: “A relation R is in the 2 NF if it satisfies 1 NF and every non-prime attribute type A in R is fully functionally dependent on any key of R.”(316)

**Third Normal Form (3 NF)**: “A relation is in the 3 NF if it satisfies 2 NF and no non-prime attribute type of R is transitively dependent on the primary key.”(317)

**Table Breakdown**

**MARKET**  
* **PK**: market_id  
* **1NF**: All attributes store a single, atomic value.  
* **2NF**: Single attribute primary key enforces full functional dependency.  
* **3NF**: all attributes depend only on market_id.

**MARKET_DAY**  
* **PK**: (market_id, day_of_week)  
* **FK**: market_id, references MARKET  
* **Junction Table**: Breaks down the many to many relationship that occurred between MARKET and operating days. This table holds the days a market is open instead of holding these values in MARKET which would break 1 NF with a multi-valued attribute.  
* **1NF**: Takes multi-valued attribute from MARKET and turns them into individual rows, day_of_week.  
* **2NF**: This table has no non key attributes making partial dependencies impossible.  
* **3NF**: This table has no non key attributes making transitive dependencies impossible.  

**VENDOR**  
* **PK**: vendor_id  
* **FK**: market_id, references MARKET  
* **1NF**: All attributes store a single, atomic value.  
* **2NF**: Single attribute primary key makes having partial dependencies impossible.  
* **3NF**: Using market_id as a foreign key prevents duplicating MARKET attributes into the VENDOR table, which would create transitive dependencies on those attributes to market_id to vendor_id.

**PRODUCT**  
* **PK**: product_id  
* **1NF**: All attributes contain single, atomic values.  
* **2NF**: Single attribute primary key makes having partial dependencies impossible.  
* **3NF**: Moved price and quantity to VENDOR_PRODUCT. Preventing transitive dependencies since both attributes depend on the combination of VENDOR and PRODUCT.

**VENDOR_PRODUCT**  
* **PK**:(vendor_id, product_id)  
* **FK**: vendor_id, references VENDOR; product_id, references PRODUCT.  
* **Junction Table**: Breaks down the many to many relationship between VENDOR and PRODUCT.  
* **1NF**:Single, atomic attributes.  
* **2NF**: Price and stock_quantity depend fully on either attribute of the composite primary key. They both depend on what it is and who is selling it.  
* **3NF**: Price and stock_quantity depend only on the primary key attributes and not each other preventing transitive dependencies.   

**CUSTOMER**  
* **PK**: customer_id  
* **1NF**: Single, atomic attributes  
* **2NF**: Single attribute primary key prevents partial dependencies.  
* **3NF**: All non- key attributes depend only on the primary key ensuring no transitive dependencies.

**ORDER**  
* **PK**: order_id  
* **FK**: customer_id, references CUSTOMER  
* **1NF**: each attribute holds a single atomic value.  
* **2NF**: Single attribute primary key prevents partial dependencies.   
* **3NF**: Uses customer_id as foreign key to prevent transitive dependencies with customer attributes to customer_id to order_id.

**ORDER_ITEM**  
* **PK**:order_item_id  
* **FK**: order_id, references ORDER; (vendor_id,product_id), references VENDOR_PRODUCT  
* **Junction Table**:  Bridge between VENDOR_PRODUCT and ORDER, breaking down the many to many relationship.  
* **1NF**: Prevents multi-valued attributes that would be present in ORDER for product_id, vendor_id, quantity, and unit_price.  
* **2NF**: Single attribute primary key prevents partial dependencies.  
* **3NF**: Non-key attributes quantity and unit_price do not depend on one another or vice versa preventing transitive dependencies. 
