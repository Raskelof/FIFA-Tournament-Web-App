class GameManager
	 def EvaluateMatch(m)
	 
	 	@@_log = [] # clear previous msg
	 
	 	#1 validate 
	 	raise 'Teams are nil...dude!' if (m.home_team.nil? || m.away_team.nil?)
	 	
	 	#2 whos the winner?
	 	winner_team = nil
	 	looser_team = nil
	 	
	 	if(m.home_score == m.away_score)
	 		log("match ended as draw", "0")
	 		return true
	 	else
	 		winner_team = (m.home_score > m.away_score) ? m.home_team : m.away_team
	 		looser_team = (m.home_score < m.away_score) ? m.home_team : m.away_team
	 	end
	 	
	 	#3 calculate
	 	### 3.1 take 10% of points from the loosing teams lowest ranked player 
	 	### 3.2 take above amount from the loosing teams higest ranked player
	 	
	 	### 3.3 summarize the outcome of above and give the ponints to the winning teams players divided by 2
	 	
	 	player_lowest_rank = looser_team.players.sort_by{|t| t.score}.first
	 	log(player_lowest_rank.username + " is looser teams lowest ranked player with ", player_lowest_rank.score.to_s)
	 	
	 	points_to_transfer_per_player = (player_lowest_rank.score * 0.10).ceil
	 	log("points_to_transfer", points_to_transfer_per_player.to_s)
	 	total_points_to_transfer = 0

	 	
	 	looser_team.players.each do |looser| 
	 		log("looser team player score pre save " + looser.username, looser.score.to_s)
	 		looser.score = looser.score - points_to_transfer_per_player
	 		total_points_to_transfer += points_to_transfer_per_player
	 		log("looser team player score after save " + looser.username, looser.score.to_s)
	 	end 
	 	
	 	log("looser team total points loss ", total_points_to_transfer.to_s)
	 	points_per_winner = (total_points_to_transfer.to_f / winner_team.players.length).ceil
	 	log("points per winner ", points_per_winner.to_s)
	 	
	 	winner_team.players.each do |winner| 
	 		log("winner team player score pre save " + winner.username, winner.score.to_s)
	 		winner.score = winner.score + points_per_winner
	 		log("winner team player score after save " + winner.username, winner.score.to_s)
	 	end 
	 	
	 	bonus = 10
		(looser_team.players + winner_team.players).each do |player|
			#bonus för att man spelar?
			#log("player bonus pre save " + player.username, player.score.to_s)
	 		#player.score = player.score + bonus
	 		#log("player bonus after save " + player.username, player.score.to_s)
	 		player.save
		end
		
		return true
	 	
	 	#4 save
	 	
	 	#5 log to players and match log
	 end
	 
	@@_log = []
	def points_trace
	  @@_log
	end
	
	def log(key, value)
		@@_log.push(key + " : " + value + "<br />")
	end
end
