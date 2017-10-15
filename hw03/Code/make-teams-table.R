#title: Teams Table
#description: This is the data preparation stage where we create the team table 
#inputs: 'nba2017-roster.csv' & 'nba2017-stats.csv'
#outputs: 'nba2017-roster.csv' & 'nba2017-stats.csv'

setwd("~/Desktop/stat133/stat133-hws-fall17/hw03/Data")
#packages
library(readr)
library(dplyr)
library(ggplot2)

#Adding new variables
datr = read_csv('nba2017-roster.csv')
dats = read_csv('nba2017-stats.csv')

dats = mutate(dats, 
       missed_fg = dats$field_goals_atts - dats$field_goals_made, 
       missed_ft = dats$points1_atts - dats$points1_made, 
       points = dats$points1_made + 2*dats$points2_made + 3*dats$points3_made, 
       rebounds = dats$off_rebounds + dats$def_rebounds)
dats = mutate(dats,
       efficiency = (dats$points + dats$rebounds + dats$assists + dats$steals +
                    dats$blocks - dats$missed_fg - dats$missed_ft - 
                    dats$turnovers) / dats$games_played)
sink(file = '../output/efficiency-summary.txt')
summary(dats$efficiency)
sink()

#Merging tables 
dat = merge(datr, dats)

#Creating nba2017-teams.csv
teams = dat %>%
          group_by(team) %>%
          summarise(experience = sum(experience), salary = sum(salary)/1e6,
                    points3 = sum(points3_made), points2 = sum(points2_made),
                    free_throws = sum(points1_made), 
                    points = sum(points3_made + points2_made + points1_made),
                    off_rebounds = sum(off_rebounds), def_rebounds = sum(def_rebounds),
                    assists = sum(assists), steals = sum(steals), 
                    blocks = sum(blocks), turnovers = sum(turnovers),
                    fouls = sum(fouls), efficiency = sum(efficiency))
summary(teams)

sink('teams-summary.txt')
summary(teams)
sink()

sink('nba2017-teams.csv')
write.csv(teams)
sink()

#Some graphics
stars(teams[ ,-1], labels = teams$team)

pdf('../images/teams_star_plot.pdf')
stars(teams[ ,-1], labels = teams$team)
dev.off()

ggplot(data = teams, aes(x = experience, y = salary)) + 
  geom_point() + 
  geom_label(aes(label = team))

pdf('../images/experience_salary.pdf')
ggplot(data = teams, aes(x = experience, y = salary)) + 
  geom_point() + 
  geom_label(aes(label = team))
dev.off()




