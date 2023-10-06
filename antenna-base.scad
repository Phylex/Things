base_lengh = 80;
base_height = 30;
wall_thickness = 4;
mount_hole_size = 3.3;
pad_size = 22;
stand_height = 200;

mirror([0,0,1]){hull(){
    translate([-base_lengh/2, -base_lengh/2, 0])cube([base_lengh, base_lengh, 1]);
    translate([-pad_size/2, pad_size/2, base_height-1])cube([pad_size, wall_thickness, 1]);
}}
translate([-pad_size/2, pad_size/2, 0])rotate([-90, 0, 0])difference(){
    cube([pad_size, stand_height, wall_thickness]);
    translate([pad_size/2, stand_height-25, 0])translate([-mount_hole_size/2, 0, 0])cube([mount_hole_size, 25, wall_thickness]);
    translate([pad_size/2, stand_height-25, 0])cylinder(wall_thickness, mount_hole_size/2, mount_hole_size/2);
}