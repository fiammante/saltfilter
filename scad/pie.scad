module pie(s,a, r, h,th){
  // a:angle, r:radius, h:height,s:start angle 
    rotate([0,0,s]) difference() { 
  color("blue")rotate_extrude(angle=a, $fn = 100) square([r,h]);
        
  translate([0,0,-1]) { union() {
      color("pink") rotate([0,0,-0.01*a]) rotate_extrude(angle=1.02*a,$fn = 100) square([r-th,h+2]);

    } }
}}
//pie( 85.1, 4.9, 185, 4, 1.5);