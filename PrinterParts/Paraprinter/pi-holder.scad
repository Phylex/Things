use <../lib/mounting_brackets.scad>
$fn = 100;

inside_width = 97;
inside_height = 23;
tab_height = 68;
thickness = 2;
inside_depth = 28;
outside_addon = 3;
mounting_hole_diameter = 4.5;

total_width_screw_tab = 2*outside_addon+mounting_hole_diameter;
inside_dimensions = [inside_width, inside_depth, inside_height];
outside_dimensions = inside_dimensions + [2*thickness, 2*thickness, thickness];

mirror([1, 0, 0])
union(){
	translate([thickness, 0, tab_height-total_width_screw_tab])
		rotate([-90, 0, 0])
		rotate([0, 0, 90])
			screw_tab(mounting_hole_diameter, outside_addon, thickness, 6);
	translate([thickness, 0, 0])
		rotate([-90, 0, 0])
		rotate([0, 0, 90])
			screw_tab(mounting_hole_diameter, outside_addon, thickness, 6);
	cube([outside_dimensions[0], thickness, tab_height]);
	difference(){
	cube(outside_dimensions);
	translate([thickness, thickness, thickness])cube(inside_dimensions);
	}
}
