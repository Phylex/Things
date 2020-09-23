slot_width = 10;
slot_length= 10;
slot_height = 2;
overhang = 3;
wall_thickness = 1;

total_width = slot_width + 2 * wall_thickness;
total_length = slot_length + wall_thickness;
total_height = slot_height + 2 * wall_thickness;

difference(){
    cube(size = [total_width, total_length, total_height], center = false);
    union(){
        translate([wall_thickness, 0, wall_thickness])
            cube(size = [slot_width, slot_length, slot_height], center = false);

        translate([overhang, 0, slot_height + wall_thickness]) 
        cube(size = [total_width - 2 * overhang, slot_length - overhang, wall_thickness], center = false);
    }
}

