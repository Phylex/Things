module screw_tab(hole_diameter, screw_tab_width, wall_thickness, tab_length){

    total_diameter = 2*screw_tab_width + hole_diameter;
    tri_length = tab_length - total_diameter/2;

    translate([-total_diameter/2, tab_length, wall_thickness/2])
    rotate([0,0,180])
    union(){
        difference(){
            union(){
                cylinder(d=total_diameter, h=wall_thickness, center=true);
                translate([0, tab_length/2, 0])
                    cube([total_diameter, tab_length, wall_thickness], center=true);
            }
            cylinder(d=hole_diameter, h=wall_thickness+1, center=true);
        }
        translate([0, tab_length-(wall_thickness/2), (tab_length/2)-(wall_thickness/2)])
            rotate([90,0,0])
                cube([total_diameter, tab_length, wall_thickness], center=true);
        translate([wall_thickness/2, total_diameter/2, wall_thickness/2])
            rotate([0,-90,0])
                linear_extrude(wall_thickness)
                    polygon([[0,0],[0,tri_length],[tri_length,tri_length]]);
    }
}

module screw_tab_with_strut(hole_diameter, screw_tab_width, wall_thickness, tab_length){
	union(){
		triangle_offset = -(hole_diameter + 2*screw_tab_width + tab_length);

		screw_tab(hole_diameter, screw_tab_width, wall_thickness, tab_length);
		translate([triangle_offset, 0, 0])
		linear_extrude(wall_thickness)
			polygon([[0,0],[tab_length,0],[tab_length, tab_length]]);
	}
}
