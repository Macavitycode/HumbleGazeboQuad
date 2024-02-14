
// Facet variables
// $fs = 0.15;
// $fa = 2;

// Variables
ref_inch_mul = 25.4;
prop_center_h_offset = 120;
prop_center_v_offset = 120;
cover_prop_inner = 3 * ref_inch_mul;
cover_prop_outer = 4 * ref_inch_mul;
prop_rad = 3 * ref_inch_mul;
body_thickness = 20;

difference() {
    
    union() {
        for (i = [45:90:360]) {
            rotate([0, 0, i])
            translate([prop_center_h_offset, 0, 0]) 
            cylinder(h = body_thickness, r = cover_prop_outer, center=true);
            }
            
        for (i = [0:90:360]) {
            rotate([0, 0, i])
            translate([120, 0, -30]) 
            cylinder(h = 40, r1 = 10, r2 = 15, center=true);
            }
        
        cylinder(h = body_thickness, r = 30, center = true);
        translate([160, 0, 0]) cube([40, 30, 40], center = true);
        translate([180, 0, 0]) 
            rotate([0, 90, 0]) 
            cylinder(h = 10, r = 5, center = true );
             
    } // End of Union

    for (i = [45:90:360]) {
        rotate([0, 0, i])
        translate([prop_center_h_offset, 0, 0]) 
        cylinder(h = body_thickness+1, r = cover_prop_inner, center=true);
        }
}