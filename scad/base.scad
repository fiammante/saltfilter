
include <prism.scad>
include <support.scad>
include <inletv.scad>
module base(w=22, d=12, h=15, th=1,sz=1){
    ch=2;
    union() {
    

  
    translate([-w/2,d/2-th,th]) {cube([w,th,h],center=false);
        translate([0,-ch,0.9*th])prism(w,ch,ch);
        translate([0,-ch,h]) prism(w,ch,-ch);}
    mirror([0,1,0]) {
        translate([-w/2,d/2-th,th]) {cube([w,th,h],center=false);
        translate([0,-ch,0.9*th])prism(w,ch,ch);
        translate([0,-ch,h]) prism(w,ch,-ch);}
    }
    translate([-w/2,-d/2,th/2]) cube([w,d,2*th],center=false);
    translate([0,0,2]) support(w,d-2*(ch+th/2),h-3*th/2,th,4);
}
    
}

//base(120, 35, 15, 1,1);