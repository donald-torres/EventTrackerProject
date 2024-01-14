# EventTrackerProject  -  Binge Worthy


### Overview

A television show tracker for binge watchers to keep track of long running shows and the platforms streaming them for fellow "bingers" to easily find and start watching. 


1/14/2024 - added FrontEnd to program using JS/AJAX with full CRUD on Programs
using the clickable list of available programs. 

### Technologies / Techniques Used

- MySQL
- Java
- JPA/Hybernate
- Spring REST
- SpringToolSuite/SpringBoot
- Postman



### REST Endpoints

| HTTP Verb | URI             | Request Body | Response Body | Status Codes |
|-----------|-----------------|--------------|---------------|--------------|
| GET       | `/api/programs` |              | List of all _program_ entities | 200 |
| GET       | `/api/programs/1` |              | JSON of _program_ `1` | 200,404 |
| GET       | `/api/category/1/programs` |              | List of all _program_ entities in _category_ `1` | 200,404 |
| GET       | `/api/platform/1/programs` |              | List of all _program_ entities in _platform_ `1` | 200,404 |
| POST      | `/api/programs` | JSON of a new _program_ entity  | JSON of created _program_ | 201,400 |
| PUT       | `/api/programs/7` | JSON of a new version of _program_ `7` | JSON of updated _program_ | 200,404,400 |
| DELETE    | `/api/programs/7` |              |               | 204,404 |
| GET       | `/api/categories` |              | List of all _category_ entities | 200 |
| GET       | `/api/categories/1` |              | JSON of _category_`1` | 200,404 |
| POST      | `/api/categories` | JSON of a new _cateogry_ entity | JSON of created _category_ entity | 201,400 |
| PUT       | `/api/categories/23` | JSON of a new version of _category_ entity | JSON of updated _category_ entity | 200,400,404 |
| DELETE    | `/api/categories/23` |             |               | 204,404 |
| GET       | `/api/platforms` |              | List of all platform entities | 200 |
| GET       | `/api/platforms/1` |              | JSON of platform`1` | 200,404 |
| POST      | `/api/platforms` | JSON of a new platform entity | JSON of created platforms entity | 201,400 |
| PUT       | `/api/platforms/11` | JSON of a new version of platform entity | JSON of updated platform entity | 200,400,404 |


### Lessons Learned

   Pros -
 - Deeper understanding of the REST programming language.

   Cons -
 - I had a bit of trouble with the many to many relationship between the program and platform entities specifically pulling the mapping.  It allowed me to to get a deeper undersanding of the language for REST repository classes.  