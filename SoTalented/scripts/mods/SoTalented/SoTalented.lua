local mod = get_mod("SoTalented")

local function force_update_talent_ids()
	TalentIDLookup = {}
	for _, hero_talents in pairs(Talents) do
		for id, data in ipairs(hero_talents) do
			local talent_name = data.name

			fassert(not TalentIDLookup[talent_name], "talent with unique name %s already exists", talent_name)

			TalentIDLookup[data.name] = id
		end
	end
end

local function add_allrow_talents()
	mod:dofile("scripts/managers/talents/talent_settings")
	
	-- The way this part of the mod works is by creating a new talent for each class
	-- which contains the buffs of all the other talents (only some talents provide buffs)
	-- and making it the "4th option" of the 5th row of talents; then, when the game checks
	-- for talent IDs, instead of actually making it based on the picked talents, it just 
	-- gives the "4th option" (i.e. all the buffs)
	--[[
		888888ba                    .8888b 
		88    `8b                   88    
		88     88 .d8888b. 88d888b. 88aaa  
		88     88 88'  `88 88'  `88 88     
		88    .8P 88.  .88 88       88     
		8888888P  `88888P' dP       dP     
	--]]
	table.insert(Talents.dwarf_ranger,
		{
			description = "bardin_ironbreaker_sotalented",
			name = "bardin_ironbreaker_sotalented",
			num_ranks = 1,
			icon = "bardin_ironbreaker_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"bardin_ironbreaker_vanguard",
				"bardin_ironbreaker_bloodlust",
				"bardin_ironbreaker_conqueror",
				"bardin_ironbreaker_power_on_nearby_allies",
				"bardin_ironbreaker_increased_overcharge",
				"bardin_ironbreaker_increased_ranged_power",
				"bardin_ironbreaker_power_on_blocked_attacks_add",
				"bardin_ironbreaker_power_on_blocked_attacks_remove_damage",
				"bardin_ironbreaker_power_on_blocked_attacks_remove_stagger",
				"bardin_ironbreaker_stamina_regen_during_gromril",
				"bardin_ironbreaker_gromril_stagger",
				"bardin_ironbreaker_regen_stamina_on_charged_attacks",
				"bardin_ironbreaker_regen_stamina_on_block_broken",
				"bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
				"tank_unbalance",
				"smiter_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.dwarf_ranger,
		{
			description = "bardin_slayer_sotalented",
			name = "bardin_slayer_sotalented",
			num_ranks = 1,
			icon = "bardin_slayer_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"bardin_slayer_reaper",
				"bardin_slayer_bloodlust",
				"bardin_slayer_conqueror",
				"bardin_slayer_crit_chance",
				"bardin_slayer_power_on_double_two_handed_weapons",
				"bardin_slayer_attack_speed_on_double_one_handed_weapons",
				"bardin_slayer_damage_taken_capped",
				"bardin_slayer_damage_reduction_on_melee_charge_action",
				"bardin_slayer_push_on_dodge",
				"bardin_slayer_activated_ability_leap_damage_add",
				"bardin_slayer_activated_ability_leap_damage_remove",
				"smiter_unbalance",
				"linesman_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.dwarf_ranger,
		{
			description = "bardin_ranger_sotalented",
			name = "bardin_ranger_sotalented",
			num_ranks = 1,
			icon = "bardin_ranger_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"bardin_ranger_vanguard",
				"bardin_ranger_reaper",
				"bardin_ranger_conqueror",
				"bardin_ranger_increased_melee_damage_on_no_ammo_add",
				"bardin_ranger_increased_melee_damage_on_no_ammo_remove",
				"bardin_ranger_cooldown_on_reload",
				"bardin_ranger_attack_speed",
				"bardin_ranger_passive_ammo_on_ally_pickup",
				"bardin_ranger_movement_speed",
				"bardin_ranger_reduced_damage_taken_headshot",
				"bardin_ranger_reload_speed_on_multi_hit_add",
				"bardin_ranger_ability_free_grenade_remove",
				"tank_unbalance",
				"linesman_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(TalentTrees.dwarf_ranger[1][5], "bardin_ironbreaker_sotalented")
	table.insert(TalentTrees.dwarf_ranger[2][5], "bardin_slayer_sotalented")
	table.insert(TalentTrees.dwarf_ranger[3][5], "bardin_ranger_sotalented")
	
	--[[
		dP   dP   dP          dP .8888b 
		88   88   88          88 88    
		88  .8P  .8P .d8888b. 88 88aaa  
		88  d8'  d8' 88ooood8 88 88     
		88.d8P8.d8P  88.  ... 88 88     
		8888' Y88'   `88888P' dP dP     
	--]]
	table.insert(Talents.wood_elf,
		{
			description = "kerillian_shade_sotalented",
			name = "kerillian_shade_sotalented",
			num_ranks = 1,
			icon = "kerillian_shade_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"kerillian_shade_regrowth",
				"kerillian_shade_bloodlust",
				"kerillian_shade_conqueror",
				"kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy",
				"kerillian_shade_increased_critical_strike_damage",
				"kerillian_shade_stacking_headshot_damage_on_headshot",
				"kerillian_shade_passive_improved",
				"kerillian_shade_passive_stealth_on_backstab_kill",
				"kerillian_shade_backstabs_replenishes_ammunition",
				"kerillian_shade_movement_speed",
				"kerillian_shade_movement_speed_on_critical_hit",
				"kerillian_shade_damage_reduction_on_critical_hit",
				"kerillian_shade_activated_ability_quick_cooldown_buff",
				"smiter_unbalance",
				"finesse_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.wood_elf,
		{
			description = "kerillian_maidenguard_sotalented",
			name = "kerillian_maidenguard_sotalented",
			num_ranks = 1,
			icon = "kerillian_maidenguard_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"kerillian_maidenguard_reaper",
				"kerillian_maidenguard_bloodlust",
				"kerillian_maidenguard_conqueror",
				"kerillian_maidenguard_power_level_on_unharmed",
				"kerillian_maidenguard_crit_chance",
				"kerillian_maidenguard_cooldown_on_nearby_allies",
				"kerillian_maidenguard_passive_attack_speed_on_dodge",
				"kerillian_maidenguard_improved_dodge",
				"kerillian_maidenguard_improved_dodge_speed",
				"kerillian_maidenguard_passive_noclip_dodge_start",
				"kerillian_maidenguard_passive_noclip_dodge_end",
				"kerillian_maidenguard_max_ammo",
				"kerillian_maidenguard_max_health",
				"kerillian_maidenguard_block_cost",
				"kerillian_maidenguard_activated_ability_buff_on_enemy_hit",
				"smiter_unbalance",
				"linesman_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.wood_elf,
		{
			description = "kerillian_waywatcher_sotalented",
			name = "kerillian_waywatcher_sotalented",
			num_ranks = 1,
			icon = "kerillian_waywatcher_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"kerillian_waywatcher_regrowth",
				"kerillian_waywatcher_reaper",
				"kerillian_waywatcher_conqueror",
				"kerillian_waywatcher_extra_arrow_melee_kill",
				"kerillian_waywatcher_critical_bleed",
				"kerillian_waywatcher_attack_speed_on_ranged_headshot",
				"kerillian_waywatcher_movement_speed_on_special_kill",
				"kerillian_waywatcher_activated_ability_cooldown",
				"kerillian_waywatcher_projectile_ricochet",
				"kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill",
				"kerillian_waywatcher_activated_ability_piercing_shot",
				"linesman_unbalance",
				"finesse_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(TalentTrees.wood_elf[1][5], "kerillian_shade_sotalented")
	table.insert(TalentTrees.wood_elf[2][5], "kerillian_maidenguard_sotalented")
	table.insert(TalentTrees.wood_elf[3][5], "kerillian_waywatcher_sotalented")
	
	--[[
		888888ba           oo 
		88    `8b             
		88aaaa8P' .d8888b. dP 
		88   `8b. 88'  `88 88 
		88    .88 88.  .88 88 
		88888888P `88888P' dP 
	--]]
	table.insert(Talents.empire_soldier,
		{
			description = "markus_huntsman_sotalented",
			name = "markus_huntsman_sotalented",
			num_ranks = 1,
			icon = "markus_huntsman_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"markus_huntsman_vanguard",
				"markus_huntsman_bloodlust",
				"markus_huntsman_conqueror",
				"markus_huntsman_increased_damage_to_wounded_enemies",
				"markus_huntsman_debuff_defence_on_crit",
				"markus_huntsman_headshot_damage",
				"markus_huntsman_headshots_increase_reload_speed",
				"markus_huntsman_passive_temp_health_on_headshot",
				"markus_huntsman_movement_speed",
				"markus_huntsman_damage_reduction_on_monster_kill",
				"markus_huntsman_damage_reduction_on_monster_kill_passive",
				"markus_huntsman_ammo_on_special_kill",
				"markus_huntsman_activated_ability_cooldown",
				"tank_unbalance",
				"smiter_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.empire_soldier,
		{
			description = "markus_knight_sotalented",
			name = "markus_knight_sotalented",
			num_ranks = 1,
			icon = "markus_knight_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"markus_knight_reaper",
				"markus_knight_vanguard",
				"markus_knight_conqueror",
				"markus_knight_power_level_impact",
				"markus_knight_power_level_on_stagger_elite",
				"markus_knight_attack_speed_on_push",
				"markus_knight_improved_passive_defence_aura",
				"markus_knight_passive_block_cost_aura",
				"markus_knight_passive_power_increase_buff",
				"markus_knight_movement_speed_on_incapacitated_allies",
				"markus_knight_free_pushes_on_block",
				"markus_knight_damage_taken_ally_proximity",
				"markus_knight_ability_hit_target_damage_taken_blast",
				"markus_knight_ability_hit_target_damage_taken_charge",
				"markus_knight_ability_attack_speed_enemy_hit_blast",
				"markus_knight_ability_attack_speed_enemy_hit_charge",
				"tank_unbalance",
				"linesman_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.empire_soldier,
		{
			description = "markus_mercenary_sotalented",
			name = "markus_mercenary_sotalented",
			num_ranks = 1,
			icon = "markus_mercenary_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"markus_mercenary_reaper",
				"markus_mercenary_bloodlust",
				"markus_mercenary_conqueror",
				"markus_mercenary_increased_damage_on_enemy_proximity",
				"markus_mercenary_power_level_cleave",
				"markus_mercenary_crit_count",
				"markus_mercenary_dodge_range",
				"markus_mercenary_dodge_speed",
				"markus_mercenary_max_ammo",
				"markus_mercenary_activated_ability_cooldown_no_heal",
				"linesman_unbalance",
				"smiter_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(TalentTrees.empire_soldier[1][5], "markus_huntsman_sotalented")
	table.insert(TalentTrees.empire_soldier[2][5], "markus_knight_sotalented")
	table.insert(TalentTrees.empire_soldier[3][5], "markus_mercenary_sotalented")
	
	--[[
		dP   dP   dP oo                                                    dP 
		88   88   88                                                       88 
		88  .8P  .8P dP d888888b d888888b d888888b .d8888b. 88d888b. .d888b88 
		88  d8'  d8' 88    .d8P'    .d8P'    .d8P' 88'  `88 88'  `88 88'  `88 
		88.d8P8.d8P  88  .Y8P     .Y8P     .Y8P    88.  .88 88       88.  .88 
		8888' Y88'   dP d888888P d888888P d888888P `88888P8 dP       `88888P8 
	--]]
	table.insert(Talents.bright_wizard,
		{
			description = "sienna_scholar_sotalented",
			name = "sienna_scholar_sotalented",
			num_ranks = 1,
			icon = "sienna_scholar_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"sienna_scholar_reaper",
				"sienna_scholar_bloodlust",
				"sienna_scholar_conqueror",
				"sienna_scholar_increased_attack_speed",
				"sienna_scholar_crit_chance_above_health_threshold",
				"sienna_scholar_ranged_power_ascending_descending",
				"sienna_scholar_passive_increased_attack_speed_from_overcharge",
				"sienna_scholar_passive_increased_power_level_on_high_overcharge",
				"sienna_scholar_passive_overcharge_pause_on_special_kill",
				"sienna_scholar_damage_taken_on_elite_or_special_kill",
				"sienna_scholar_overcharge_no_slow",
				"sienna_scholar_move_speed_on_critical_hit",
				"sienna_scholar_activated_ability_crit_refresh_cooldown",
				"smiter_unbalance",
				"linesman_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.bright_wizard,
		{
			description = "sienna_adept_sotalented",
			name = "sienna_adept_sotalented",
			num_ranks = 1,
			icon = "sienna_adept_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"sienna_adept_vanguard",
				"sienna_adept_bloodlust",
				"sienna_adept_conqueror",
				"sienna_adept_power_level_on_full_charge",
				"sienna_adept_attack_speed_on_enemies_hit",
				"sienna_adept_passive_charge_speed_increased",
				"sienna_adept_passive_improved",
				"sienna_adept_damage_reduction_on_ignited_enemy",
				"sienna_adept_cooldown_reduction_on_burning_enemy_killed",
				"sienna_adept_increased_burn_damage",
				"sienna_adept_reduced_non_burn_damage",
				"tank_unbalance",
				"smiter_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.bright_wizard,
		{
			description = "sienna_unchained_sotalented",
			name = "sienna_unchained_sotalented",
			num_ranks = 1,
			icon = "sienna_unchained_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"sienna_unchained_vanguard",
				"sienna_unchained_reaper",
				"sienna_unchained_conqueror",
				"sienna_unchained_attack_speed_on_high_overcharge",
				"sienna_unchained_burn_push",
				"sienna_unchained_passive_overcharged_blocks",
				"sienna_unchained_increased_vent_speed",
				"sienna_unchained_reduced_vent_damage",
				"sienna_unchained_reduced_damage_taken_after_venting",
				"sienna_unchained_vent_overheat_on_low_health_cooldown",
				"sienna_unchained_reduced_overcharge",
				"sienna_unchained_activated_ability_power_on_enemies_hit",
				"tank_unbalance",
				"linesman_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(TalentTrees.bright_wizard[1][5], "sienna_scholar_sotalented")
	table.insert(TalentTrees.bright_wizard[2][5], "sienna_adept_sotalented")
	table.insert(TalentTrees.bright_wizard[3][5], "sienna_unchained_sotalented")
	
	--[[
		.d88888b           dP   dP   dP                                dP 
		88.     '          88   88   88                                88 
		`Y88888b. .d8888b. 88 d8888P 88        .d8888b. 88d888b. .d888b88 
			  `8b 88'  `88 88   88   88        88'  `88 88'  `88 88'  `88 
		d8'   .8P 88.  .88 88   88   88        88.  .88 88       88.  .88 
		 Y88888P  `88888P8 dP   dP   88888888P `88888P' dP       `88888P8
	--]]
	table.insert(Talents.witch_hunter,
		{
			description = "victor_zealot_sotalented",
			name = "victor_zealot_sotalented",
			num_ranks = 1,
			icon = "victor_zealot_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"victor_zealot_reaper",
				"victor_zealot_bloodlust",
				"victor_zealot_conqueror",
				"victor_zealot_crit_count",
				"victor_zealot_power",
				"victor_zealot_attack_speed_on_health_percent",
				"victor_zealot_passive_move_speed",
				"victor_zealot_passive_healing_received",
				"victor_zealot_passive_damage_taken",
				"victor_zealot_move_speed_on_damage_taken",
				"victor_zealot_max_stamina_on_damage_taken",
				"victor_zealot_reduced_damage_taken_buff",
				"smiter_unbalance",
				"linesman_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.witch_hunter,
		{
			description = "victor_bountyhunter_sotalented",
			name = "victor_bountyhunter_sotalented",
			num_ranks = 1,
			icon = "victor_bountyhunter_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"victor_bountyhunter_regrowth",
				"victor_bountyhunter_bloodlust",
				"victor_bountyhunter_conqueror",
				"victor_bountyhunter_increased_melee_damage_on_no_ammo_add",
				"victor_bountyhunter_increased_melee_damage_on_no_ammo_remove",
				"victor_bountyhunter_debuff_defence_on_crit",
				"victor_bountyhunter_power_level_on_clip_size",
				"victor_bountyhunter_activate_passive_on_melee_kill",
				"victor_bountyhunter_passive_infinite_ammo",
				"victor_bountyhunter_movespeed_on_ranged_crit",
				"victor_bountyhunter_restore_ammo_on_elite_kill",
				"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
				"victor_bountyhunter_activated_ability_railgun",
				"victor_bountyhunter_activated_ability_shotgun",
				"victor_bountyhunter_activated_ability_passive_cooldown_reduction",
				"smiter_unbalance",
				"finesse_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(Talents.witch_hunter,
		{
			description = "victor_witchhunter_sotalented",
			name = "victor_witchhunter_sotalented",
			num_ranks = 1,
			icon = "victor_witchhunter_regrowth",
			description_values = {},
			requirements = {},
			buffs = {
				"victor_witchhunter_regrowth",
				"victor_witchhunter_reaper",
				"victor_witchhunter_conqueror",
				"victor_witchhunter_headshot_damage_increase",
				"victor_witchhunter_bleed_on_critical_hit",
				"victor_witchhunter_guaranteed_crit_on_timed_block_add",
				"victor_witchhunter_critical_hit_chance_on_ping_target_killed",
				"victor_witchhunter_attack_speed_on_enemy_pinged",
				"victor_witchhunter_max_ammo",
				"victor_witchhunter_stamina_regen_on_push",
				"victor_witchhunter_dodge_range",
				"victor_witchhunter_dodge_speed",
				"victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
				"linesman_unbalance",
				"finesse_unbalance",
				"power_level_unbalance"
			},
			buff_data = {}
		})
	table.insert(TalentTrees.witch_hunter[1][5], "victor_zealot_sotalented")
	table.insert(TalentTrees.witch_hunter[2][5], "victor_bountyhunter_sotalented")
	table.insert(TalentTrees.witch_hunter[3][5], "victor_witchhunter_sotalented")
	
	force_update_talent_ids()
end

local function remove_allrow_talents()
	table.remove(TalentTrees.dwarf_ranger[1][5])
	table.remove(TalentTrees.dwarf_ranger[2][5])
	table.remove(TalentTrees.dwarf_ranger[3][5])
	table.remove(Talents.dwarf_ranger)
	table.remove(Talents.dwarf_ranger)
	table.remove(Talents.dwarf_ranger)
	table.remove(TalentTrees.wood_elf[1][5])
	table.remove(TalentTrees.wood_elf[2][5])
	table.remove(TalentTrees.wood_elf[3][5])
	table.remove(Talents.wood_elf)
	table.remove(Talents.wood_elf)
	table.remove(Talents.wood_elf)
	table.remove(TalentTrees.empire_soldier[1][5])
	table.remove(TalentTrees.empire_soldier[2][5])
	table.remove(TalentTrees.empire_soldier[3][5])
	table.remove(Talents.empire_soldier)
	table.remove(Talents.empire_soldier)
	table.remove(Talents.empire_soldier)
	table.remove(TalentTrees.bright_wizard[1][5])
	table.remove(TalentTrees.bright_wizard[2][5])
	table.remove(TalentTrees.bright_wizard[3][5])
	table.remove(Talents.bright_wizard)
	table.remove(Talents.bright_wizard)
	table.remove(Talents.bright_wizard)
	table.remove(TalentTrees.witch_hunter[1][5])
	table.remove(TalentTrees.witch_hunter[2][5])
	table.remove(TalentTrees.witch_hunter[3][5])
	table.remove(Talents.witch_hunter)
	table.remove(Talents.witch_hunter)
	table.remove(Talents.witch_hunter)
end

--[[
	Hooks
--]]

mod:hook(TalentExtension, "_get_talent_ids", function (func, self)
	local talent_ids = func(self)    
	
	local career_settings = self.career_extension:career_settings()
	local talent_tree_index = career_settings.talent_tree_index

	table.clear(talent_ids)
	
	if talent_tree_index then
		local talent_tree = TalentTrees[self._hero_name][talent_tree_index]
		
		talent_ids = {0, 0, 0, 0, 0}
		
		-- As mentioned above, the "4th option" of the 5th row
		-- of talents is a talent with all the class talent buffs
		local talent_name = talent_tree[5][4]
		if (not talent_name) then
			talent_name = "|SoTalented|"
		end
		if TalentIDLookup[talent_name] then
			talent_ids[1] = TalentIDLookup[talent_name]
		else
			talent_ids[1] = 0
			mod:echo("Warning! Couldn't find talent: " .. talent_name)
		end
		
		return talent_ids
	end
	return talent_ids
end)

-- Some talent functionality comes from a has_talent check;
-- unless it's a talent that I want to scan for, just return true.
-- We have all the talents!
mod:hook(TalentExtension, "has_talent", function (func, self, talent_name)
	local has = func(self, talent_name) -- Run it, just in case other mods are hooked to it
	if talent_name == "victor_bountyhunter_activated_ability_shotgun" or
	   talent_name == "victor_bountyhunter_activated_ability_railgun" or
	   talent_name == "kerillian_waywatcher_activated_ability_piercing_shot" then
		return has
	else
		return true
	end
end)

-- Move to the left/right to prevent a stack of items
-- Move randomly forward/backward so it isn't just a perfect line of loot
local random_scatter = function()
	return 0.2 * Vector3.right() + 0.2 * (math.random() - 0.5) * Vector3.forward()
end

-- Override Ranger Veteran's scavenge
local sotalented_scavenge_proc_func = function (player, buff, params)
	if not Managers.state.network.is_server then
		return
	end

	local player_unit = player.player_unit
	local killed_unit = params[3]

	if Unit.alive(player_unit) then
		local drop_chance = buff.template.drop_chance
		local talent_extension = ScriptUnit.extension(player_unit, "talent_system")
		local result = math.random(1, 100)

		if result < drop_chance * 100 then
			local scav_style = mod:get("scav_style")
			local enemy_pos = POSITION_LOOKUP[killed_unit] + Vector3.up() * 0.25
			local raycast_down = true
			local pickup_system = Managers.state.entity:system("pickup_system")
			
			local pot_chance = mod:get("scav_pot_chance")
			
			local grenade_chance = mod:get("scav_gren_chance")
			local grenade_drop = math.random() <= grenade_chance
			if grenade_drop then
				local drop_pos = enemy_pos - random_scatter()
				pickup_system:buff_spawn_pickup("frag_grenade_t1", drop_pos, raycast_down)
			else
				if scav_style == 0 then
					pot_chance = pot_chance / (1 - grenade_chance)
				end
			end
			
			local pot_drop = math.random() <= pot_chance
			if pot_drop then
				local potion_result = math.random(1, 3)
				local drop_pos = enemy_pos + random_scatter()

				if potion_result == 1 then
					pickup_system:buff_spawn_pickup("damage_boost_potion", drop_pos, raycast_down)
				elseif potion_result == 2 then
					pickup_system:buff_spawn_pickup("speed_boost_potion", drop_pos, raycast_down)
				elseif potion_result == 3 then
					pickup_system:buff_spawn_pickup("cooldown_reduction_potion", drop_pos, raycast_down)
				end
			end
			
			if scav_style == 2 or not grenade_drop and not pot_drop then
				pickup_system:buff_spawn_pickup("ammo_ranger_improved", enemy_pos, raycast_down)
			end
		end
	end
end

mod:hook_origin(BuffExtension, "trigger_procs", function (self, event, ...)
	local event_buffs = self._event_buffs[event]
	local num_event_buffs = table.size(event_buffs)

	if num_event_buffs == 0 then
		return
	end

	local player = Managers.player:owner(self._unit)
	local num_args = select("#", ...)
	local params = FrameTable.alloc_table()
	local event_buffs_to_remove = FrameTable.alloc_table()

	for i = 1, num_args, 1 do
		local arg = select(i, ...)
		params[#params + 1] = arg
	end

	for index, buff in pairs(event_buffs) do
		local proc_chance = buff.proc_chance or 1

		if math.random() <= proc_chance then
			local buff_func = buff.buff_func
			-- if buff == TalentBuffTemplates.dwarf_ranger.bardin_ranger_passive.buffs[1] then -- doesn't work
			-- if buff_func == ProcFunctions.bardin_ranger_scavenge_proc then -- doesn't work
			-- Couldn't find a better check, resorted to a hack :(
			if event == "on_special_killed" then -- This works... but only because this is the only buff for that event
				buff_func = sotalented_scavenge_proc_func
			end
			local success = buff_func(player, buff, params)

			if success and buff.template.remove_on_proc then
				event_buffs_to_remove[#event_buffs_to_remove + 1] = buff
			end
		end
	end

	for i = 1, #event_buffs_to_remove, 1 do
		local buff = event_buffs_to_remove[i]
		local id = buff.id

		self:remove_buff(id)
	end
end)

-- Override Waystalker's healing
mod:hook_origin(BuffFunctionTemplates.functions, "update_kerillian_waywatcher_regen", function (unit, buff, params, world)
	local t = params.t
	local buff_template = buff.template
	local next_heal_tick = buff.next_heal_tick or 0

	if next_heal_tick < t and Unit.alive(unit) then
		local allied_ammo_regen = mod:get("ker_ally_ammo_regen")
		local weapon_slot = "slot_ranged"
		local ammo_bonus_fraction = mod:get("ker_ammo_amt")
		local allied_cd_reduct = mod:get("ker_ally_cd_reduction")
		local cd_reduct_amount = mod:get("ker_cd_reduction")
		
		if not allied_ammo_regen then
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)

			if slot_data then
				local right_unit_1p = slot_data.right_unit_1p
				local left_unit_1p = slot_data.left_unit_1p
				local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
				local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
				local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

				if ammo_extension then
					local ammo_amount = math.max(math.round(ammo_extension:get_max_ammo() * ammo_bonus_fraction), 1)

					ammo_extension:add_ammo_to_reserve(ammo_amount)
				end
			end
		end
		
		if not allied_cd_reduct then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			
			career_extension:reduce_activated_ability_cooldown_percent(cd_reduct_amount)
		end

		if Managers.state.network.is_server then
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")

			if health_extension:is_alive() and not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() then
				local heal_amount = mod:get("ker_hp_amt")
				local regen_cap = mod:get("ker_hp_cap")
				local player_and_bot_units = PLAYER_AND_BOT_UNITS

				for i = 1, #player_and_bot_units, 1 do
					if Unit.alive(player_and_bot_units[i]) then
						local health_extension = ScriptUnit.extension(player_and_bot_units[i], "health_system")
						local status_extension = ScriptUnit.extension(player_and_bot_units[i], "status_system")
						
						if not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() and health_extension:is_alive() then
							if health_extension:current_permanent_health_percent() <= regen_cap then
								DamageUtils.heal_network(player_and_bot_units[i], unit, heal_amount, "career_passive")
							end
							
							if allied_ammo_regen then
								local inventory_extension = ScriptUnit.extension(player_and_bot_units[i], "inventory_system")
								local slot_data = inventory_extension:get_slot_data(weapon_slot)

								if slot_data then
									local right_unit_1p = slot_data.right_unit_1p
									local left_unit_1p = slot_data.left_unit_1p
									local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
									local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
									local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

									if ammo_extension then
										local ammo_amount = math.max(math.round(ammo_extension:get_max_ammo() * ammo_bonus_fraction), 1)

										ammo_extension:add_ammo_to_reserve(ammo_amount)
									end
								end
							end
							
							if allied_cd_reduct then
								local career_extension = ScriptUnit.extension(player_and_bot_units[i], "career_system")
								
								career_extension:reduce_activated_ability_cooldown_percent(cd_reduct_amount)
							end
						end
					end
				end
			end
		end

		buff.next_heal_tick = t + buff_template.time_between_heals
	end
end)

--[[
	Callbacks
--]]

-- Called when all mods are being unloaded
-- exit_game - if true, game will close after unloading
mod.on_unload = function(exit_game)
	if not exit_game then -- No point if the game's about to quit
		remove_allrow_talents()
	end
end

-- Called when the checkbox for this mod is unchecked
-- is_first_call - true if called right after mod initialization
mod.on_disabled = function(is_first_call)
	if not is_first_call then
		remove_allrow_talents()
	end
end

-- Called when the checkbox for this is checked
-- is_first_call - true if called right after mod initialization
mod.on_enabled = function(is_first_call)
	if not is_first_call then
		add_allrow_talents()
	end
end


--[[
	Initialization
--]]

add_allrow_talents()