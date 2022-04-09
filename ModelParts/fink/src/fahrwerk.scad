$fn = 100;
bodenplatte_hoehe=13.5;
mounting_plate_width = 68;
buggy_translation = 40;
// Modul um ein modul zu spiegeln und dabei das original zu erhalten
module mirror_copy(v = [0, 1, 0]) {
	children();
	mirror(v)children();
}

// Fahrwerksbein
union(){
	mirror_copy()
	union(){
	cube([50, mounting_plate_width/2, 3]);
	translate([0, mounting_plate_width/2-bodenplatte_hoehe, 0])
		difference(){
			hull(){
				translate([0, 0, 1])
					linear_extrude(height = 1, center=true)
						import(file = "fahrwerks-bein-querschnitt.svg", center = false, dpi=300);
				translate([0, buggy_translation, 70])
					rotate([90, 0, 0])
						cylinder(r=6, h=7, center=true);
			}
			translate([0, buggy_translation-3, 70])
				rotate([90, 0, 0])
					cylinder( r=2.5, h=15, center=true);
		}
	}
}
