/obj/machinery/bluespace_beacon

	icon = 'icons/obj/objects.dmi'
	icon_state = "floor_beaconf"
	name = "Bluespace Gigabeacon"
	desc = "A device that draws power from bluespace and creates a permanent tracking beacon."
	level = 1		// underfloor
	anchored = 1
	use_power = 1
	idle_power_usage = 0
	var/obj/item/radio/beacon/Beacon

	New()
		..()
		var/turf/T = loc
		Beacon = new /obj/item/radio/beacon(T)
		Beacon.invisibility = INVISIBILITY_MAXIMUM

		hide(!T.is_plating())

	Destroy()
		QDEL_NULL(Beacon)
		. = ..()

	// update the invisibility and icon
	hide(var/intact)
		set_invisibility(intact ? 101 : 0)
		update_icon()

	// update the icon_state
	update_icon()
		var/state="floor_beacon"

		if(invisibility)
			icon_state = "[state]f"

		else
			icon_state = "[state]"

	Process()
		if(!Beacon)
			var/turf/T = loc
			Beacon = new /obj/item/radio/beacon
			Beacon.set_invisibility(INVISIBILITY_MAXIMUM)
			Beacon.forceMove(T)
		if(Beacon)
			if(Beacon.loc != loc)
				Beacon.forceMove(loc)

		update_icon()


