json.buildings @buildings do |building|
	json.name = building.static_building.name
	json.level = building.level
	json.created_at = building.created_at
	json.rank = building.static_building.rank
	json.max_monster = building.static_building.max_monsters
	json.max_level = building.static_building.max_level
	json.speed = building.static_building.speed
end