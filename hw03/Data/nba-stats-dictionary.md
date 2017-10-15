## Data `nba2017-roster.csv`

Here's the description of the R objects in `nba2017-roster.csv`:

- `player`: name of the player.
- `games_played`: number of games played.
- `field_goals_made`: number of field goals made
- `field_goals_atts`: total field goals attempted
- `minutes`: total minutes played
- `field_goals_perc`: field goal percentage
- `points3_made`: number of 3 pointers made
- `points3_atts`: number of 3 pointers attempted
- `points3_perc`: 3 pointer percentage
- `points2_made`: number of 2 pointers made
- `points2_atts`: number of 2 pointers attempted
- `points2_perc`: 2 pointer percentage
- `points1_made`: number of 1 pointers made
- `points1_atts`: number of 1 pointers attempted
- `points1_perc`: 1 pointer percentage
- `off_rebounds`: total offensive rebound
- `def_rebound`: total defensive rebound
- `assists`: number of assist
- `steals`: number of steals
- `blocks`: number of blocks
- `turnover`: number of turnover
- `fouls`: number of fouls

There are five types of player positions (see [wikipedia](https://en.wikipedia.org/wiki/Basketball_positions) for more details):

+ `PG`: point guard
+ `SG`: shooting guard
+ `SF`: small forward
+ `PF`: power forward
+ `C`: center

Although each object has its own data type, you can think of each of them as a variable from a statistics standpoint like so:

