// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function showTeam(id) {
  $.ajax({
   url: '/teams/'+id+'.json',
   method: 'GET',
   success: function(response){
     let team_name = $("<h2>" + "Welcome to Team: " + response.name + "</h2>");
     $("#individual_team").empty();
     $("#individual_team").append(team_name);
     $("#teams_olist").empty();
     response.players.forEach((p)=>{
       let player_info = $("<li>" + p.name + " - "+ p.nba_team + "</li>");
       $("#teams_olist").append(player_info);
     });
   }
  });
}

function submit_form(){
  console.log("Hello From the Outside"); 
}
