connection: "video_games"
include: "gauntlet_*.view.lkml"
include: "*.dashboard.lkml"
persist_for: "99999 hours"

#Test 1: Select Console name and Console Count. Drill into console count. Why the discrepancy?
#Test 2: LookML error
#Test 3: empty explore??

explore: gauntlet_games {
  sql_always_where: NOT ${is_virtual_console} ;;
  join: gauntlet_consoles {
    relationship: one_to_one
    sql: ${gauntlet_games.console} = ${gauntlet_consoles.name} ;;
    type: left_outer
  }
}

explore: gauntlet_consoles {}
