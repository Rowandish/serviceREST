json.name building.static_building.name
json.level building.level
json.created_at building.created_at.to_s
if building.finished_at
	json.finished_at building.finished_at.to_s
	json.time_to_complete Time.diff(Time.now,building.finished_at)
else
	json.finished_at "completed"
end
json.rank building.static_building.rank
json.max_monster building.static_building.max_monsters
json.max_level building.static_building.max_level
json.speed building.static_building.speed
