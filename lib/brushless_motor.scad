shaft_length = 48;
shaft_diameter = 2.5;
body_length = 28.5;
body_diameter = 26;
rear_shaft_extension = true;
rear_shaft_ex_diameter = 9;
rear_shaft_ex_height = 5;
mount_screw_holes_diameter = 3;
cable_exit_angle = 225;
cable_exit_channel_width = 6;
cable_exit_channel_height = 5;

mounting_thread_dist_from_center=[9.5 , 8];
number_of_mounting_threads = 4;
thread_depth = 3;
$fn=100;

front_cooling_opening_diameter = 6;
cooling_slit_depth = 2;
front_cooling_opening_dist_from_center = 6.5;
cooling_slit_count = 4;
cooling_slit_rot_offset = 45;

// Motor
difference(){
	translate([0, 0, -body_length])
		union(){
			if (rear_shaft_extension) {
				translate([0,0, -rear_shaft_ex_height])cylinder(r=shaft_diameter/2, h=shaft_length);
				cylinder(r=body_diameter/2, h=body_length);
				translate([0,0,-rear_shaft_ex_height])cylinder(r=rear_shaft_ex_diameter/2, h=rear_shaft_ex_height);
			} else {
				cylinder(r=shaft_diameter/2, h=shaft_length);
				cylinder(r=body_diameter/2, h=body_length);
			}
			intersection(){
				difference(){
					cylinder(r=body_diameter/2+cable_exit_channel_height, h=body_length);
					cylinder(r=body_diameter/2/2,h=body_length);
				}
				rotate([0,0,cable_exit_angle])translate([0,-cable_exit_channel_width/2,0])cube([body_diameter, cable_exit_channel_width, body_length]);
			}
		}
	translate([0, 0, -thread_depth])
	for (i=[1:1:number_of_mounting_threads]){
		delta_deg = 360/number_of_mounting_threads;
		rotate([0,0,delta_deg*i])
			translate([mounting_thread_dist_from_center[i%len(mounting_thread_dist_from_center)],0,0])
				cylinder(r=mount_screw_holes_diameter/2, h=thread_depth);
	}
	rotate([0, 0, cooling_slit_rot_offset])
	translate([0, 0, -cooling_slit_depth])
	for(i=[1:1:cooling_slit_count]){
		delta_deg = 360/cooling_slit_count;
		rotate([0, 0, i*delta_deg])
			translate([front_cooling_opening_diameter/2+front_cooling_opening_dist_from_center, 0, 0])
				union(){
					cylinder(r=front_cooling_opening_diameter/2, h=cooling_slit_depth);
					translate([0,-front_cooling_opening_diameter/2,0])cube([body_diameter, front_cooling_opening_diameter, cooling_slit_depth]);
				}
	}
}
