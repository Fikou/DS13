/obj/effect/decal
	plane = ABOVE_TURF_PLANE
	layer = DECAL_LAYER
	anchored = TRUE	//Why was this not set true


/obj/effect/decal/fall_damage()
	return 0

/obj/effect/decal/is_burnable()
	return TRUE

/obj/effect/decal/lava_act()
	. = !throwing ? ..() : FALSE
