var Team = {
    addPlayer: function(name, id)
    {
	$('.text').hide();	

	var player_button = jqm.buttons.standard(null, 'delete', 'right', name);

	player_button.click(function(){
		$(this).parent().remove();
	});

	var input_name = "team[player_list][" + id + "]";
        var input_id = "team_player_list_" + id;

        var data_input = App.GenerateInput(input_name, input_id, "hidden");
        data_input.val(id);
	
	var wrapper = $(document.createElement('span'));
	wrapper.append(player_button);
	wrapper.append(data_input);

	
	$('#team-list').append(wrapper).trigger('create');

	
    },
    AddPlayer2:function() {
        var $players = $("ul#team_players_data_holder");
        var index = $players.find("li").length;
        var $player = $("select#players option:selected");

        if($players.find("li[data-id="+$player.val()+"]").length > 0)
            return;

        var $li = $('<li data-id="' + $player.val() + '"></li>');
        var input_name = "team[player_list][" + $player.val() + "]";
        var input_id = "team_player_list_" + $player.val();

        var $data_input = App.GenerateInput(input_name, input_id, "hidden");
        $data_input.val($player.val());
        //var $data_input = $('<input type="hidden" value="' + $player.val() + '" name="' + input_name + '" />');

        var $remove_link = $('<a href="javascript:void(0);" onclick="Team.RemovePlayer(this);">Remove</a>');

        $li.append($data_input);
        $li.append($player.text() + " &nbsp; ");
        $li.append($remove_link);

        $players.append($li);
    },

    RemovePlayer:function(o) {
        $(o).parent().remove();
    }
};

function hepp()
{
alert('ad');
}

