wall_thickness = 2;

pi_width = 56;
pi_length = 85;

sd_card_width = 24;
sd_card_length = 35;
sd_card_y_offset = 14;
sd_card_x_offset = 68;

usb_y_offset = 17;
usb_x_offset = -wall_thickness;
usb_width = 15;
usb_length = 17;

combo_length = 10;
combo_x_offset = 34;
combo_y_offset = - 7;
combo_width = 19;

sound_length = 12;
sound_x_offset = 15;
sound_width = 15;
sound_y_offset = - 4;

ethernet_y_offset = 38;
ethernet_x_offset = -wall_thickness;
ethernet_width = 16;
ethernet_length = 22;

power_x_offset = pi_length - wall_thickness;
power_y_offset = 44;
power_height = 8.5;
power_length = 5;

hdmi_x_offset = 32.9;
hdmi_y_offset = pi_width - wall_thickness;
hdmi_height = 5;
hdmi_length = 15.2;

difference() {
translate([-wall_thickness, -wall_thickness, -wall_thickness])
cube([pi_length + 2 * wall_thickness, pi_width + 2 * wall_thickness, 20 + wall_thickness]);

linear_extrude(20)
union() {
    translate([-0.1, -0.1])
    square([pi_length+0.2, pi_width+0.2]);
    
    translate([ethernet_x_offset, ethernet_y_offset])
    square([ethernet_length, ethernet_width]);
    
    translate([usb_x_offset, usb_y_offset])
    square([usb_length, usb_width]);
    
    translate([sd_card_x_offset, sd_card_y_offset])
    square([sd_card_length, sd_card_width]);
    
    translate([combo_x_offset, combo_y_offset])
    square([combo_length, combo_width]);
    
    translate([sound_x_offset, sound_y_offset])
    square([sound_length, sound_width]);
    
    translate([power_x_offset, power_y_offset])
    square([power_length, power_height]);
    
    translate([hdmi_x_offset, hdmi_y_offset])
    square([hdmi_length, hdmi_height]);
};
};