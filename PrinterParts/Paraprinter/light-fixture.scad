use <../lib/mounting_brackets.scad>
//constants that define the general properties
fixture_width = 34;
fixture_height = 30;
fixture_slot_height = 3.5;
hold_tab_width = 2;

screw_hole_diameter = 4.3;
tab_length = 10;
thickness = 2;
$fn = 25;

rotate([-90,0,0])
	union(){
		translate([(fixture_width+2*thickness)/2-screw_hole_diameter/2-3, 0, thickness])
			rotate([0, 180, 0])
				rotate([90, 0, 0])
					screw_tab(screw_hole_diameter, 3, thickness, tab_length);
		translate([thickness, -fixture_height-thickness, 0])
		{
			theight = 2*thickness+fixture_slot_height;
			cube([fixture_width, fixture_height, thickness]);
			translate([-thickness, 0, 0])
				cube([thickness, fixture_height, theight]);
			translate([fixture_width, 0, 0])
				cube([thickness, fixture_height, theight]);
			translate([-thickness, fixture_height, 0])
				cube([fixture_width+2*thickness, thickness, 2*thickness+fixture_slot_height]);
			translate([0, 0, theight-thickness]){
				translate([-thickness, 0, 0])
					cube([thickness+hold_tab_width, fixture_height, thickness]);
				translate([fixture_width-hold_tab_width, 0, 0])
					cube([thickness+hold_tab_width, fixture_height, thickness]);
			}
		}
	}
