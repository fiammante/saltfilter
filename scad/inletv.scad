include <pie.scad>
module inletv(h=1) {
dt=13.5;
dh=2.65;
dr=dt-dh;
w=22;
translate([0,dr,0]) {
    th=.8;
    ri=1.5;ro=45;
    ai=85;ao=77.3;
    translate([w/2-ri,0,0]) pie(0, ai,ri,h,th);
    translate([0,dh-ro,0]) pie(ao, 90-ao,ro,h,th);
    mirror([1,0,0]) {
        translate([w/2-ri,0,0]) pie(0, ai,ri,h,th);
        translate([0,dh-ro,0]) pie(ao, 90-ao,ro,h,th);
    }

    translate([0,-dr/2,h/2]) difference() {
    cube([w,dr,h],center=true);
        translate([0,th,0])cube([w-2*th,dr,h+2],center=true);
    }
}
}
//inletv(3);