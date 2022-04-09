use <../lib/rounded_box.scad>
use <../lib/mounting_brackets.scad>

width=47;
depth=42;
height=98;
wall_thickness=5;
radius=3;
hole_diameter=4.1;
tab_length=15;
screw_width=3;
$fn=50;

union(){
	difference(){
		rounded_box(depth+wall_thickness*2, width+wall_thickness*2, height+wall_thickness,radius);
		translate([wall_thickness, wall_thickness, wall_thickness])
			cube([depth, width, height]);
	}
	translate([0,width+2*wall_thickness,0])
		mirror([0,1,0])
			translate([0, wall_thickness, height+wall_thickness])
				rotate([0, 90, 0])
					rotate([0,0, 180])
						screw_tab_with_strut(hole_diameter, screw_width, wall_thickness, tab_length);

	translate([0, wall_thickness, height+wall_thickness])
		rotate([0, 90, 0])
			rotate([0,0, 180])
				screw_tab_with_strut(hole_diameter, screw_width, wall_thickness, tab_length);

	mirror([0, 0, 1])
		translate([0, wall_thickness, 0])
			rotate([0, 90, 0])
				rotate([0,0,180])
					screw_tab_with_strut(hole_diameter, screw_width, wall_thickness, tab_length);
}
