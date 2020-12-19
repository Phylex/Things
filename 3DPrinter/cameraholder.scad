slot_width = 26.5;
slot_length= 24;
slot_height = 5;
overhang = 5;
wall_thickness = 1;

total_width = slot_width + 2 * wall_thickness;
total_length = slot_length + wall_thickness;
total_height = slot_height + 2 * wall_thickness;

$fn = 30;
union(){
	translate([0,0,slot_length-wall_thickness])
		translate([wall_thickness, slot_height+2*wall_thickness, slot_height+2*wall_thickness])
			rotate([180, 0, 0])difference(){
				union(){
					translate([-wall_thickness, 0, 0])cube([wall_thickness, slot_height+2*wall_thickness, slot_height+2*wall_thickness]);
					translate([-wall_thickness, (slot_height+2*wall_thickness)/2, 0])rotate([0, 90, 0])cylinder(r=(slot_height+2*wall_thickness)/2, h=wall_thickness);
				}
				translate([-wall_thickness, (slot_height+2*wall_thickness)/2, 0])rotate([0,90,0])cylinder(r=2, h=wall_thickness);
			}
	translate([0, 0, slot_length+wall_thickness])rotate([-90, 0, 0])difference(){
	    cube(size = [total_width, total_length, total_height], center = false);
	    union(){
	        translate([wall_thickness, 0, wall_thickness])
	            cube(size = [slot_width, slot_length, slot_height], center = false);
	        translate([overhang, 0, slot_height + wall_thickness])
	        	cube(size = [total_width - 2 * overhang, slot_length - overhang, wall_thickness], center = false);
	    }
	}
}
