// Abdeckung fuer ein Tragflaechenservo Modellflugzeug fink
// Allgemeine einstellungen
$fn = 100;

// teil-Masse
thickness = 1;
width = 70;
depth = 80;
tunnel_length=40;
tunnel_height=10;
hzub_tunnel = 2/1;
verschiebung_tunnel = 5;

// die Ausbuchtung
module ausbuchtung (h, l, hzub) {
	scale([1,1/hzub,1])difference(){
		union(){
			rotate([0, 90, 0])cylinder(r=h, h=l);
			translate([l, 0, 0])scale([2,1,1])sphere(r=h);
		}
		d = 2 *h;
		translate([0, -d/2, -d])cube([l+2*h, d, d]);
	}
}

// hier beginnt das eigentliche bauteil
union(){
difference(){
	union(){
		ausbuchtung (tunnel_height + thickness, tunnel_length, hzub_tunnel);
		translate([0,verschiebung_tunnel, 0])translate([0,-width/2, 0])cube([depth, width, thickness]);
	}
	translate([0,0, -.01])ausbuchtung(tunnel_height, tunnel_length, hzub_tunnel);
}
translate([15,-40, 0])cube([40,35,thickness]);
}
