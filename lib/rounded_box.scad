//provides a box with rounded edges that firs into the given dimensions
module rounded_box(x,y,z, radius){
    width = y;
	height = z;
	depth = x;
	cwidth = width-2*radius;
    cheight = height-2*radius;
    cdepth = depth-2*radius;
    translate([radius, radius, radius])hull(){
    // first pillar
        cylinder(r=radius, h=cheight);
        sphere(r=radius);
        translate([0, 0, cheight])
            sphere(r=radius);
    
        // second pillar 
        translate([0, cwidth, 0])
            cylinder(r=radius, h=cheight);
        translate([0, cwidth, 0])
            sphere(r=radius);
        translate([0, cwidth, cheight])
            sphere(r=radius);
    
        // third pillar
        translate([cdepth, 0, 0])
            cylinder(r=radius, h=cheight);
        translate([cdepth, 0, 0])
            sphere(r=radius);
        translate([cdepth, 0, cheight])
            sphere(r=radius);
    
        //fourth pillar
        translate([cdepth, cwidth, 0])
            cylinder(r=radius, h=cheight);
        translate([cdepth, cwidth, 0])
            sphere(r=radius);
        translate([cdepth, cwidth, cheight])
            sphere(r=radius);
    }
}
