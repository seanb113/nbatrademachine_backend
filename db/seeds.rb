require 'byebug'
require 'date'
require 'json'
# require 'pry'
require 'mechanize'
require 'json'
Team.destroy_all
Player.destroy_all
Trade.destroy_all
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
            "final_year_of_contract": "2021",
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
              "final_year_of_contract": "2021",
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
        "final_year_of_contract": "2020",
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
        "final_year_of_contract": "2020",
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
        "final_year_of_contract": "2021",
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
        "team": "New Orleans Pelicans",
        "name": "Jrue Holiday",
        "salary": "$26,996,111",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6316.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Derrick Favors",
        "salary": "$17,650,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6884.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "J.J. Redick",
        "salary": "$13,486,300",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2643.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Zion Williamson",
        "salary": "$9,757,440",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31558.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Lonzo Ball",
        "salary": "$8,719,320",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23597.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "E'Twaun Moore",
        "salary": "$8,664,928",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8107.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Brandon Ingram",
        "salary": "$7,265,485",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20207.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Darius Miller",
        "salary": "$7,250,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10871.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Jaxson Hayes",
        "salary": "$4,862,040",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31565.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Nicolo Melli",
        "salary": "$4,102,564",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31886.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Nickeil Alexander-Walker",
        "salary": "$2,964,840",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31574.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Josh Hart",
        "salary": "$1,934,160",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23625.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Jahlil Okafor",
        "salary": "$1,702,486",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17831.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Frank Jackson",
        "salary": "$1,618,520",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23626.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Kenrich Williams",
        "salary": "$1,416,852",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27758.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Zylan Cheatham",
        "salary": "-",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New Orleans Pelicans",
        "name": "Joshia Gray",
        "salary": "-",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Kevin Love",
        "salary": "$28,942,830",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6132.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Andre Drummond",
        "salary": "$27,950,199",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10817.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Tristan Thompson",
        "salary": "$18,539,130",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8054.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Larry Nance Jr.",
        "salary": "$12,727,273",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17855.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Matthew Dellavedova",
        "salary": "$9,607,500",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13478.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Dante Exum",
        "salary": "$9,600,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15357.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Darius Garland",
        "salary": "$6,400,920",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31562.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Collin Sexton",
        "salary": "$4,764,960",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26974.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Cedi Osman",
        "salary": "$2,907,143",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17859.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Ante Zizic",
        "salary": "$2,281,800",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20228.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Dylan Windler",
        "salary": "$2,035,800",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31585.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Alfonzo McKinnie",
        "salary": "$1,500,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24106.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Kevin Porter Jr.",
        "salary": "$1,290,960",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31589.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Sheldon McClellan",
        "salary": "$91,557",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20279.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Sir'Dominic Pointer",
        "salary": "$50,752",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Matt Mooney",
        "salary": "-",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Cleveland Cavaliers",
        "name": "Dean Wade",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Russell Westbrook",
        "salary": "$38,506,482",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6141.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "James Harden",
        "salary": "$38,199,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6312.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Eric Gordon",
        "salary": "$14,057,730",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6116.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Robert Covington",
        "salary": "$11,301,219",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13379.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "P.J. Tucker",
        "salary": "$8,349,039",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11059.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Danuel House",
        "salary": "$3,540,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20800.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Austin Rivers",
        "salary": "$2,174,318",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10818.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Houston Rockets",
        "name": "Ben McLemore",
        "salary": "$2,028,594",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13320.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Bruno Caboclo",
        "salary": "$1,845,301",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15372.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Tyson Chandler",
        "salary": "$1,620,564",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2605.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Thabo Sefolosha",
        "salary": "$1,620,564",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2250.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Isaiah Hartenstein",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23644.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Chris Clemons",
        "salary": "$563,347",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31983.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "DeMarre Carroll",
        "salary": "$512,721",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6294.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Michael Frazier",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18144.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Jeff Green",
        "salary": "$439,475",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2720.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Houston Rockets",
        "name": "Gary Clark",
        "salary": "$555,409",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27627.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "DeMar DeRozan",
        "salary": "$27,739,975",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6327.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "LaMarcus Aldridge",
        "salary": "$26,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2672.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Rudy Gay",
        "salary": "$14,500,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2534.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Patrick Mills",
        "salary": "$12,428,571",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6322.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Marco Belinelli",
        "salary": "$5,846,154",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2314.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Trey Lyles",
        "salary": "$5,500,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17840.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Jakob Poeltl",
        "salary": "$3,754,886",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20214.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Bryn Forbes",
        "salary": "$2,875,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20796.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Lonnie Walker IV",
        "salary": "$2,760,480",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26984.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Luka Samanic",
        "salary": "$2,689,920",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31576.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Dejounte Murray",
        "salary": "$2,321,735",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20234.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Keldon Johnson",
        "salary": "$1,950,600",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31588.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Derrick White",
        "salary": "$1,948,080",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23624.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Chimezie Metu",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27015.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Drew Eubanks",
        "salary": "-",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28052.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "San Antonio Spurs",
        "name": "Quinndary Weatherspoon",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Stephen Curry",
        "salary": "$40,231,758",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6287.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Klay Thompson",
        "salary": "$32,742,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8062.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2024",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Andrew Wiggins",
        "salary": "$27,504,630",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15353.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Draymond Green",
        "salary": "$18,539,130",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10860.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Kevon Looney",
        "salary": "$4,464,286",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17858.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Jordan Poole",
        "salary": "$1,964,760",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31587.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Eric Paschall",
        "salary": "$898,310",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31600.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Alen Smailagic",
        "salary": "$898,310",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31598.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Damion Lee",
        "salary": "$842,327",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21063.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Marquese Chriss",
        "salary": "$654,468",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20213.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Ky Bowman",
        "salary": "$350,189",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32457.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Golden State Warriors",
        "name": "Juan Toscano-Anderson",
        "salary": "$350,189",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32831.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Kyle Lowry",
        "salary": "$34,996,296",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2536.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Marc Gasol",
        "salary": "$25,595,700",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6122.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Serge Ibaka",
        "salary": "$23,271,605",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6313.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Norman Powell",
        "salary": "$10,116,576",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17874.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Fred VanVleet",
        "salary": "$9,346,153",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20778.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Patrick McCaw",
        "salary": "$4,000,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20244.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Stanley Johnson",
        "salary": "$3,623,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17836.png",
        "signed_using": "Bi Annual",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Rondae Hollis-Jefferson",
        "salary": "$2,500,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17851.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Pascal Siakam",
        "salary": "$2,351,839",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20232.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "OG Anunoby",
        "salary": "$2,281,800",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23618.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Chris Boucher",
        "salary": "$1,588,231",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23671.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Malcolm Miller",
        "salary": "$1,588,231",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18099.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Terence Davis",
        "salary": "$898,310",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32059.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Dewan Hernandez",
        "salary": "$898,310",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31618.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Matt Thomas",
        "salary": "$898,310",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31891.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Oshae Brissett",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Toronto Raptors",
        "name": "Paul Watson",
        "salary": "-",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
     {
        "team": "Milwaukee Bucks",
        "name": "Khris Middleton",
        "salary": "$30,603,448",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10864.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2024",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Giannis Antetokounmpo",
        "salary": "$25,842,697",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13328.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Eric Bledsoe",
        "salary": "$15,625,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6900.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Brook Lopez",
        "salary": "$12,093,024",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6136.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "George Hill",
        "salary": "$9,133,907",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6154.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Ersan Ilyasova",
        "salary": "$7,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6341.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Robin Lopez",
        "salary": "$4,767,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6147.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "DJ Wilson",
        "salary": "$2,961,120",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23612.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Donte DiVincenzo",
        "salary": "$2,905,800",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26983.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Wesley Matthews",
        "salary": "$2,564,753",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6489.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Pat Connaughton",
        "salary": "$1,723,050",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17869.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Kyle Korver",
        "salary": "$1,620,564",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2752.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Sterling Brown",
        "salary": "$1,618,520",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23647.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Thanasis Antetokounmpo",
        "salary": "$1,445,697",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15403.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Marvin Williams",
        "salary": "$604,278",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2208.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Frank Mason III",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23629.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Milwaukee Bucks",
        "name": "Cam Reynolds",
        "salary": "-",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28061.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Tobias Harris",
        "salary": "$32,742,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8070.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2024",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Al Horford",
        "salary": "$28,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2199.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Joel Embiid",
        "salary": "$27,504,630",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15355.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Josh Richardson",
        "salary": "$10,116,576",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17868.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Ben Simmons",
        "salary": "$8,113,930",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20206.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Mike Scott",
        "salary": "$4,767,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10868.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Zhaire Smith",
        "salary": "$3,058,800",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26982.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Matisse Thybulle",
        "salary": "$2,582,160",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31577.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Alec Burks",
        "salary": "$1,620,564",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8063.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Kyle O'Quinn",
        "salary": "$1,620,564",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10874.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Glenn Robinson III",
        "salary": "$1,620,564",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15392.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Raul Neto",
        "salary": "$1,620,564",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13360.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Furkan Korkmaz",
        "salary": "$1,620,564",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20231.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Shake Milton",
        "salary": "$1,445,697",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27020.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Norvel Pelle",
        "salary": "$350,189",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27836.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Philadelphia 76ers",
        "name": "Marial Shayock",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Nicolas Batum",
        "salary": "$25,565,217",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6149.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Terry Rozier",
        "salary": "$19,894,737",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17844.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Bismack Biyombo",
        "salary": "$17,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8057.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Cody Zeller",
        "salary": "$14,471,910",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13317.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Malik Monk",
        "salary": "$4,028,400",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23606.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "PJ Washington",
        "salary": "$3,831,840",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31569.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Miles Bridges",
        "salary": "$3,755,400",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26978.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Willy Hernangomez",
        "salary": "$1,676,735",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17863.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Dwayne Bacon",
        "salary": "$1,618,520",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23640.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Devonte' Graham",
        "salary": "$1,416,852",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27000.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Cody Martin",
        "salary": "$1,173,310",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31595.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Caleb Martin",
        "salary": "$898,310",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32682.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Jalen McDaniels",
        "salary": "$898,310",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31611.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Kobi Simmons",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23674.png",
        "signed_using": "",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Charlotte Hornets",
        "name": "Ray Spalding",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27022.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "D'Angelo Russell",
        "salary": "$27,285,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17830.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Karl-Anthony Towns",
        "salary": "$27,285,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17829.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2024",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Evan Turner",
        "salary": "$18,606,557",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6883.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "James Johnson",
        "salary": "$15,349,400",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6279.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Jarrett Culver",
        "salary": "$5,813,640",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31563.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Jake Layman",
        "salary": "$3,581,986",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20253.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Juan Hernangomez",
        "salary": "$3,321,030",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20220.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Malik Beasley",
        "salary": "$2,731,714",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20224.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Josh Okogie",
        "salary": "$2,530,680",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26986.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Jacob Evans",
        "salary": "$1,925,880",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26994.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Omari Spellman",
        "salary": "$1,897,800",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26996.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Jarred Vanderbilt",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27007.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Jaylen Nowell",
        "salary": "$1,400,000",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31602.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Naz Reid",
        "salary": "$898,310",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32045.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Kelan Martin",
        "salary": "-",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Minnesota Timberwolves",
        "name": "Jordan McLaughlin",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27975.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Damian Lillard",
        "salary": "$29,802,321",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10814.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "C.J. McCollum",
        "salary": "$27,556,959",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13323.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Hassan Whiteside",
        "salary": "$27,093,019",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6915.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Jusuf Nurkic",
        "salary": "$13,250,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15368.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Trevor Ariza",
        "salary": "$12,200,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2513.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Rodney Hood",
        "salary": "$5,718,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15375.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Zach Collins",
        "salary": "$4,240,200",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23605.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Anfernee Simons",
        "salary": "$2,149,560",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26990.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Nassir Little",
        "salary": "$2,105,520",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31583.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Caleb Swanigan",
        "salary": "$2,033,160",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23621.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Mario Hezonja",
        "salary": "$1,737,145",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17833.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Wenyen Gabriel",
        "salary": "$1,445,697",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27806.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Gary Trent Jr.",
        "salary": "$1,416,852",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27003.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Carmelo Anthony",
        "salary": "$1,364,204",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2283.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Moses Brown",
        "salary": "-",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Portland Trail Blazers",
        "name": "Jaylen Hoard",
        "salary": "-",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Kristaps Porzingis",
        "salary": "$27,285,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17832.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2024",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Tim Hardaway Jr.",
        "salary": "$20,025,127",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13337.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Courtney Lee",
        "salary": "$12,759,670",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6144.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Dwight Powell",
        "salary": "$10,259,375",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15397.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Delon Wright",
        "salary": "$9,473,684",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17848.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Maxi Kleber",
        "salary": "$8,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24212.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Luka Doncic",
        "salary": "$7,683,360",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26969.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Seth Curry",
        "salary": "$7,461,380",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13512.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Dorian Finney-Smith",
        "salary": "$4,000,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20757.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Boban Marjanovic",
        "salary": "$3,500,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17984.png",
        "signed_using": "Bi Annual",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Justin Jackson",
        "salary": "$3,280,920",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23610.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Willie Cauley-Stein",
        "salary": "$2,177,483",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17834.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Jose Barea",
        "salary": "$1,620,564",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2269.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": true
      },
      {
        "team": "Dallas Mavericks",
        "name": "Jalen Brunson",
        "salary": "$1,416,852",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26999.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Michael Kidd-Gilchrist",
        "salary": "$604,278",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10810.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Antonius Cleveland",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24370.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Dallas Mavericks",
        "name": "Josh Reaves",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Victor Oladipo",
        "salary": "$21,000,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13315.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Malcolm Brogdon",
        "salary": "$20,000,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20242.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Myles Turner",
        "salary": "$18,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17839.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "T.J. Warren",
        "salary": "$10,810,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15366.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Jeremy Lamb",
        "salary": "$10,500,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10820.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Doug McDermott",
        "salary": "$7,333,333",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15363.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Justin Holiday",
        "salary": "$4,767,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11441.png",
        "signed_using": "Room",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Domantas Sabonis",
        "salary": "$3,529,555",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20216.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "T.J. McConnell",
        "salary": "$3,500,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18252.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Goga Bitadze",
        "salary": "$2,816,760",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31575.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "TJ Leaf",
        "salary": "$2,813,280",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23613.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Aaron Holiday",
        "salary": "$2,239,200",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26989.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Edmond Sumner",
        "salary": "$2,000,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23653.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "JaKarr Sampson",
        "salary": "$1,620,564",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15838.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Alize Johnson",
        "salary": "$1,416,852",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27016.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Brian Bowen II",
        "salary": "-",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Indiana Pacers",
        "name": "Naz Mitrou-Long",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24478.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Kevin Durant",
        "salary": "$38,199,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2717.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Kyrie Irving",
        "salary": "$31,742,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8051.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Spencer Dinwiddie",
        "salary": "$10,605,600",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15390.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "DeAndre Jordan",
        "salary": "$9,881,598",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6117.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Joe Harris",
        "salary": "$7,666,667",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15385.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Garrett Temple",
        "salary": "$4,767,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6492.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Taurean Prince",
        "salary": "$3,481,986",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20217.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Caris LeVert",
        "salary": "$2,625,718",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20225.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Jarrett Allen",
        "salary": "$2,376,840",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23617.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Rodions Kurucs",
        "salary": "$1,699,236",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27006.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Wilson Chandler",
        "salary": "$1,620,564",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2616.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Theo Pinson",
        "salary": "$1,445,697",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27827.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Brooklyn Nets",
        "name": "Nicolas Claxton",
        "salary": "$898,310",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31590.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Chris Chiozza",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Jeremiah Martin",
        "salary": "-",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Justin Anderson",
        "salary": "",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17849.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Timothe Luwawu-Cabarrot",
        "salary": "$654,468",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20229.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "David Nwaba",
        "salary": "$1,678,854",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21577.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Iman Shumpert",
        "salary": "",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8068.png",
        "signed_using": "Mini MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Brooklyn Nets",
        "name": "Dzanan Musa",
        "salary": "$1,911,600",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26995.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Julius Randle",
        "salary": "$18,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15359.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Bobby Portis",
        "salary": "$15,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17850.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Maurice Harkless",
        "salary": "$11,011,236",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10823.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Taj Gibson",
        "salary": "$9,000,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6278.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Wayne Ellington",
        "salary": "$8,000,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6302.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Elfrid Payton",
        "salary": "$8,000,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15362.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "R.J. Barrett",
        "salary": "$7,839,960",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31560.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Frank Ntilikina",
        "salary": "$4,855,800",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23603.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Dennis Smith Jr.",
        "salary": "$4,463,640",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23604.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Kevin Knox",
        "salary": "$4,380,120",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26975.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Reggie Bullock",
        "salary": "$4,000,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13338.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Allonzo Trier",
        "salary": "$3,551,100",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27606.png",
        "signed_using": "Bi Annual",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Damyean Dotson",
        "salary": "$1,618,520",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23645.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Mitchell Robinson",
        "salary": "$1,559,712",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27002.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Ignas Brazdeikis",
        "salary": "$898,310",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31606.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Kadeem Allen",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23654.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "New York Knicks",
        "name": "Kenny Wooten",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32417.png",
        "signed_using": "",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Gorgui Dieng",
        "salary": "$16,229,213",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13334.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Jonas Valanciunas",
        "salary": "$16,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8055.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Justise Winslow",
        "salary": "$13,000,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17838.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Tyus Jones",
        "salary": "$9,258,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17852.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Kyle Anderson",
        "salary": "$9,073,050",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15382.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Ja Morant",
        "salary": "$8,730,240",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31559.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Josh Jackson",
        "salary": "$7,059,480",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23599.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Jaren Jackson Jr.",
        "salary": "$6,927,480",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26970.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Marko Guduric",
        "salary": "$2,625,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32684.png",
        "signed_using": "Bi Annual",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Brandon Clarke",
        "salary": "$2,478,840",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31578.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Grayson Allen",
        "salary": "$2,429,400",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26987.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Dillon Brooks",
        "salary": "$1,618,520",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23646.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "De'Anthony Melton",
        "salary": "$1,416,852",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27012.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Jontay Porter",
        "salary": "$197,933",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "John Konchar",
        "salary": "-",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Memphis Grizzlies",
        "name": "Yuta Watanabe",
        "salary": "-",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27713.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Devin Booker",
        "salary": "$27,285,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17841.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2024",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Ricky Rubio",
        "salary": "$16,200,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6305.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Kelly Oubre Jr.",
        "salary": "$15,625,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17843.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Deandre Ayton",
        "salary": "$9,562,920",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26967.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Aron Baynes",
        "salary": "$5,453,280",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11850.png",
        "signed_using": "Non Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Frank Kaminsky",
        "salary": "$4,767,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17837.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Mikal Bridges",
        "salary": "$4,161,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26976.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Cameron Johnson",
        "salary": "$4,033,440",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31568.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Dario Saric",
        "salary": "$3,481,986",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15364.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Ty Jerome",
        "salary": "$2,193,480",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31582.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Cheick Diallo",
        "salary": "$1,678,854",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20239.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Jevon Carter",
        "salary": "$1,416,852",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26998.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Élie Okobo",
        "salary": "$1,416,852",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26997.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Jalen Lecque",
        "salary": "$898,310",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32057.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Jared Harper",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Phoenix Suns",
        "name": "Tariq Owens",
        "salary": "-",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Mike Conley",
        "salary": "$32,511,623",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2532.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Rudy Gobert",
        "salary": "$25,008,427",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13340.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Bojan Bogdanovic",
        "salary": "$17,000,000",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8083.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Jordan Clarkson",
        "salary": "$13,437,500",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15398.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Joe Ingles",
        "salary": "$11,954,546",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15852.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Ed Davis",
        "salary": "",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6895.png",
        "signed_using": "Room",
        "final_year_of_contract": "2019",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Donovan Mitchell",
        "salary": "$3,635,760",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23608.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Tony Bradley",
        "salary": "$1,962,360",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23623.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Georges Niang",
        "salary": "$1,678,854",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20256.png",
        "signed_using": "Non Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Emmanuel Mudiay",
        "salary": "$1,620,564",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17835.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Royce O'Neale",
        "salary": "$1,618,520",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24240.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Nigel Williams-Goss",
        "salary": "$1,500,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23656.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Miye Oni",
        "salary": "$898,310",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31617.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Juwan Morgan",
        "salary": "$746,054",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Rayjon Tucker",
        "salary": "$578,573",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Jarrell Brantley",
        "salary": "-",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Utah Jazz",
        "name": "Justin Wright-Foreman",
        "salary": "-",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Otto Porter Jr.",
        "salary": "$27,250,575",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13316.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Zach LaVine",
        "salary": "$19,500,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15365.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Thaddeus Young",
        "salary": "$12,900,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2658.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Tomas Satoransky",
        "salary": "$10,000,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10857.png",
        "signed_using": "Sign And Trade",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Cristiano Felicio",
        "salary": "$8,156,500",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17990.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Kris Dunn",
        "salary": "$5,348,007",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20210.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Coby White",
        "salary": "$5,307,120",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31564.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Lauri Markkanen",
        "salary": "$5,300,400",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23602.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Wendell Carter Jr.",
        "salary": "$5,201,400",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26973.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Denzel Valentine",
        "salary": "$3,377,569",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20219.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Ryan Arcidiacono",
        "salary": "$3,000,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20275.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Chandler Hutchison",
        "salary": "$2,332,320",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26988.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Luke Kornet",
        "salary": "$2,250,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23670.png",
        "signed_using": "Room",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Daniel Gafford",
        "salary": "$898,310",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31597.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Shaquille Harrison",
        "salary": "$898,310",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21066.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": true
      },
      {
        "team": "Chicago Bulls",
        "name": "Adam Mokoka",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Chicago Bulls",
        "name": "Antonio Blakeney",
        "salary": "",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24223.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Nikola Vucevic",
        "salary": "$28,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8067.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Aaron Gordon",
        "salary": "$19,863,636",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15356.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Evan Fournier",
        "salary": "$17,150,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10845.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Terrence Ross",
        "salary": "$12,500,000",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10816.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Markelle Fultz",
        "salary": "$9,745,200",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23596.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Al-Farouq Aminu",
        "salary": "$9,258,000",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6890.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "D.J. Augustin",
        "salary": "$7,250,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6088.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Jonathan Isaac",
        "salary": "$5,806,440",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23601.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Mohamed Bamba",
        "salary": "$5,697,600",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26972.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Khem Birch",
        "salary": "$3,000,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15786.png",
        "signed_using": "Early Bird",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "James Ennis",
        "salary": "$1,882,867",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13363.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": true
      },
      {
        "team": "Orlando Magic",
        "name": "Michael Carter-Williams",
        "salary": "$1,620,564",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13324.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": true
      },
      {
        "team": "Orlando Magic",
        "name": "Wesley Iwundu",
        "salary": "$1,618,520",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23628.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Melvin Frazier",
        "salary": "$1,416,852",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27001.png",
        "signed_using": "MLE",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Gary Clark",
        "salary": "$555,409",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27627.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "B.J. Johnson",
        "salary": "-",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28026.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Orlando Magic",
        "name": "Vic Law",
        "salary": "-",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Jeff Teague",
        "salary": "$19,000,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6272.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Clint Capela",
        "salary": "$14,896,552",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15377.png",
        "signed_using": "Bird",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Dewayne Dedmon",
        "salary": "$13,333,334",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13536.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "De'Andre Hunter",
        "salary": "$7,068,360",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31561.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Trae Young",
        "salary": "$6,273,000",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26971.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Cam Reddish",
        "salary": "$4,245,720",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31567.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2023",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "John Collins",
        "salary": "$2,686,560",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23614.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Kevin Huerter",
        "salary": "$2,636,280",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26985.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "DeAndre' Bembry",
        "salary": "$2,603,982",
        "position": "Small Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20226.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Skal Labissiere",
        "salary": "$2,338,847",
        "position": "Power Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20233.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Damian Jones",
        "salary": "$2,305,057",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20235.png",
        "signed_using": "Rookie",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Treveon Graham",
        "salary": "$1,645,357",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18124.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Vince Carter",
        "salary": "$1,620,564",
        "position": "Shooting Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2590.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2020",
        "trade_clause": true
      },
      {
        "team": "Atlanta Hawks",
        "name": "Bruno Fernando",
        "salary": "$1,400,000",
        "position": "Center",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31593.png",
        "signed_using": "Cap Space",
        "final_year_of_contract": "2022",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Brandon Goodwin",
        "salary": "$522,738",
        "position": "Point Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28020.png",
        "signed_using": "Minimum",
        "final_year_of_contract": "2021",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Charlie Brown Jr.",
        "salary": "-",
        "position": "Forward",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
      {
        "team": "Atlanta Hawks",
        "name": "Paul Watson",
        "salary": "-",
        "position": "Guard",
        "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
        "signed_using": "",
        "final_year_of_contract": "2020",
        "trade_clause": false
      },
 
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
