# PATCH: ADD LINES HERE
	if DLC.mods_by_id.xy_b2flee.setting_b2flee_mod_status:
		if event.is_action_pressed("ui_cancel"):
			get_node("../FleeButton").grab_focus()
			get_node("../FleeButton").emit_signal("pressed")
			get_tree().set_input_as_handled()
# PATCH: STOP
