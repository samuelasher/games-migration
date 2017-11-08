connection: "video_games"
include: "*.view.lkml"
include: "*.dashboard.lkml"
persist_for: "99999 hours"

#Test 1: Select Console name and Console Count. Drill into console count. Why the discrepancy?

explore: games {
  sql_always_where: NOT ${is_virtual_console} ;;
  join: consoles {
    relationship: one_to_one
    sql_on: ${games.console} = ${consoles.name} ;;
    type: left_outer
  }
}
explore: consoles {}
