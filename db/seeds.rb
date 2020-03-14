require 'byebug'
require 'date'
require 'json'
# require 'pry'
# require 'mechanize'
Team.destroy_all
Player.destroy_all
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
      }
          ]

    # cleaned_players = JSON.parse(laker_players)

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
    # trade1 = Trade.create(user: user)
    # swap1 = Swap.create(player: Player.all[45], trade: trade1, team: Team.all[8])
    # swap2 = Swap.create(player: Player.all[4], trade: trade1, team: Team.all[13])