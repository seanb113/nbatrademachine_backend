require 'json'
Team.destroy_all
Player.destroy_all
Trade.destroy_all
team_array = [
    {
      "name": "Atlanta Hawks",
      "cap_spent": "$117,945,055",
      "luxury_tax_space": "$14,681,945",
      "cap_space": "-$5,555,055",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/atl.png"
    },
    {
      "name": "Boston Celtics",
      "cap_spent": "$116,911,260",
      "luxury_tax_space": "$13,483,597",
      "cap_space": "-$7,771,260",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/200px-Boston_Celtics.svg_.png"
    },
    {
      "name": "Brooklyn Nets",
      "cap_spent": "$166,417,160",
      "luxury_tax_space": "-$33,512,262",
      "cap_space": "-$57,277,160",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Brooklyn-Nets-Shield-Logo.png"
    },
    {
      "name": "Charlotte Hornets",
      "cap_spent": "$100,303,579",
      "luxury_tax_space": "27,556,421",
      "cap_space": "$8,836,421",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/charlotte_hornets_2014.png"
    },
    {
      "name": "Chicago Bulls",
      "cap_spent": "$122,505,867",
      "luxury_tax_space": "$10,121,133",
      "cap_space": "-$13,365,867",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/chicago-bulls.png"
    },
    {
      "name": "Cleveland Cavaliers",
      "cap_spent": "$128,505,697",
      "luxury_tax_space": "$3,937,691",
      "cap_space": "-$19,365,697",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/ClevelandCavaliersLogo.png"
    },
    {
      "name": "Dallas Mavericks",
      "cap_spent": "$126,480,222",
      "luxury_tax_space": "$5,846,778",
      "cap_space": "-$17,340,222",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/200px-Dallas_Mavericks_logo.svg_.png"
    },
    {
      "name": "Denver Nuggets",
      "cap_spent": "$127,368,106",
      "luxury_tax_space": "$2,175,561",
      "cap_space": "-$18,228,106",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/den2.png"
    },
    {
      "name": "Detroit Pistons",
      "cap_spent": "$115,077,769",
      "luxury_tax_space": "$17,549,231",
      "cap_space": "-$5,937,769",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/pistons.png"
    },
    {
      "name": "Golden State Warriors",
      "cap_spent": "$172,824,610",
      "luxury_tax_space": "-$40,381,222",
      "cap_space": "-$63,684,610",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/warriors1.png"
    },
    {
      "name": "Houston Rockets",
      "cap_spent": "$128,668,890",
      "luxury_tax_space": "$3,599,631",
      "cap_space": "-$19,528,890",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/houston-rockets.png"
    },
    {
      "name": "Indiana Pacers",
      "cap_spent": "$128,050,239",
      "luxury_tax_space": "$4,218,282",
      "cap_space": "-$18,910,239",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/pcaers.png"
    },
    {
      "name": "Los Angeles Clippers",
      "cap_spent": "$138,389,392",
      "luxury_tax_space": "-$5,762,392",
      "cap_space": "-$29,249,392",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/new-clippers-logo.png"
    },
    {
      "name": "Los Angeles Lakers",
      "cap_spent": "$136,515,047",
      "luxury_tax_space": "-$5,388,047",
      "cap_space": "-$27,375,047",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/lakers.png"
    },
    {
      "name": "Memphis Grizzlies",
      "cap_spent": "$131,337,858",
      "luxury_tax_space": "$1,400,140",
      "cap_space": "-$22,197,858",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/memphis.png"
    },
    {
      "name": "Miami Heat",
      "cap_spent": "$123,704,154",
      "luxury_tax_space": "$7,739,234",
      "cap_space": "-$14,564,154",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/heat.png"
    },
    {
      "name": "Milwaukee Bucks",
      "cap_spent": "$134,464,759",
      "luxury_tax_space": "-$5,859,426",
      "cap_space": "-$25,324,759",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Milwaukee_Bucks_logo15.png"
    },
    {
      "name": "Minnesota Timberwolves",
      "cap_spent": "$131,949,863",
      "luxury_tax_space": "$2,778,325",
      "cap_space": "-$22,809,863",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/MTimberwolves_Global-2017.png"
    },
    {
      "name": "New Orleans Pelicans",
      "cap_spent": "$130,059,857",
      "luxury_tax_space": "$2,567,143",
      "cap_space": "-$20,919,857",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/pelicans.png"
    },
    {
      "name": "New York Knicks",
      "cap_spent": "$94,076,582",
      "luxury_tax_space": "$36,660,418",
      "cap_space": "$15,063,418",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/knicks.png"
    },
    {
      "name": "Oklahoma City Thunder",
      "cap_spent": "$122,643,375",
      "luxury_tax_space": "$36,834,585",
      "cap_space": "-$13,503,375",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/oklahoma-city-thunder-logo-png-i19.png"
    },
    {
      "name": "Orlando Magic",
      "cap_spent": "$129,812,621",
      "luxury_tax_space": "$2,814,379",
      "cap_space": "-$20,672,621",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/orl.png"
    },
    {
      "name": "Philadelphia 76ers",
      "cap_spent": "$144,069,376",
      "luxury_tax_space": "-$11,442,376",
      "cap_space": "-$34,929,376",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Philadelphia_76ers_Logo.png"
    },
    {
      "name": "Phoenix Suns",
      "cap_spent": "$126,446,492",
      "luxury_tax_space": "$6,180,508",
      "cap_space": "-$17,306,492",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/suns.png"
    },
    {
      "name": "Portland Trail Blazers",
      "cap_spent": "$130,749,148",
      "luxury_tax_space": "$627,852",
      "cap_space": "-$21,609,148",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Portland_Trail_Blazers_alternate_logo.svg_.png"
    },
    {
      "name": "Sacramento Kings",
      "cap_spent": "$123,997,904",
      "luxury_tax_space": "$24,803,994",
      "cap_space": "-$14,857,904",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/KingsAvatar_1080x1090.jpg"
    },
    {
      "name": "San Antonio Spurs",
      "cap_spent": "$131,616,175",
      "luxury_tax_space": "$1,010,825",
      "cap_space": "-$22,476,175",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/spurs.png"
    },
    {
      "name": "Toronto Raptors",
      "cap_spent": "$129,128,921",
      "luxury_tax_space": "$2,955,988",
      "cap_space": "-$19,988,921",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/Toronto_Raptors_logo_2015-16.png"
    },
    {
      "name": "Utah Jazz",
      "cap_spent": "$134,509,944",
      "luxury_tax_space": "-$2,566,556",
      "cap_space": "-$25,369,944",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/utahjazz.png"
    },
    {
      "name": "Washington Wizards",
      "cap_spent": "$131,087,307",
      "luxury_tax_space": "$928,437",
      "cap_space": "-$21,947,307",
      "logo": "https://d1dglpr230r57l.cloudfront.net/images/thumb/logo.png"
    }
  ]

  
  team_array.each do |team|
    name = team[:name]
    cap_spent = team[:cap_spent]
    luxury_tax_space = team[:luxury_tax_space]
    cap_space = team[:cap_space]
    logo = team[:logo]
    Team.create(name: name, cap_spent: cap_spent, logo: logo, luxury_tax_space: luxury_tax_space, cap_space: cap_space)
  end

laker_players = 
[
  {
    "team": "Brooklyn Nets",
    "name": "James Harden",
    "salary": "$41,254,920",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6312.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Kevin Durant",
    "salary": "$40,108,950",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2717.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Kyrie Irving",
    "salary": "$33,460,350",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8051.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Joe Harris",
    "salary": "$16,071,429",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15385.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Spencer Dinwiddie",
    "salary": "$11,454,048",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15390.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "DeAndre Jordan",
    "salary": "$10,375,678",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6117.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Landry Shamet",
    "salary": "$2,090,040",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26992.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Timothe Luwawu-Cabarrot",
    "salary": "$1,824,003",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20229.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Bruce Brown",
    "salary": "$1,663,861",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27008.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Jeff Green",
    "salary": "$1,620,564",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2720.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Tyler Johnson",
    "salary": "$1,620,564",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15645.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Nicolas Claxton",
    "salary": "$1,517,981",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31590.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Iman Shumpert",
    "salary": "$1,187,674",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8068.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Noah Vonleh",
    "salary": "$1,087,776",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15361.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Norvel Pelle",
    "salary": "$1,079,322",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27836.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Brooklyn Nets",
    "name": "Theo Pinson",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27827.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Danilo Gallinari",
    "salary": "$19,500,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6138.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Bogdan Bogdanovic",
    "salary": "$18,000,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15379.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Clint Capela",
    "salary": "$16,000,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15377.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Tony Snell",
    "salary": "$12,178,571",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13333.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Rajon Rondo",
    "salary": "$7,500,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2222.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "De'Andre Hunter",
    "salary": "$7,422,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31561.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Trae Young",
    "salary": "$6,571,800",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26971.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Onyeka Okongwu",
    "salary": "$5,813,640",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70648.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Kris Dunn",
    "salary": "$4,767,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20210.png",
    "signed_using": "Room",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Cam Reddish",
    "salary": "$4,458,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31567.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "John Collins",
    "salary": "$4,137,302",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23614.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Kevin Huerter",
    "salary": "$2,761,920",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26985.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Brandon Goodwin",
    "salary": "$1,701,593",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28020.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Solomon Hill",
    "salary": "$1,620,564",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13336.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Bruno Fernando",
    "salary": "$1,517,981",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31593.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Nathan Knight",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Atlanta Hawks",
    "name": "Skylar Mays",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70692.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Kemba Walker",
    "salary": "$34,379,100",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8059.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Jaylen Brown",
    "salary": "$23,735,119",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20208.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Marcus Smart",
    "salary": "$13,446,428",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15358.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Jayson Tatum",
    "salary": "$9,897,120",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23598.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Tristan Thompson",
    "salary": "$9,258,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8054.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Daniel Theis",
    "salary": "$5,000,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23828.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Romeo Langford",
    "salary": "$3,631,200",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31571.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Aaron Nesmith",
    "salary": "$3,458,400",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70656.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Grant Williams",
    "salary": "$2,498,760",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31579.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Payton Pritchard",
    "salary": "$2,035,800",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70668.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Robert Williams",
    "salary": "$2,029,920",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26993.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Semi Ojeleye",
    "salary": "$1,752,950",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23632.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Jeff Teague",
    "salary": "$1,620,564",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6272.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Carsen Edwards",
    "salary": "$1,517,981",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31592.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Javonte Green",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
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
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31972.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Tremont Waters",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31610.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Boston Celtics",
    "name": "Max Strus",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32411.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Julius Randle",
    "salary": "$18,900,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15359.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "R.J. Barrett",
    "salary": "$8,231,760",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31560.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Derrick Rose",
    "salary": "$7,682,927",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6095.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Frank Ntilikina",
    "salary": "$6,176,578",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23603.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Alec Burks",
    "salary": "$6,000,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8063.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Nerlens Noel",
    "salary": "$5,000,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13319.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Obi Toppin",
    "salary": "$4,862,040",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70650.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Elfrid Payton",
    "salary": "$4,767,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15362.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Kevin Knox",
    "salary": "$4,588,680",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26975.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Reggie Bullock",
    "salary": "$4,200,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13338.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Austin Rivers",
    "salary": "$3,500,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10818.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Immanuel Quickley",
    "salary": "$2,105,520",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70667.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Mitchell Robinson",
    "salary": "$1,663,861",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27002.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Ignas Brazdeikis",
    "salary": "$1,517,981",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31606.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Taj Gibson",
    "salary": "$1,442,968",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6278.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Jared Harper",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32403.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New York Knicks",
    "name": "Theo Pinson",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27827.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Tobias Harris",
    "salary": "$34,358,850",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8070.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Ben Simmons",
    "salary": "$30,559,200",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20206.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2025",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Joel Embiid",
    "salary": "$29,542,010",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15355.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Danny Green",
    "salary": "$15,365,854",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6277.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Seth Curry",
    "salary": "$7,834,449",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13512.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Mike Scott",
    "salary": "$5,005,350",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10868.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Terrance Ferguson",
    "salary": "$3,944,013",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23616.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Tony Bradley",
    "salary": "$3,542,060",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23623.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Matisse Thybulle",
    "salary": "$2,711,280",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31577.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Vincent Poirier",
    "salary": "$2,619,207",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31917.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Tyrese Maxey",
    "salary": "$2,478,840",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70663.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Furkan Korkmaz",
    "salary": "$1,762,796",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20231.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Shake Milton",
    "salary": "$1,701,593",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27020.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Dwight Howard",
    "salary": "$1,620,564",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2640.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": true
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Isaiah Joe",
    "salary": "$898,310",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70691.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Paul Reed",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70700.png",
    "signed_using": "",
    "final_year_of_contract": "0",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Frank Mason III",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23629.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Norvel Pelle",
    "salary": "$1,079,322",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27836.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Mikal Bridges",
    "salary": "$4,359,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26976.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Philadelphia 76ers",
    "name": "Rayjon Tucker",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32785.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Pascal Siakam",
    "salary": "$30,559,200",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20232.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Kyle Lowry",
    "salary": "$30,500,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2536.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Fred VanVleet",
    "salary": "$21,250,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20778.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Norman Powell",
    "salary": "$10,865,952",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17874.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Aron Baynes",
    "salary": "$7,000,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11850.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Chris Boucher",
    "salary": "$6,500,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23671.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2022",
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
    "name": "OG Anunoby",
    "salary": "$3,872,215",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23618.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Stanley Johnson",
    "salary": "$3,804,150",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17836.png",
    "signed_using": "Bi Annual",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Malachi Flynn",
    "salary": "$1,950,600",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70671.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "DeAndre' Bembry",
    "salary": "$1,737,145",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20226.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Terence Davis",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32059.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Matt Thomas",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31891.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Paul Watson",
    "salary": "$1,445,697",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28089.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Jalen Harris",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70701.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Yuta Watanabe",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27713.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Toronto Raptors",
    "name": "Alex Len",
    "salary": "$1,265,372",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13318.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Otto Porter Jr.",
    "salary": "$28,489,238",
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
    "salary": "$13,545,000",
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
    "salary": "$7,529,020",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17990.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Patrick Williams",
    "salary": "$7,068,360",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70646.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Lauri Markkanen",
    "salary": "$6,731,508",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23602.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Coby White",
    "salary": "$5,572,680",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31564.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Wendell Carter Jr.",
    "salary": "$5,448,840",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26973.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Garrett Temple",
    "salary": "$4,767,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6492.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Denzel Valentine",
    "salary": "$4,642,800",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20219.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
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
    "salary": "$2,443,440",
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
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23670.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Daniel Gafford",
    "salary": "$1,517,981",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31597.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Devon Dotson",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "0",
    "trade_clause": false
  },
  {
    "team": "Chicago Bulls",
    "name": "Adam Mokoka",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31961.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Kevin Love",
    "salary": "$31,258,256",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6132.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Andre Drummond",
    "salary": "$28,751,775",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10817.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Taurean Prince",
    "salary": "$12,250,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20217.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Larry Nance Jr.",
    "salary": "$11,709,091",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17855.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Cedi Osman",
    "salary": "$8,840,909",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17859.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Darius Garland",
    "salary": "$6,720,720",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31562.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Isaac Okoro",
    "salary": "$6,400,920",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70647.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Collin Sexton",
    "salary": "$4,991,880",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26974.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "JaVale McGee",
    "salary": "$4,200,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6159.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Jarrett Allen",
    "salary": "$3,909,902",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23617.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Dylan Windler",
    "salary": "$2,137,440",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31585.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Damyean Dotson",
    "salary": "$2,000,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23645.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Matthew Dellavedova",
    "salary": "$1,620,564",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13478.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": true
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Dean Wade",
    "salary": "$1,517,981",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31963.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Marques Bolden",
    "salary": "-",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32818.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Lamar Stevens",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70716.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Cleveland Cavaliers",
    "name": "Rayjon Tucker",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32785.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
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
    "team": "Detroit Pistons",
    "name": "Blake Griffin",
    "salary": "$36,810,996",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6501.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Jerami Grant",
    "salary": "$19,050,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15391.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Delon Wright",
    "salary": "$9,000,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17848.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Mason Plumlee",
    "salary": "$8,000,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13335.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Dennis Smith Jr.",
    "salary": "$5,686,677",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23604.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Killian Hayes",
    "salary": "$5,307,120",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70649.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Rodney McGruder",
    "salary": "$5,192,307",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13575.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Josh Jackson",
    "salary": "$4,767,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23599.png",
    "signed_using": "Room",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Sekou Doumbouya",
    "salary": "$3,449,400",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31572.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Isaiah Stewart",
    "salary": "$3,121,080",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70658.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Saddiq Bey",
    "salary": "$2,689,920",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70661.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Jahlil Okafor",
    "salary": "$1,882,867",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17831.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Sviatoslav Mykhailiuk",
    "salary": "$1,663,861",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27013.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Wayne Ellington",
    "salary": "$1,620,564",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6302.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Deividas Sirvydis",
    "salary": "$898,310",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31596.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Frank Jackson",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23626.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Detroit Pistons",
    "name": "Saben Lee",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70680.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Malcolm Brogdon",
    "salary": "$20,700,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20242.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Domantas Sabonis",
    "salary": "$19,800,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20216.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
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
    "name": "Caris LeVert",
    "salary": "$16,203,704",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20225.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "T.J. Warren",
    "salary": "$12,000,000",
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
    "salary": "$5,720,400",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11441.png",
    "signed_using": "Non Bird",
    "final_year_of_contract": "2023",
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
    "salary": "$2,957,520",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31575.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Aaron Holiday",
    "salary": "$2,345,640",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26989.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Edmond Sumner",
    "salary": "$2,160,000",
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
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15838.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Jalen Lecque",
    "salary": "$1,517,981",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32057.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Kelan Martin",
    "salary": "$1,445,697",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32756.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2020",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Brian Bowen II",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31889.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Indiana Pacers",
    "name": "Cassius Stanley",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Khris Middleton",
    "salary": "$33,051,724",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10864.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Giannis Antetokounmpo",
    "salary": "$27,528,088",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13328.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Jrue Holiday",
    "salary": "$25,876,111",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6316.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Brook Lopez",
    "salary": "$12,697,675",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6136.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "D.J. Augustin",
    "salary": "$6,666,667",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6088.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Pat Connaughton",
    "salary": "$4,938,237",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17869.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "DJ Wilson",
    "salary": "$4,548,281",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23612.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Bobby Portis",
    "salary": "$3,623,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17850.png",
    "signed_using": "Bi Annual",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Donte DiVincenzo",
    "salary": "$3,044,160",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26983.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Bryn Forbes",
    "salary": "$2,337,145",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20796.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Thanasis Antetokounmpo",
    "salary": "$1,701,593",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15403.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Torrey Craig",
    "salary": "$1,620,564",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24230.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Sam Merrill",
    "salary": "$898,310",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70702.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Jordan Nwora",
    "salary": "$898,310",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70687.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Jaylen Adams",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27343.png",
    "signed_using": "",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Milwaukee Bucks",
    "name": "Mamadi Diakite",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Gordon Hayward",
    "salary": "$28,500,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6891.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Terry Rozier",
    "salary": "$18,900,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17844.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Cody Zeller",
    "salary": "$15,415,730",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13317.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "LaMelo Ball",
    "salary": "$7,839,960",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70645.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Malik Monk",
    "salary": "$5,345,687",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23606.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "PJ Washington",
    "salary": "$4,023,600",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31569.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Miles Bridges",
    "salary": "$3,934,320",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26978.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Bismack Biyombo",
    "salary": "$3,500,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8057.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Devonte' Graham",
    "salary": "$1,663,861",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27000.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Cody Martin",
    "salary": "$1,517,981",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31595.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Caleb Martin",
    "salary": "$1,517,981",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32682.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Jalen McDaniels",
    "salary": "$1,517,981",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31611.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Vernon Carey Jr.",
    "salary": "$1,350,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70674.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Nick Richards",
    "salary": "$1,000,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70684.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Nate Darling",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Charlotte Hornets",
    "name": "Grant Riller",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70698.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Jimmy Butler",
    "salary": "$34,379,100",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8081.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Goran Dragic",
    "salary": "$18,000,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6146.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": true
  },
  {
    "team": "Miami Heat",
    "name": "Andre Iguodala",
    "salary": "",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2652.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2020",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Kelly Olynyk",
    "salary": "$12,598,244",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13326.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Meyers Leonard",
    "salary": "$9,400,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10819.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": true
  },
  {
    "team": "Miami Heat",
    "name": "Avery Bradley",
    "salary": "$5,635,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6901.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Edrice Adebayo",
    "salary": "$5,115,492",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23609.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Tyler Herro",
    "salary": "$3,822,240",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31570.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Maurice Harkless",
    "salary": "$3,623,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10823.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Precious Achiuwa",
    "salary": "$2,582,160",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70662.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Kendrick Nunn",
    "salary": "$1,663,861",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28041.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Duncan Robinson",
    "salary": "$1,663,861",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27658.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Udonis Haslem",
    "salary": "$1,620,564",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2549.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": true
  },
  {
    "team": "Miami Heat",
    "name": "KZ Okpala",
    "salary": "$1,517,981",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31591.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Chris Silva",
    "salary": "$1,517,981",
    "position": "Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32319.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Max Strus",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32411.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Miami Heat",
    "name": "Gabe Vincent",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28087.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Nikola Vucevic",
    "salary": "$26,000,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8067.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Aaron Gordon",
    "salary": "$18,136,364",
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
    "salary": "$13,500,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10816.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Markelle Fultz",
    "salary": "$12,288,697",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23596.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Al-Farouq Aminu",
    "salary": "$9,720,900",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6890.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Jonathan Isaac",
    "salary": "$7,362,566",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23601.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Mohamed Bamba",
    "salary": "$5,969,040",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26972.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Michael Carter-Williams",
    "salary": "$3,300,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13324.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "James Ennis III",
    "salary": "$3,300,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13363.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Cole Anthony",
    "salary": "$3,285,120",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70657.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Chuma Okeke",
    "salary": "$3,121,080",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31573.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Khem Birch",
    "salary": "$3,000,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15786.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Gary Clark",
    "salary": "$2,000,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27627.png",
    "signed_using": "Non Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Dwayne Bacon",
    "salary": "$1,678,854",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23640.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Karim Mane",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Orlando Magic",
    "name": "Frank Mason III",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23629.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Russell Westbrook",
    "salary": "$41,358,814",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6141.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Bradley Beal",
    "salary": "$28,751,775",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10811.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Davis Bertans",
    "salary": "$15,000,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8094.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2025",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Thomas Bryant",
    "salary": "$8,333,333",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23643.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Robin Lopez",
    "salary": "$7,300,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6147.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
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
    "salary": "$4,692,840",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31566.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Deni Avdija",
    "salary": "$4,469,160",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70651.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Jerome Robinson",
    "salary": "$3,737,520",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26979.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Troy Brown Jr.",
    "salary": "$3,372,840",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26981.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Moritz Wagner",
    "salary": "$2,161,920",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26991.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Isaac Bonga",
    "salary": "$1,663,861",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27005.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Raul Neto",
    "salary": "$1,620,564",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13360.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Alex Len",
    "salary": "$1,265,372",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13318.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Anthony Gill",
    "salary": "$898,310",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70741.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Garrison Mathews",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32044.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Washington Wizards",
    "name": "Cassius Winston",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70695.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Nikola Jokic",
    "salary": "$29,542,010",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15393.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Jamal Murray",
    "salary": "$27,285,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20212.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2025",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Gary Harris",
    "salary": "$19,610,714",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15371.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Will Barton",
    "salary": "$13,723,214",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10865.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Paul Millsap",
    "salary": "$10,000,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2754.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "JaMychal Green",
    "salary": "$7,199,760",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11666.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Michael Porter Jr.",
    "salary": "$3,550,800",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26980.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Facundo Campazzo",
    "salary": "$3,200,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70736.png",
    "signed_using": "Bi Annual",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Zeke Nnaji",
    "salary": "$2,379,840",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70664.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "RJ Hampton",
    "salary": "$2,193,480",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70666.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Bol Bol",
    "salary": "$2,058,240",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31603.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "P.J. Dozier",
    "salary": "$1,762,796",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23668.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Monte Morris",
    "salary": "$1,723,707",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23652.png",
    "signed_using": "Mini MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Isaiah Hartenstein",
    "salary": "$1,620,564",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23644.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Vlatko Cancar",
    "salary": "$1,517,981",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23650.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Markus Howard",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Greg Whittington",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18173.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Denver Nuggets",
    "name": "Jarred Vanderbilt",
    "salary": "$1,663,861",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27007.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Karl-Anthony Towns",
    "salary": "$29,467,800",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17829.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "D'Angelo Russell",
    "salary": "$28,649,250",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17830.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Ricky Rubio",
    "salary": "$17,000,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6305.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Malik Beasley",
    "salary": "$13,425,895",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20224.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2020",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Anthony Edwards",
    "salary": "$9,757,440",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70643.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Juan Hernangomez",
    "salary": "$6,493,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20220.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Jarrett Culver",
    "salary": "$6,104,280",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31563.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Ed Davis",
    "salary": "$5,005,350",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6895.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Jake Layman",
    "salary": "$3,761,085",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20253.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Josh Okogie",
    "salary": "$2,651,040",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26986.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Jaden McDaniels",
    "salary": "$1,964,760",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70670.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Jarred Vanderbilt",
    "salary": "$1,663,861",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27007.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Jaylen Nowell",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31602.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Naz Reid",
    "salary": "$1,517,981",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32045.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Ashton Hagans",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Minnesota Timberwolves",
    "name": "Jordan McLaughlin",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27975.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Al Horford",
    "salary": "$27,500,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2199.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Trevor Ariza",
    "salary": "$12,800,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2513.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "George Hill",
    "salary": "$9,590,602",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6154.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Darius Miller",
    "salary": "$7,000,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10871.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Justin Jackson",
    "salary": "$5,029,650",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23610.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Shai Gilgeous-Alexander",
    "salary": "$4,141,320",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26977.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Aleksej Pokusevski",
    "salary": "$2,964,840",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70659.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Darius Bazley",
    "salary": "$2,399,160",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31581.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Ty Jerome",
    "salary": "$2,303,040",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31582.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Mike Muscala",
    "salary": "$2,283,034",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13357.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Theo Maledon",
    "salary": "$2,000,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70676.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Kenrich Williams",
    "salary": "$2,000,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27758.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Hamidou Diallo",
    "salary": "$1,663,861",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27011.png",
    "signed_using": "Mini MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Luguentz Dort",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/33033.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Isaiah Roby",
    "salary": "$1,517,981",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31604.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Josh Hall",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70707.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Oklahoma City Thunder",
    "name": "Moses Brown",
    "salary": "-",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32830.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Damian Lillard",
    "salary": "$31,626,953",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10814.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "C.J. McCollum",
    "salary": "$29,354,152",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13323.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Jusuf Nurkic",
    "salary": "$12,888,889",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15368.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Robert Covington",
    "salary": "$12,138,345",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13379.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Rodney Hood",
    "salary": "$10,047,450",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15375.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Derrick Jones Jr.",
    "salary": "$9,258,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21067.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Zach Collins",
    "salary": "$5,406,255",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23605.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Enes Kanter",
    "salary": "$5,005,350",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8053.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Anfernee Simons",
    "salary": "$2,252,040",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26990.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Nassir Little",
    "salary": "$2,210,640",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31583.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Gary Trent Jr.",
    "salary": "$1,663,861",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27003.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Carmelo Anthony",
    "salary": "$1,620,564",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2283.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Harry Giles",
    "salary": "$1,620,564",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23615.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "CJ Elleby",
    "salary": "$898,310",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70688.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Portland Trail Blazers",
    "name": "Keljin Blevins",
    "salary": "-",
    "position": "Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32992.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Mike Conley",
    "salary": "$34,502,132",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2532.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Rudy Gobert",
    "salary": "$27,525,281",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13340.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Bojan Bogdanovic",
    "salary": "$17,850,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8083.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Jordan Clarkson",
    "salary": "$11,500,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15398.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Joe Ingles",
    "salary": "$10,863,637",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15852.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Derrick Favors",
    "salary": "$9,258,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6884.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Royce O'Neale",
    "salary": "$8,500,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24240.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Donovan Mitchell",
    "salary": "$5,195,501",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23608.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Udoka Azubuike",
    "salary": "$1,977,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70669.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Georges Niang",
    "salary": "$1,783,557",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20256.png",
    "signed_using": "Non Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Shaquille Harrison",
    "salary": "$1,620,564",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21066.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Juwan Morgan",
    "salary": "$1,517,981",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32678.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Miye Oni",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31617.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Elijah Hughes",
    "salary": "$898,310",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70681.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Jarrell Brantley",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31609.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Utah Jazz",
    "name": "Trent Forrest",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70708.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Stephen Curry",
    "salary": "$43,006,362",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6287.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Klay Thompson",
    "salary": "$35,361,360",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8062.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Andrew Wiggins",
    "salary": "$29,542,010",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15353.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Draymond Green",
    "salary": "$22,246,956",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10860.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Kelly Oubre Jr.",
    "salary": "$14,375,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17843.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "James Wiseman",
    "salary": "$8,730,240",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70644.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Kevon Looney",
    "salary": "$4,821,429",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17858.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Brad Wanamaker",
    "salary": "$2,250,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27289.png",
    "signed_using": "Mini MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Jordan Poole",
    "salary": "$2,063,280",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31587.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Marquese Chriss",
    "salary": "$1,824,003",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20213.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Damion Lee",
    "salary": "$1,762,796",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21063.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Kent Bazemore",
    "salary": "$1,620,564",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11079.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Mychal Mulder",
    "salary": "$1,517,981",
    "position": "Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32841.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Eric Paschall",
    "salary": "$1,517,981",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31600.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Alen Smailagic",
    "salary": "$1,517,981",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31598.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Nico Mannion",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70690.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Golden State Warriors",
    "name": "Juan Toscano-Anderson",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32831.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Paul George",
    "salary": "$35,450,412",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6892.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Kawhi Leonard",
    "salary": "$34,379,100",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8066.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Marcus Morris Sr.",
    "salary": "$14,883,721",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8065.png",
    "signed_using": "Non Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Patrick Beverley",
    "salary": "$13,333,333",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6297.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Serge Ibaka",
    "salary": "$9,258,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6313.png",
    "signed_using": "MLE",
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
    "salary": "$7,000,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20238.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Luke Kennard",
    "salary": "",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23607.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2025",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Patrick Patterson",
    "salary": "$3,077,701",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6896.png",
    "signed_using": "Non Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Mfiondu Kabengele",
    "salary": "$2,075,880",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31586.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Nicolas Batum",
    "salary": "$1,620,564",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6149.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Reggie Jackson",
    "salary": "$1,620,564",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8075.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Terance Mann",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31607.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Daniel Oturu",
    "salary": "$898,310",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70675.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Amir Coffey",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32198.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Jay Scrubb",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70697.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Clippers",
    "name": "Rayjon Tucker",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32785.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "LeBron James",
    "salary": "$39,219,565",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2257.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Anthony Davis",
    "salary": "$32,742,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10809.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2025",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Dennis Schröder",
    "salary": "$16,000,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13330.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Kentavious Caldwell-Pope",
    "salary": "$12,073,020",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13321.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Montrezl Harrell",
    "salary": "$9,258,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17860.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Wesley Matthews",
    "salary": "$3,623,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6489.png",
    "signed_using": "Bi Annual",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Kyle Kuzma",
    "salary": "$3,562,178",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23622.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Alex Caruso",
    "salary": "$2,750,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21076.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Marc Gasol",
    "salary": "$2,564,753",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6122.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Alfonzo McKinnie",
    "salary": "$1,762,796",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24106.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Jared Dudley",
    "salary": "$1,620,564",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2228.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Markieff Morris",
    "salary": "$1,620,564",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8064.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": true
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Quinn Cook",
    "salary": "$1,620,564",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18264.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Talen Horton-Tucker",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31605.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Kostas Antetokounmpo",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27026.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Los Angeles Lakers",
    "name": "Devontae Cacok",
    "salary": "-",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32199.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Chris Paul",
    "salary": "$41,358,814",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2609.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Devin Booker",
    "salary": "$29,467,800",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17841.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Deandre Ayton",
    "salary": "$10,018,200",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26967.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Jae Crowder",
    "salary": "$9,258,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10859.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Dario Saric",
    "salary": "$9,250,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15364.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Mikal Bridges",
    "salary": "$4,359,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26976.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Jalen Smith",
    "salary": "$4,245,720",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70652.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Cameron Johnson",
    "salary": "$4,235,160",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31568.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Jevon Carter",
    "salary": "$3,925,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26998.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Cameron Payne",
    "salary": "$1,977,011",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17842.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Abdel Nader",
    "salary": "$1,752,950",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20264.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Damian Jones",
    "salary": "$1,737,145",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20235.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "E'Twaun Moore",
    "salary": "$1,620,564",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8107.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Langston Galloway",
    "salary": "$1,620,564",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15824.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Frank Kaminsky",
    "salary": "$1,620,564",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17837.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Phoenix Suns",
    "name": "Ty-Shon Alexander",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Buddy Hield",
    "salary": "$24,701,834",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20211.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Harrison Barnes",
    "salary": "$22,215,909",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/10815.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Cory Joseph",
    "salary": "$12,600,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/8080.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Marvin Bagley III",
    "salary": "$8,963,640",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26968.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "De'Aaron Fox",
    "salary": "$8,099,627",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23600.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Nemanja Bjelica",
    "salary": "$7,150,000",
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
    "name": "Richaun Holmes",
    "salary": "$5,005,350",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17865.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Tyrese Haliburton",
    "salary": "$3,831,840",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70654.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Hassan Whiteside",
    "salary": "$1,620,564",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6915.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Glenn Robinson III",
    "salary": "$1,620,564",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15392.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Justin James",
    "salary": "$1,517,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31599.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Robert Woodard II",
    "salary": "$1,500,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70682.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "DaQuan Jeffries",
    "salary": "$1,445,697",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32680.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Jahmi'us Ramsey",
    "salary": "$1,000,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70685.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Kyle Guy",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31614.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Sacramento Kings",
    "name": "Chimezie Metu",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27015.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Kristaps Porzingis",
    "salary": "$29,467,800",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17832.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Tim Hardaway Jr.",
    "salary": "$18,975,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13337.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "James Johnson",
    "salary": "$16,047,100",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6279.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Dwight Powell",
    "salary": "$11,080,125",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15397.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Josh Richardson",
    "salary": "$10,865,952",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17868.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Maxi Kleber",
    "salary": "$8,325,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/24212.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Luka Doncic",
    "salary": "$8,049,360",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26969.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Willie Cauley-Stein",
    "salary": "$4,100,000",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17834.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
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
    "name": "Trey Burke",
    "salary": "$3,000,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13322.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Josh Green",
    "salary": "$2,816,760",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70660.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Wesley Iwundu",
    "salary": "$1,678,854",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23628.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Jalen Brunson",
    "salary": "$1,663,861",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26999.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Tyrell Terry",
    "salary": "$1,289,846",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70673.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Tyler Bey",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70678.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Dallas Mavericks",
    "name": "Nate Hinton",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "John Wall",
    "salary": "$41,254,920",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6882.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Victor Oladipo",
    "salary": "$21,000,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13315.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Eric Gordon",
    "salary": "$16,869,276",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6116.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Christian Wood",
    "salary": "$13,015,874",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/18218.png",
    "signed_using": "Sign And Trade",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Dante Exum",
    "salary": "$9,600,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15357.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "P.J. Tucker",
    "salary": "$7,969,537",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/11059.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Danuel House",
    "salary": "$3,717,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20800.png",
    "signed_using": "Mini MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Ben McLemore",
    "salary": "$2,283,034",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13320.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "David Nwaba",
    "salary": "$1,824,003",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/21577.png",
    "signed_using": "Mini MLE",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Rodions Kurucs",
    "salary": "$1,780,152",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27006.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Kevin Porter Jr.",
    "salary": "$1,717,981",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31589.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "DeMarcus Cousins",
    "salary": "$1,620,564",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6886.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Sterling Brown",
    "salary": "$1,620,564",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23647.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Jae’Sean Tate",
    "salary": "$1,445,697",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70758.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Kenyon Martin Jr.",
    "salary": "$898,310",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70694.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Brodric Thomas",
    "salary": "-",
    "position": "Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70795.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Houston Rockets",
    "name": "Mason Jones",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Gorgui Dieng",
    "salary": "$17,287,640",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13334.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Jonas Valanciunas",
    "salary": "$15,000,000",
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
    "name": "Dillon Brooks",
    "salary": "$11,400,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23646.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "De'Anthony Melton",
    "salary": "$9,571,712",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27012.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Kyle Anderson",
    "salary": "$9,505,100",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/15382.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Ja Morant",
    "salary": "$9,166,800",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31559.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Tyus Jones",
    "salary": "$8,817,143",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17852.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Jaren Jackson Jr.",
    "salary": "$7,257,360",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26970.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Brandon Clarke",
    "salary": "$2,602,920",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31578.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Grayson Allen",
    "salary": "$2,545,320",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26987.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "John Konchar",
    "salary": "$2,100,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/32170.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Desmond Bane",
    "salary": "$1,936,440",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70672.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Jontay Porter",
    "salary": "$1,900,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/47359.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Xavier Tillman",
    "salary": "$1,300,000",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70677.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Sean McDermott",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70715.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "Memphis Grizzlies",
    "name": "Killian Tillie",
    "salary": "-",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2020",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Steven Adams",
    "salary": "$27,528,088",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/13325.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Brandon Ingram",
    "salary": "$27,285,000",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20207.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2025",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Eric Bledsoe",
    "salary": "$16,875,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6900.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "J.J. Redick",
    "salary": "$13,013,700",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/2643.png",
    "signed_using": "Cap Space",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Lonzo Ball",
    "salary": "$11,003,782",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23597.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Zion Williamson",
    "salary": "$10,245,480",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31558.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Jaxson Hayes",
    "salary": "$5,105,160",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31565.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Nicolo Melli",
    "salary": "$3,897,436",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31886.png",
    "signed_using": "Room",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Kira Lewis Jr.",
    "salary": "$3,640,200",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70655.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Josh Hart",
    "salary": "$3,491,159",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23625.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Nickeil Alexander-Walker",
    "salary": "$3,113,160",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31574.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Willy Hernangomez",
    "salary": "$1,620,564",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/17863.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Sindarius Thornwell",
    "salary": "$1,620,564",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23649.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Wenyen Gabriel",
    "salary": "$1,620,564",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27806.png",
    "signed_using": "Minimum",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Naji Marshall",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70704.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Will Magnay",
    "salary": "-",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/default-person.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "New Orleans Pelicans",
    "name": "Frank Jackson",
    "salary": "-",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23626.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
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
    "salary": "$24,000,000",
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
    "name": "Dejounte Murray",
    "salary": "$14,286,000",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20234.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Patrick Mills",
    "salary": "$13,535,714",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/6322.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Jakob Poeltl",
    "salary": "$8,101,852",
    "position": "Center",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/20214.png",
    "signed_using": "Bird",
    "final_year_of_contract": "2023",
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
    "name": "Devin Vassell",
    "salary": "$4,033,440",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70653.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2024",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Derrick White",
    "salary": "$3,516,284",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/23624.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "0202",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Lonnie Walker IV",
    "salary": "$2,892,000",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/26984.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2022",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Luka Samanic",
    "salary": "$2,824,320",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31576.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Keldon Johnson",
    "salary": "$2,048,040",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31588.png",
    "signed_using": "Rookie",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Drew Eubanks",
    "salary": "$1,620,564",
    "position": "Power Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/28052.png",
    "signed_using": "Early Bird",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Tre Jones",
    "salary": "$898,310",
    "position": "Point Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/70683.png",
    "signed_using": "MLE",
    "final_year_of_contract": "2023",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Keita Bates-Diop",
    "salary": "-",
    "position": "Small Forward",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/27014.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
    "trade_clause": false
  },
  {
    "team": "San Antonio Spurs",
    "name": "Quinndary Weatherspoon",
    "salary": "-",
    "position": "Shooting Guard",
    "player_image": "https://d1dglpr230r57l.cloudfront.net/headshots/nba/31608.png",
    "signed_using": "",
    "final_year_of_contract": "2021",
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

    not_players = laker_players.select do |player| 
        player[:salary] == ""
    end
    actual_players = laker_players.select do |player| 
        !not_players.include? player
    end

    actual_players.each do |player|
        name = player[:name]
        team_id = Team.all.select{|team| team.name == player[:team]}[0]
        salary = player[:salary]
        position = player[:position]
        player_image = player[:player_image]
        signed_using = player[:signed_using]
        final_year_of_contract = player[:final_year_of_contract]
        trade_clause = player[:trade_clause]
        Player.create(name: name, team: team_id, salary: salary, position: position, player_image: player_image, signed_using: signed_using, final_year_of_contract: final_year_of_contract, trade_clause: trade_clause)
    end

    # user = User.create(name: "sean", team: "Detroit Pistons", password: "123")
    # user1 = User.create(name: "test", team: "Boston Celtics", password: "123")