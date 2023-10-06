sma_diameter = 6.5;
wall_thickness = 2;
pad_size = 22;
stand_height = 100;
mount_hole_size = 3.3;
$fn = 50;
translate([-pad_size/2, pad_size/2, 0])rotate([-90, 0, 0])difference(){
    cube([pad_size, stand_height, wall_thickness]);
    translate([pad_size/2, stand_height-10, 0])cylinder(wall_thickness, mount_hole_size/2, mount_hole_size/2);
    translate([pad_size/2, stand_height-25, 0])cylinder(wall_thickness, mount_hole_size/2, mount_hole_size/2);
}
module pad_with_hole(hole_diameter, pad_size, wall_thickness) {
    translate([0, 0, -wall_thickness])union(){
    union(){
        translate([pad_size/2-wall_thickness, 0, 0])rotate([0,90,0])linear_extrude(wall_thickness)polygon([[0, -pad_size/2],[0, pad_size/2],[pad_size, pad_size/2]]);
        mirror([1, 0, 0]){
            translate([pad_size/2-wall_thickness, 0, 0])rotate([0,90,0])linear_extrude(wall_thickness)polygon([[0, -pad_size/2],[0, pad_size/2],[pad_size, pad_size/2]]);
        }
    }
    difference(){
        linear_extrude(wall_thickness)square([pad_size, pad_size], center=true);
        translate([0,0,-wall_thickness/2])cylinder(wall_thickness*2, hole_diameter, hole_diameter);
    }
    }
}

pad_with_hole(sma_diameter, pad_size, wall_thickness);
