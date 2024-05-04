# SQL DDL Design
---
## Part 1: **Schema Design**

### **Part One: Medical Center**
+ [Schema](medical_center.sql)
```
Design the schema for a medical center.

- A medical center employs several doctors
- A doctors can see many patients
- A patient can be seen by many doctors
- During a visit, a patient may be diagnosed to have one or more diseases.
```
### **Part Two: Craigslist**
+ [Schema](craiglist.sql)
```
Design a schema for Craigslist! Your schema should keep track of the following

- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
- Users and preferred region
- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
- Categories that each post belongs to
```
### **Part Three: Soccer League**
+ [Schema](soccer_league.sql)
```
Design a schema for a simple sports league. Your schema should keep track of

- All of the teams in the league
- All of the goals scored by every player for each game
- All of the players in the league and their corresponding teams
- All of the referees who have been part of each game
- All of the matches played between teams
- All of the start and end dates for season that a league has
- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).
```
---
# Part 2: **Schema Critique**
```
We’ve provided you with a handful of SQL files that will create some databases and populate them with some data. Run each of the seed files and take a look at the data that’s generated. Next, think about how you could improve the schema. Finally, modify the original seed files based on your updated schema!
```
---

## Schema One: Outer Space
+[Original](outer_space.sql) 
- [Fixed](outer_space_fixed.sql) 

---​

## Schema Two: Air Traffic
+ [Original](air_traffic.sql) 
+ [Fixed](air_traffic_fixed.sql) 
+ 
​---

## Schema Three: Music 
+ [Original](music.sql) 
+ [Fixed](music_fixed.sql) 
