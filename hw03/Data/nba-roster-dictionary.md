## Data `nba2017-roster.csv`

Here's the description of the R objects in `nba2017-roster.csv`:

- `player`: name of the player.
- `team`: team name abbreviation.
- `position`: player position.
- `height`: player's height 
- `weight`: player's weight
- `experience`: years of experience.
- `salary`: player's yearly salary

There are five types of player positions (see [wikipedia](https://en.wikipedia.org/wiki/Basketball_positions) for more details):

+ `PG`: point guard
+ `SG`: shooting guard
+ `SF`: small forward
+ `PF`: power forward
+ `C`: center

Although each object has its own data type, you can think of each of them as a variable from a statistics standpoint like so:

| Object       | Variable     |
|:-------------|:-------------|
| `player`     | categorical  |
| `team`       | categorical  |
| `position`   | categorical  |
| `experience` | quantitative |
| `height`     | quantitative |
| `weight`     | quantitative |
| `age`        | quantitative |
| `salary`     | quantitative |

