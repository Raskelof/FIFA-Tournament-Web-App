class MatchesController < ApplicationController

  before_filter :get_all_teams

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(params[:match])

    all_players = @match.home_team.players + @match.away_team.players
    
    if(@match.home_team.id == @match.away_team.id)
    	raise 'Samma lag!'
    end
    
    all_players.each do |player|
    	if all_players.select{|p| p.id == player.id}.length > 1
    		raise 'Samma spelare i bada lagen'
    	end
    end 

    respond_to do |format|
      if @match.save
        MatchLog.create({:match_id => @match.id, :msg => "<strong class='log_home_team'>#{@match.home_team.display_name}</strong> just played against <strong class='log_away_team'>#{@match.away_team.display_name}</strong> and it ended #{@match.home_score} - #{@match.away_score}"})

	write_to_player_log (all_players)

        gm = GameManager.new
        gm.EvaluateMatch(@match)
        @match.points_trace = gm.points_trace
        @match.save
        
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :ok }
    end
  end

  protected

  def get_all_teams
    @teams = Team.all
  end

  def write_to_player_log (match_players)
    players = Player.all.to_a
    standings = players.sort_by{|p| p.score}.reverse

    match_players.each do |player|
	PlayerLog.create({:player_id => player.id, :msg => "", :score => player.score, :standing => (standings.index(player) + 1)})
    end
  end

end
