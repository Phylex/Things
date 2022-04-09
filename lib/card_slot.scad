module card_slot_with_endstop(width, height, thickness, slot_height, slot_depth){
	union(){
		translate([thickness, -fixture_height-thickness, 0])
		{
			theight = 2*thickness+slot_height;
			cube([width, height, thickness]);
			translate([-thickness, 0, 0])
				cube([thickness, height, theight]);
			translate([width, 0, 0])
				cube([thickness, height, theight]);
			translate([-thickness, height, 0])
				cube([width+2*thickness, thickness, 2*thickness+slot_height]);
			translate([0, 0, theight-thickness]){
				translate([-thickness, 0, 0])
					cube([thickness+slot_depth, height, thickness]);
				translate([width-slot_depth, 0, 0])
					cube([thickness+slot_depth, height, thickness]);
			}
		}
	}
}
