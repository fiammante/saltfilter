include <base.scad>
include <inlet.scad>
include <outletv.scad>
module filter(){
    th=1;
    d=35;
    h=15;
    w=130;
    offset=6;
    //translate([0,-d/2,2*h+5*th])cube([2*th,d,4*th],center=false);
    rotate([0,0,90]) difference() {

        difference() {
            union() {
                base(w,d,h,th,1);
            translate([0,0,h]) base(w,d,h,th,1);
                translate([0,-(d/2)+offset,2*th+h]) 
        inletv(2*h);
        translate([0,0,2*h+th/2]) outletv(w,35,h);
            }
            translate([0,-(d/2)+offset+.8,4*th]) hull() scale([0.9,0.87,h]) inletv(2*h);
        }
        

    sh=1.5;
    slh=2*h+4*th;
    sld=d-2*th;
    first=8;
        second=30;
    translate([w/2-4*th-first,-d/2+sh,-3*th])
                cube([2.5*th,sld,slh],center=false);
    mirror([1,0,0]) translate([w/2-4*th-first,-d/2+sh,-3*th])
                cube([2.5*th,sld,slh],center=false);
    translate([w/2-4*th-second,-d/2+sh,-3*th])
                cube([2.5*th,sld,slh],center=false);
    mirror([1,0,0])  translate([w/2-4*th-second,-d/2+sh,-3*th])
                cube([2.5*th,sld,slh],center=false);
//translate([-w,-d,0])cube([2*w,2*d,2*h+5*th],center=false);
}}
filter();
