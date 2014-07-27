StaticBuilding.bulk_insert(YAML.load_file(Rails.root.join("config","data","static_buildings.yml")))
StaticMonster.bulk_insert(YAML.load_file(Rails.root.join("config","data","static_monsters.yml")))