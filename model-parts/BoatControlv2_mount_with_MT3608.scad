length = 100;
width = 58;
height = 5;
arduino_outline = [[0,0], [66,0], [66,2], [69,5], [69,37], [66,40], [66,54], [0,54]];
voltage_regulator_outline = [[0,0], [44,0], [44,22], [0,22]];
difference(){
	cube([length, width, height]);
	translate([0, (width-53)/2,2])linear_extrude(8)polygon(arduino_outline);
	translate([70,2,2])translate([28,0,0])rotate([0,0,90])linear_extrude(8)polygon(voltage_regulator_outline);
}
