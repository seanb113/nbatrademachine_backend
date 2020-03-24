require 'byebug'
require 'date'
require 'json'
# require 'pry'
require 'mechanize'
require 'json'
Team.destroy_all
Player.destroy_all
Trade.destroy_all
# Swap.destroy_all
# User.destroy_all
# User.destroy_all
# Trade.destroy_all
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
      },
          {
            "team": "Sacramento Kings",
            "name": "Harrison Barnes",
            "salary": "$24,147,727",
            "position": "Small Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10815.png",
            "signed_using": "Bird",
            "final_year_of_contract": "2023",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Kent Bazemore",
            "salary": "$19,269,662",
            "position": "Shooting Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11079.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Cory Joseph",
            "salary": "$12,000,000",
            "position": "Point Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8080.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2022",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Marvin Bagley III",
            "salary": "$8,556,120",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26968.png",
            "signed_using": "Rookie",
            "final_year_of_contract": "2022",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Bogdan Bogdanovic",
            "salary": "$8,529,386",
            "position": "Shooting Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15379.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Nemanja Bjelica",
            "salary": "$6,825,000",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6917.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2021",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Jabari Parker",
            "salary": "$6,500,000",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15354.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2021",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "De'Aaron Fox",
            "salary": "$6,392,760",
            "position": "Point Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23600.png",
            "signed_using": "Rookie",
            "final_year_of_contract": "2021",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Buddy Hield",
            "salary": "$4,861,208",
            "position": "Shooting Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20211.png",
            "signed_using": "Rookie",
            "final_year_of_contract": "0202",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Richaun Holmes",
            "salary": "$4,767,000",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17865.png",
            "signed_using": "Room",
            "final_year_of_contract": "2021",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Alex Len",
            "salary": "$4,160,000",
            "position": "Center",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13318.png",
            "signed_using": "Room",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Yogi Ferrell",
            "salary": "$3,150,000",
            "position": "Point Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20283.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Harry Giles",
            "salary": "$2,578,800",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23615.png",
            "signed_using": "Rookie",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Anthony Tolliver",
            "salary": "",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6483.png",
            "signed_using": "",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Justin James",
            "salary": "$898,310",
            "position": "Shooting Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31599.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2022",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Kyle Guy",
            "salary": "-",
            "position": "Shooting Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
            "signed_using": "",
            "final_year_of_contract": "2021",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "DaQuan Jeffries",
            "salary": "-",
            "position": "Small Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
            "signed_using": "",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Eric Mika",
            "salary": "",
            "position": "Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
            "signed_using": "",
            "final_year_of_contract": "0",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Matt Barnes",
            "salary": "",
            "position": "Small Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2313.png",
            "signed_using": "Minimum",
            "final_year_of_contract": "2017",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Tyler Lydon",
            "salary": "",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23619.png",
            "signed_using": "Minimum",
            "final_year_of_contract": "2021",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Hollis Thompson",
            "salary": "",
            "position": "Shooting Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10996.png",
            "signed_using": "",
            "final_year_of_contract": "",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Tyler Ulis",
            "salary": "",
            "position": "Point Guard",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20240.png",
            "signed_using": "",
            "final_year_of_contract": "",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Caleb Swanigan",
            "salary": "$2,033,160",
            "position": "Power Forward",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23621.png",
            "signed_using": "Rookie",
            "final_year_of_contract": "2020",
            "trade_clause": false
          },
          {
            "team": "Sacramento Kings",
            "name": "Dewayne Dedmon",
            "salary": "$13,333,334",
            "position": "Center",
            "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13536.png",
            "signed_using": "Cap Space",
            "final_year_of_contract": "2022",
            "trade_clause": false
          },
            {
              "team": "Detroit Pistons",
              "name": "Blake Griffin",
              "salary": "$34,449,964",
              "position": "Power Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6501.png",
              "signed_using": "Bird",
              "final_year_of_contract": "2022",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Brandon Knight",
              "salary": "$15,643,750",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8058.png",
              "signed_using": "Bird",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Tony Snell",
              "salary": "$11,392,857",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13333.png",
              "signed_using": "Bird",
              "final_year_of_contract": "2021",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "John Henson",
              "salary": "$9,732,396",
              "position": "Power Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10822.png",
              "signed_using": "Bird",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Langston Galloway",
              "salary": "$7,333,333",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15824.png",
              "signed_using": "MLE",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Derrick Rose",
              "salary": "$7,317,073",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6095.png",
              "signed_using": "MLE",
              "final_year_of_contract": "2021",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Luke Kennard",
              "salary": "$3,827,160",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23607.png",
              "signed_using": "Rookie",
              "final_year_of_contract": "2021",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Thon Maker",
              "salary": "$3,569,643",
              "position": "Center",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20215.png",
              "signed_using": "Rookie",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Sekou Doumbouya",
              "salary": "$3,285,120",
              "position": "Small Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31572.png",
              "signed_using": "Rookie",
              "final_year_of_contract": "2023",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Jordan McRae",
              "salary": "$1,645,357",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15410.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Christian Wood",
              "salary": "$1,645,357",
              "position": "Power Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18218.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Bruce Brown",
              "salary": "$1,416,852",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27008.png",
              "signed_using": "MLE",
              "final_year_of_contract": "2021",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Sviatoslav Mykhailiuk",
              "salary": "$1,416,852",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27013.png",
              "signed_using": "Cap Space",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Khyri Thomas",
              "salary": "$1,416,852",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27004.png",
              "signed_using": "MLE",
              "final_year_of_contract": "2021",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Donta Hall",
              "salary": "$50,752",
              "position": "Power Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "0202",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Jordan Bone",
              "salary": "-",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
              "signed_using": "",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Louis King",
              "salary": "-",
              "position": "Small Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
              "signed_using": "",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Derrick Walton Jr.",
              "salary": "",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24263.png",
              "signed_using": "",
              "final_year_of_contract": "0",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Reggie Jackson",
              "salary": "$512,721",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8075.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Josh Smith",
              "salary": "",
              "position": "Small Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2205.png",
              "signed_using": "",
              "final_year_of_contract": "",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Markieff Morris",
              "salary": "$1,750,000",
              "position": "Power Forward",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8064.png",
              "signed_using": "DPE",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Tim Frazier",
              "salary": "",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15755.png",
              "signed_using": "",
              "final_year_of_contract": "",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Joe Johnson",
              "salary": "",
              "position": "Shooting Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2200.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "2020",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Jose Calderon",
              "salary": "",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2734.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "2019",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Jameer Nelson",
              "salary": "",
              "position": "Point Guard",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2642.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "2018",
              "trade_clause": false
            },
            {
              "team": "Detroit Pistons",
              "name": "Zaza Pachulia",
              "salary": "",
              "position": "Center",
              "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2203.png",
              "signed_using": "Minimum",
              "final_year_of_contract": "2019",
              "trade_clause": false
            },
            {
        "team": "Washington Wizards",
        "name": "John Wall",
        "salary": "$38,199,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6882.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Bradley Beal",
        "salary": "$27,093,019",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10811.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Ian Mahinmi",
        "salary": "$15,450,051",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2708.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Thomas Bryant",
        "salary": "$8,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23643.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Davis Bertans",
        "salary": "$7,000,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8094.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Ishmael Smith",
        "salary": "$6,000,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/7116.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Rui Hachimura",
        "salary": "$4,469,160",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31566.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Jerome Robinson",
        "salary": "$3,567,720",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26979.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Troy Brown Jr.",
        "salary": "$3,219,480",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26981.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Moritz Wagner",
        "salary": "$2,063,520",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26991.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Shabazz Napier",
        "salary": "$1,845,301",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15376.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Isaac Bonga",
        "salary": "$1,416,852",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27005.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Gary Payton II",
        "salary": "$1,052,909",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20272.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Admiral Schofield",
        "salary": "$1,000,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31601.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Anzejs Pasecniks",
        "salary": "$482,144",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23620.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Garrison Mathews",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "C.J. Miles",
        "salary": "$8,730,159",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2753.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Jonathon Simmons",
        "salary": "",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17983.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Justin Robinson",
        "salary": "$898,310",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32396.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Jermerrio Jones",
        "salary": "",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Johnathan Williams",
        "salary": "$914,791",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27739.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Ty Lawson",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6283.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2018",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Ramon Sessions",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2566.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2018",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Isaiah Thomas",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8111.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Maurice Harkless",
        "salary": "$11,011,236",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10823.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Marcus Morris",
        "salary": "$15,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8065.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Issuf Sanon",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27010.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Washington Wizards",
        "name": "Jordan McRae",
        "salary": "$1,645,357",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15410.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Paul Millsap",
        "salary": "$30,350,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2754.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Nikola Jokic",
        "salary": "$27,504,630",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15393.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Gary Harris",
        "salary": "$17,839,286",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15371.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Mason Plumlee",
        "salary": "$14,041,096",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13335.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Will Barton",
        "salary": "$12,776,786",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10865.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Jerami Grant",
        "salary": "$9,346,153",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15391.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Jamal Murray",
        "salary": "$4,444,746",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20212.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "0202",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Michael Porter Jr.",
        "salary": "$3,389,400",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26980.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Torrey Craig",
        "salary": "$2,000,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24230.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Noah Vonleh",
        "salary": "$2,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15361.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Monte Morris",
        "salary": "$1,588,231",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23652.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Keita Bates-Diop",
        "salary": "$1,416,852",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27014.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Vlatko Cancar",
        "salary": "$898,310",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23650.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Bol Bol",
        "salary": "-",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "P.J. Dozier",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23668.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Gerald Green",
        "salary": "",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6100.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Jarred Vanderbilt",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27007.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Luke Kennard",
        "salary": "$3,827,160",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23607.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Jordan McRae",
        "salary": "$1,645,357",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15410.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Shabazz Napier",
        "salary": "$1,845,301",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15376.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Evan Turner",
        "salary": "$18,606,557",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6883.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Juan Hernangomez",
        "salary": "$3,321,030",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20220.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Malik Beasley",
        "salary": "$2,731,714",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20224.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Clint Capela",
        "salary": "$14,896,552",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15377.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Nene Hilario",
        "salary": "$10,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6103.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Robert Covington",
        "salary": "$11,301,219",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13379.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Denver Nuggets",
        "name": "Jordan Bell",
        "salary": "",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23633.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Paul George",
        "salary": "$33,005,556",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6892.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Kawhi Leonard",
        "salary": "$32,742,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8066.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Marcus Morris",
        "salary": "$15,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8065.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Patrick Beverley",
        "salary": "$12,345,680",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6297.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Louis Williams",
        "salary": "$8,000,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2657.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Ivica Zubac",
        "salary": "$6,481,482",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20238.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Montrezl Harrell",
        "salary": "$6,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17860.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Rodney McGruder",
        "salary": "$4,807,693",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13575.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "JaMychal Green",
        "salary": "$4,767,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11666.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Landry Shamet",
        "salary": "$1,995,120",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26992.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Mfiondu Kabengele",
        "salary": "$1,977,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31586.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Patrick Patterson",
        "salary": "$1,620,564",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6896.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Terance Mann",
        "salary": "$1,000,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31607.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Reggie Jackson",
        "salary": "$512,721",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8075.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Joakim Noah",
        "salary": "$91,557",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2248.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "0",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Amir Coffey",
        "salary": "-",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Johnathan Motley",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24020.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Isaiah Thomas",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8111.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Maurice Harkless",
        "salary": "$11,011,236",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10823.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Jerome Robinson",
        "salary": "$3,567,720",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26979.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Los Angeles Clippers",
        "name": "Issuf Sanon",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27010.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Kemba Walker",
        "salary": "$32,742,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8059.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2024",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Gordon Hayward",
        "salary": "$32,700,690",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6891.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Marcus Smart",
        "salary": "$12,553,471",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15358.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Jayson Tatum",
        "salary": "$7,830,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23598.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Jaylen Brown",
        "salary": "$6,534,829",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20208.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "0202",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Daniel Theis",
        "salary": "$5,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23828.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Enes Kanter",
        "salary": "$4,767,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8053.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Romeo Langford",
        "salary": "$3,458,400",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31571.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Vincent Poirier",
        "salary": "$2,505,793",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31917.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Grant Williams",
        "salary": "$2,379,840",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31579.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Robert Williams",
        "salary": "$1,937,520",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26993.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Semi Ojeleye",
        "salary": "$1,618,520",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23632.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Brad Wanamaker",
        "salary": "$1,445,697",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27289.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": true
      },
      {
        "team": "Boston Celtics",
        "name": "Carsen Edwards",
        "salary": "$1,228,026",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31592.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Javonte Green",
        "salary": "$898,310",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32409.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Tacko Fall",
        "salary": "-",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Tremont Waters",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Guerschon Yabusele",
        "salary": "",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20221.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Max Strus",
        "salary": "",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Demetrius Jackson",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20251.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Yante Maten",
        "salary": "",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27815.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Boston Celtics",
        "name": "Justin Bibbs",
        "salary": "",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28028.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Chris Paul",
        "salary": "$38,506,482",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2609.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Steven Adams",
        "salary": "$25,842,697",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13325.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Danilo Gallinari",
        "salary": "$22,615,559",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6138.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Dennis Schröder",
        "salary": "$15,500,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13330.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Andre Roberson",
        "salary": "$10,740,740",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13339.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Shai Gilgeous-Alexander",
        "salary": "$3,952,920",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26977.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Terrance Ferguson",
        "salary": "$2,475,840",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23616.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Darius Bazley",
        "salary": "$2,284,800",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31581.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Mike Muscala",
        "salary": "$2,028,594",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13357.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Nerlens Noel",
        "salary": "$1,620,564",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13319.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": true
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Abdel Nader",
        "salary": "$1,618,520",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20264.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Isaiah Roby",
        "salary": "$1,500,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31604.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Deonte Burton",
        "salary": "$1,416,852",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28767.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Hamidou Diallo",
        "salary": "$1,416,852",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27011.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Luguentz Dort",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/33033.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Kevin Hervey",
        "salary": "-",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27023.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Kyle Singler",
        "salary": "",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8085.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Patrick Patterson",
        "salary": "$1,620,564",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6896.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Norris Cole",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8079.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2017",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Nick Collison",
        "salary": "",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2715.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2018",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Raymond Felton",
        "salary": "",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2229.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2019",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Justin Patton",
        "salary": "",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23611.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Oklahoma City Thunder",
        "name": "Devon Hall",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27019.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },

      {
        "team": "Miami Heat",
        "name": "Jimmy Butler",
        "salary": "$32,742,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8081.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Goran Dragic",
        "salary": "$19,217,900",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6146.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Andre Iguodala",
        "salary": "$17,185,185",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2652.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Solomon Hill",
        "salary": "$12,758,781",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13336.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Kelly Olynyk",
        "salary": "$12,667,886",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13326.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Meyers Leonard",
        "salary": "$11,286,517",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10819.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Jae Crowder",
        "salary": "$7,815,533",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10859.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Tyler Herro",
        "salary": "$3,640,200",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31570.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Edrice Adebayo",
        "salary": "$3,454,080",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23609.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Derrick Jones Jr.",
        "salary": "$1,645,357",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21067.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Udonis Haslem",
        "salary": "$1,620,564",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2549.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": true
      },
      {
        "team": "Miami Heat",
        "name": "Kendrick Nunn",
        "salary": "$1,416,852",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28041.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Duncan Robinson",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27658.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "KZ Okpala",
        "salary": "$898,310",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31591.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Chris Silva",
        "salary": "$466,918",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32319.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Kyle Alexander",
        "salary": "-",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Gabe Vincent",
        "salary": "-",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28087.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Ryan Anderson",
        "salary": "",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6133.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "A.J. Hammons",
        "salary": "",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20252.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Yante Maten",
        "salary": "",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27815.png",
        "signed_using": "",
        "final_year_of_contract": "",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Luke Babbitt",
        "salary": "",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6898.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2018",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Jordan Mickey",
        "salary": "",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17861.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2019",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Dwyane Wade",
        "salary": "",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2556.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2019",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Kendrick Nunn",
        "salary": "$1,416,852",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28041.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Duncan Robinson",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27658.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Tyler Herro",
        "salary": "$3,640,200",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31570.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Duncan Robinson",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27658.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Edrice Adebayo",
        "salary": "$3,454,080",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23609.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Tyler Herro",
        "salary": "$3,640,200",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31570.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "Chris Silva",
        "salary": "$466,918",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32319.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Miami Heat",
        "name": "KZ Okpala",
        "salary": "$898,310",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31591.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      }
 
    ]

  # begin
  # agent = Mechanize.new
  # all_response_code = ['403', '404', '502']
  # page = agent.get("https://www.spotrac.com/search/results/washington-wiz/")
  # team_pages = page.links_with(:dom_class => "team-name")
  # teams = team_pages.map do |link|
  #     puts "Team done"
  #     team_name = link.text
  #     team_page = link.click
  #     # total_cap = team_page.search(".datatable.captotal.xs-visible .tbody").text
  #     # puts total_cap
  # #   team_name = team_pages.map do |link|
  # #      team_name = link.text
  # #     end
  #     team_logo = team_pages.map do |link|
  #         team_logo = link.click.search('.team-logo img').attr('src')
  #     end
  # team_details = team_pages.each_with_index.map do |t, index|
  #     {name: team_name, cap_spent: " ", logo: team_logo[index]}
  # end
  
  # other_players = team_page.links_with(:dom_class => ".tag.player-tag")
  # all_players = team_page.links_with(:href => %r{/redirect/player/})
  # players = all_players.reject{|link| other_players.include? link}
  # player_names = players.map do |link| 
  #     player = link.text.strip
  # end
  
  # salaries = players.map do |link| 
  #     salary = link.click.search(".center.salaryAmt.result.current-year").text.gsub(/\s+/, "")
  # end
  # final_year_of_current = players.map do |link|
  #     final_year = link.click.search('.salaryTable.salaryInfo.hidden-xs .notop .contract-item[5] .playerValue').text
  #     final_year_of_current = final_year.gsub(/[^\d]/, '')
  #     final_year_of_current.slice(0, 4)
  # end

  # position = players.map do |link|
  #     position = link.click.search(".player .player-details .player-info .player-item.position").text
  # end
  # player_pic = players.map do |link|
  #     player_pic = link.click.search('.player .player-logo img').attr('src')
  # end
  # signed_current_using = players.map do |link|
  #     puts "signed"
  #     signed_using = link.click.search('.salaryTable.salaryInfo.hidden-xs .notop .contract-item[4] .playerValue').first
  #     if signed_using == nil
  #     else
  #     signed_using.text
  #     end
  # end

  # trade_clause = players.map do |link|
  #     trade_clause = link.click.search('.center.small.current-year .info i')
  #     puts trade_clause
  #     if trade_clause.to_s == '<i class="fa fa-unlock"></i>'
  #         true
  #     else
  #         false
  #     end
  # end

  # players_details = player_names.each_with_index.map do |w, index|
  #     {team: team_name, name: player_names[index], salary: salaries[index], position: position[index], player_image: player_pic[index], signed_using: signed_current_using[index], final_year_of_contract: final_year_of_current[index], trade_clause: trade_clause[index]}
  # end
      
      
  
  #     {   team: team_details ,
  #     players: players_details.inject({}) do |r, h| 
  #         (r[h[:name]] ||= {}).merge!(h){ |key, old, new| old || new }
  #         r
  #       end.values
  #         }
  #     rescue Mechanize::ResponseCodeError => e
  #     if all_response_code.include? e.response_code 
  #     e.skip
  #     else
  #     retry
  #     end
  #     end
  # end

  #   lakers_players = JSON.pretty_generate(teams)
  #   puts JSON.pretty_generate(teams)

  #   teams1 = teams[0]

    not_players = laker_players.select do |player| 
        player[:salary] == ""
    end
    actual_players = laker_players.select do |player| 
        !not_players.include? player
    end
    # byebug

    actual_players.each do |player|
        name = player[:name]
        # byebug
        team_id = Team.all.select{|team| team.name == player[:team]}[0]
        salary = player[:salary]
        position = player[:position]
        player_image = player[:player_image]
        signed_using = player[:signed_using]
        final_year_of_contract = player[:final_year_of_contract]
        trade_clause = player[:trade_clause]
        Player.create(name: name, team: team_id, salary: salary, position: position, player_image: player_image, signed_using: signed_using, final_year_of_contract: final_year_of_contract, trade_clause: trade_clause)
    end

    user = User.create(name: "sean", team: "Detroit Pistons", password: "123")
    user1 = User.create(name: "test", team: "Boston Celtics", password: "123")
    # trade1 = Trade.create(user: user)
    # swap1 = Swap.create(player: Player.all[45], trade: trade1, team: Team.all[8])
    # swap2 = Swap.create(player: Player.all[4], trade: trade1, team: Team.all[13])
