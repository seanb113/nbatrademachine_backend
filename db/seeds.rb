require 'byebug'
require 'date'
require 'json'
# require 'pry'
# require 'mechanize'
Team.destroy_all
Player.destroy_all
team_array = [
    {
      "name": "Atlanta Hawks",
      "cap_spent": "$112,342,555",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/atl.png"
    },
    {
      "name": "Boston Celtics",
      "cap_spent": "$119,147,447",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/200px-Boston_Celtics.svg_.png"
    },
    {
      "name": "Brooklyn Nets",
      "cap_spent": "$127,433,919",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Brooklyn-Nets-Shield-Logo.png"
    },
    {
      "name": "Charlotte Hornets",
      "cap_spent": "$122,632,035",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/charlotte_hornets_2014.png"
    },
    {
      "name": "Chicago Bulls",
      "cap_spent": "$113,208,742",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/chicago-bulls.png"
    },
    {
      "name": "Cleveland Cavaliers",
      "cap_spent": "$131,363,139",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/ClevelandCavaliersLogo.png"
    },
    {
      "name": "Dallas Mavericks",
      "cap_spent": "$123,293,535",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/200px-Dallas_Mavericks_logo.svg_.png"
    },
    {
      "name": "Denver Nuggets",
      "cap_spent": "$129,216,054",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/den2.png"
    },
    {
      "name": "Detroit Pistons",
      "cap_spent": "$130,976,805",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/pistons.png"
    },
    {
      "name": "Golden State Warriors",
      "cap_spent": "$131,521,342",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/warriors1.png"
    },
    {
      "name": "Houston Rockets",
      "cap_spent": "$127,603,930",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/houston-rockets.png"
    },
    {
      "name": "Indiana Pacers",
      "cap_spent": "$114,591,944",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/pcaers.png"
    },
    {
      "name": "Los Angeles Clippers",
      "cap_spent": "$131,966,937",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/new-clippers-logo.png"
    },
    {
      "name": "Los Angeles Lakers",
      "cap_spent": "$122,723,507",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/lakers.png"
    },
    {
      "name": "Memphis Grizzlies",
      "cap_spent": "$129,298,197",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/memphis.png"
    },
    {
      "name": "Miami Heat",
      "cap_spent": "$133,897,605",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/heat.png"
    },
    {
      "name": "Milwaukee Bucks",
      "cap_spent": "$130,229,664",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Milwaukee_Bucks_logo15.png"
    },
    {
      "name": "Minnesota Timberwolves",
      "cap_spent": "$133,229,189",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/MTimberwolves_Global-2017.png"
    },
    {
      "name": "New Orleans Pelicans",
      "cap_spent": "$118,391,046",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/pelicans.png"
    },
    {
      "name": "New York Knicks",
      "cap_spent": "$112,598,831",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/knicks.png"
    },
    {
      "name": "Oklahoma City Thunder",
      "cap_spent": "$133,256,687",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/oklahoma-city-thunder-logo-png-i19.png"
    },
    {
      "name": "Orlando Magic",
      "cap_spent": "$136,157,719",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/orl.png"
    },
    {
      "name": "Philadelphia 76ers",
      "cap_spent": "$130,102,816",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Philadelphia_76ers_Logo.png"
    },
    {
      "name": "Phoenix Suns",
      "cap_spent": "$120,941,022",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/suns.png"
    },
    {
      "name": "Portland Trail Blazers",
      "cap_spent": "$137,667,430",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Portland_Trail_Blazers_alternate_logo.svg_.png"
    },
    {
      "name": "Sacramento Kings",
      "cap_spent": "$118,302,952",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/KingsAvatar_1080x1090.jpg"
    },
    {
      "name": "San Antonio Spurs",
      "cap_spent": "$123,649,416",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/spurs.png"
    },
    {
      "name": "Toronto Raptors",
      "cap_spent": "$125,154,361",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Toronto_Raptors_logo_2015-16.png"
    },
    {
      "name": "Utah Jazz",
      "cap_spent": "$120,838,655",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/utahjazz.png"
    },
    {
      "name": "Washington Wizards",
      "cap_spent": "$131,290,362",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/logo.png"
    }
  ]

  
  team_array.each do |team|
    name = team[:name]
    cap_spent = team[:cap_spent]
    logo = team[:logo]
    Team.create(name: name, cap_spent: cap_spent, logo: logo)
  end

laker_players = 
[
      {
        "team": "Los Angeles Lakers",
        "name": "LeBron James",
        "salary": "$37,436,858",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2257.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Anthony Davis",
        "salary": "$27,093,019",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10809.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Danny Green",
        "salary": "$14,634,146",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6277.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Kentavious Caldwell-Pope",
        "salary": "$8,089,282",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13321.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Avery Bradley",
        "salary": "$4,767,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6901.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "JaVale McGee",
        "salary": "$4,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6159.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Quinn Cook",
        "salary": "$3,000,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18264.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Alex Caruso",
        "salary": "$2,750,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21076.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Rajon Rondo",
        "salary": "$2,564,753",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2222.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Kyle Kuzma",
        "salary": "$1,974,600",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23622.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Markieff Morris",
        "salary": "$1,750,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8064.png",
        "signed_using": "DPE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Jared Dudley",
        "salary": "$1,620,564",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2228.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Dwight Howard",
        "salary": "$1,620,564",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2640.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Talen Horton-Tucker",
        "salary": "$898,310",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31605.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Dion Waiters",
        "salary": "$375,385",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10812.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Kostas Antetokounmpo",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27026.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Devontae Cacok",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Luol Deng",
        "salary": "",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2240.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "DeMarcus Cousins",
        "salary": "",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6886.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Troy Daniels",
        "salary": "",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13383.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Demetrius Jackson",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20251.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Lakers",
        "name": "Zach Norvell Jr.",
        "salary": "",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "0",
        "trade_clause": false
      }
    ]

    # cleaned_players = JSON.parse(laker_players)

    not_players = laker_players.select do |player| 
        player[:salary] == ""
    end
    actual_players = laker_players.select do |player| 
        !not_players.include? player
    end
    byebug

    actual_players.each do |player|
        name = player[:name]
        team = Team.all[13]
        salary = player[:salary]
        position = player[:position]
        player_image = player[:player_image]
        signed_using = player[:signed_using]
        final_year_of_contract = player[:final_year_of_contract]
        trade_clause = player[:trade_clause]
        Player.create(name: name, team: team, salary: salary, position: position, player_image: player_image, signed_using: signed_using, final_year_of_contract: final_year_of_contract, trade_clause: trade_clause)
    end

    

