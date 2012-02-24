FIFA Tournament system
=============

FIFA Tournament system is mobile webb application built for all EA Sports FIFA fans out there. The application lets you create and manage a tournament with your friends. Report matches and follow the player ranking and other statistics.

The interface is built with jQuery mobile and is best viewed through your smartphone device.

Technical details
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

'The player ranking league is a race between individual players. Players get or loose ranking points for every match they play(single, double or more).

'The double league is a classic soccer league table. The team earns 3 points for a win and 1 point for a draw.' 

'The single league works the same way as the double league, but this league only summerizes individual players.


Player ranking calculation and the 10% rule
-------------

The rules are simple but a litle bit diffrent. The tournament is a race between individual players but you get individual ranking points on all kinds of matches(single, doubles or more).  All players starts out with 1000 ranking points and when you win a match you earn 10% of your opponents ranking points. If you team up with another player, you can only loose as much as 10% of the lowest ranked player.

Contributors
-------------

* Raskelof
* boende
* FuserV
