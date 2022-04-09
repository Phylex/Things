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
mounting_plate_thickness = 5;
front_cooling_opening_dist_from_center = 6.5;
cooling_slit_count = 4;
cooling_slit_rot_offset = 45;
cooling_slit_depth = 2;

make_printable=true;

// kuehloeffungs-Modul
module cooling_slit (slit_width, slit_length, slit_depth, dist_from_center, angle){
	rotate([0, 0, angle])
		translate([slit_width/2+dist_from_center, 0, 0])
		union(){
			cylinder(r=slit_width/2, h=slit_depth);
			translate([0,-slit_width/2, 0])cube([slit_length-slit_width/2, slit_width, slit_depth]);
		}
}
// ein Bein der Motorverankerung
module leg (slit_params, delta_deg, inner_radius, outer_radius, height, plate_thickness, footprint, footprint_center){
	difference(){
		hull(){
			intersection(){
				difference(){
					cylinder(r=outer_radius, h=plate_thickness);
					cylinder(r=inner_radius, h=plate_thickness);
					cooling_slit(slit_params[0], slit_params[1], slit_params[2], slit_params[3], 0);
					cooling_slit(slit_params[0], slit_params[1], slit_params[2], slit_params[3], delta_deg);
				}
				rotate_extrude(angle=delta_deg)translate([0,-20,0])square([outer_radius, 40]);
			}
			translate([0, 0, height-1])translate(footprint_center)cube([footprint[0],footprint[1], 1], center=true);
		}
		cylinder(r=inner_radius,h=height);
	}
}

//Motorhalterung
mirror([0,0,1])
rotate([0, 0, cooling_slit_rot_offset])
union(){
	difference(){
		// mounting plate
		cylinder(r=body_diameter/2+7, h=mounting_plate_thickness);

		// hole for the shaft
		cylinder(r= shaft_diameter/2+1, h=mounting_plate_thickness);
		cylinder(r= 7/2, h=1);
		// removed material for cooling slit
		for(i=[1:1:cooling_slit_count]){
			delta_deg = 360/cooling_slit_count;
			cooling_slit(front_cooling_opening_diameter, body_diameter, mounting_plate_thickness, front_cooling_opening_dist_from_center, i*delta_deg+cooling_slit_rot_offset);
		}
		// remove material for mounting screws
		for (i=[1:1:number_of_mounting_threads]){
			delta_deg = 360/number_of_mounting_threads;
			rotate([0,0,delta_deg*i])
				translate([mounting_thread_dist_from_center[i%len(mounting_thread_dist_from_center)],0,0])
					cylinder(r=mount_screw_holes_diameter/2, h=mounting_plate_thickness);
		}
	}
	// legs
	foot_measures =[[10, 10], [5, 20]];
	foot_positions=[[20, 20]-foot_measures[0]/2, [20, 40]-foot_measures[1]/2];
	rotate([0, 0, cooling_slit_rot_offset])
	mirror([0,0,1])
	for(i=[1:1:cooling_slit_count]){
		rotate([0,0,360/2*i])
		translate([0,0, -mounting_plate_thickness]){
		if(i==1){
			leg([front_cooling_opening_diameter, body_diameter, mounting_plate_thickness, front_cooling_opening_dist_from_center],
				360/cooling_slit_count,
				body_diameter/2+2,
				body_diameter/2+7,
				body_length+20,
				mounting_plate_thickness,
				foot_measures[i-1],
				foot_positions[i-1]);
			mirror([1, 0, 0])
			leg([front_cooling_opening_diameter, body_diameter, mounting_plate_thickness, front_cooling_opening_dist_from_center],
				360/cooling_slit_count,
				body_diameter/2+2,
				body_diameter/2+7,
				body_length+20,
				mounting_plate_thickness,
				foot_measures[i-1],
				foot_positions[i-1]);
		}
		if(i==2){
			leg([front_cooling_opening_diameter, body_diameter, mounting_plate_thickness, front_cooling_opening_dist_from_center],
				360/cooling_slit_count,
				body_diameter/2+2,
				body_diameter/2+7,
				body_length+20,
				mounting_plate_thickness,
				foot_measures[i-1],
				foot_positions[i-1]);
			mirror([1, 0, 0])
			leg([front_cooling_opening_diameter, body_diameter, mounting_plate_thickness, front_cooling_opening_dist_from_center],
				360/cooling_slit_count,
				body_diameter/2+2,
				body_diameter/2+7,
				body_length+20,
				mounting_plate_thickness,
				foot_measures[i-1],
				foot_positions[i-1]);
		}
		}
	}
}
