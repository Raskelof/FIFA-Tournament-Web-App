FIFA Tournament system
=============

FIFA Tournament system is mobile webb application built for all EA Sports FIFA fans out there. The application lets you create and manage a tournament with your friends. Report matches and follow the player ranking and other statistics.

The interface is built with jQuery mobile and is best viewed through your smartphone device.

Technical detalis
-------------

* Interface: jQuery mobile
* Backend: ruby 1.9.2 and rails 3.1.1

Getting started
-------------

	git clone git@github.com:Raskelof/FIFA-Tournament-system.git
	
You will alsoe need to add and configure the database.yml file. The example file, found in config/database.yml.example will help you get started.

Statistics
-------------

You could say there are three leagues in the app, a player ranking league, a double(or more) team league and a single league.

The player ranking league is a race between individual players. Players get or loose ranking points for every match they play(single, double or more).

The double league is a classic soccer league table. The team earns 3 points for a win and 1 point for a draw.

The single league works the same way as the double league, but this league only summerizes individual players.


Player ranking calculation and the 10% rule
-------------

Players/teams who wins over other players/teams earns 10% of the loosing players points. 

Example: Player A has 1100 points and wins over player B who has 1000. Player A gets 100 points from Player B.

When you play in a team with another player, you only risk the same amount as 10% of the teams lowest ranked player.

Example:

Team A plays a match against Team B.

Ranking points pre-match.

Team A
Player A1 points 1200
Player A2 point 1000

Team B
Player B1 points 800
Player B2 point 1300

Team B wins the match and Players A2 is looser teams lowest ranked player. 10% of Players A2's 1000 points is 100 and the same amount will be transfered from Player A1.
Team B wins a total of 200 points which will distributed over the players in Team B.

Ranking points after the match.

Team A
Player A1 points 1100
Player A2 point 900

Team B
Player B1 points 900
Player B2 point 1400


All players starts with a ranking of 1000 points.


Contributors
-------------

* Raskelof
* boende
* FuserV
