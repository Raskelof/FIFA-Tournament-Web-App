class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  
  helper_method :get_match_color
  
  def index
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end
  
  def load_show_actions
  	@player = Player.find(params[:id])
    @player_matches = []
    
		 @player.teams.each do |team|
			team.matches.each do |match|
				@player_matches.push(match)
			end
		 end

   	@player_matches.sort_by!{|m| m.created_at}.reverse!
		get_player_statistics
  end

  # GET /players/1
  # GET /players/1.json
  def show
  	load_show_actions
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end
  
  def ranking_over_time
  	load_show_actions
  	
  	all_rankings = @player.player_logs.sort_by{|l| l.created_at}
		@historic_ranking_by_day = []
			
			previous_day = nil
			all_rankings.each_with_index do |r,index|
			
				if(!previous_day.nil? && r.created_at.day != previous_day.created_at.day)
					@historic_ranking_by_day.push(previous_day)
				end
				
				if(index == (all_rankings.length-1))
					@historic_ranking_by_day.push(r)
				end
			
				previous_day = r
			end
  	
   	 respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end
  
  def pie_chart
  	load_show_actions
  
   	 respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end
  
  def matches
  	load_show_actions
  	
   	 respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end
  
  
def get_player_statistics
	
		@players_games_won = 0
		@players_games_lost = 0
	  @players_games_draw = 0

		@player.teams.each do |team|
			team.matches.each do |m|
				winner_team = nil
				if(m.home_score > m.away_score)
					winner_team = m.home_team
				elsif(m.home_score < m.away_score)
					winner_team = m.away_team
				else
					@players_games_draw += 1
				end
	
				if(!winner_team.nil? && winner_team.players.include?(@player))
					@players_games_won += 1
				else
					@players_games_lost += 1
				end
			end
		end

end
  
def get_match_color(m)
		winner_team = nil

		if(m.home_score > m.away_score)
			winner_team = m.home_team
		elsif(m.home_score < m.away_score)
			winner_team = m.away_team
		else
			return 'gray'
		end

		if(winner_team.players.include?(@player))
			return 'green'
		else
			return 'red'
		end
end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])
    @player.score = 1000
    respond_to do |format|
      if @player.save
      	t = Team.create
      	t.players = [@player]
      	t.save
      	
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :ok }
    end
  end
end
