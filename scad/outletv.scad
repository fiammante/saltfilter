include <pie.scad>
module outletv(wb,d,h=1) {
    w=49;
    w2=21;
    th=1;
    
    ai=121.5;ao=87.1;ab=56;
    ri=9;ro=16/cos(ao);rb=4.5;
    as=90-ai;
    dt=26.5+2*th;
    dr=20;
    dh=dt-dr;
    l3=16.2;
    ofx3=18.15;
    ofy3=8.95;
    
    
    difference() { union() {
        translate([0,-d/2,0]) {
            translate([0,dr,0]) {
                color("pink") translate([w/2-ri,0,0]) pie(as, ai,ri,h,th);
                color("red")  translate([0,th+dh-16/cos(ao),0]) pie(ao, 90-ao,ro,h,th);               
                mirror([1,0,0]) {
                    color("pink")  translate([w/2-ri,0,0]) pie(as, ai,ri,h,th);
                    color("red") translate([0,th+dh-ro,0]) pie(ao, 90-ao,ro,h,th);
                }              
            }
            color("green")translate([0,th/2,h/2]) 
            cube([w2,th,h],center=true);
            translate([-w2/2,rb,0]) pie(-90,-ab,rb,h,th);
            mirror([1,0,0]) translate([-w2/2,rb,0]) pie(-90,-ab,rb,h,th);
            translate([ofx3,ofy3,h/2]) rotate([0,0,ab])  
                cube([l3,th,h],center=true);
            mirror([1,0,0])     translate([ofx3,ofy3,h/2]) rotate([0,0,ab])  
                cube([l3,th,h],center=true);
        }
        translate([-wb/2,-d/2,0]) cube([wb,d,th],center=false);
    }
    hull() {
        translate([0,-d/2,-th]) {
            translate([0,dr,0]) {
                translate([w/2-ri,0,0]) pie(as, ai,ri-th,h,th);
                translate([0,th+dh-ro,0]) pie(ao, 90-ao,ro-th,h,th);
                
                mirror([1,0,0]) {
                    translate([w/2-ri,0,0]) pie(as, ai,ri-th,h,th);
                    translate([0,th+dh-ro,0]) pie(ao, 90-ao,ro-th,h,th);
                }
                
            }
            translate([0,3*th/2,h/2]) 
            cube([w2,th,h],center=true);
            translate([-w2/2,rb,0]) pie(-90,-ab,rb-th,h,th);
            mirror([1,0,0]) translate([-w2/2,rb,0]) pie(-90,-ab,rb-th,h,th);
            translate([ofx3-th,ofy3,h/2]) rotate([0,0,ab])  
                cube([l3,th,h],center=true);
            mirror([1,0,0])     translate([ofx3-th,ofy3,h/2]) rotate([0,0,ab]) cube([l3,th,h],center=true);  
        
    }}
}
}
//outletv(50,35,4);
