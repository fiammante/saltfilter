include <prism.scad>
//-------------------------------------------------

// Generate mesh as module
module mesh(w,d,th=1,sp=2,h=1.5 ){
    mirror([0,0,1])  difference() {
        union() {
            nX=floor(w/(th+sp))-1;
            dX=(w-nX*(th+sp))/2;
            nY=floor(d/(th+sp))-1;
            dY=(d-nY*(th+sp))/2;
            for (i=[0:nX]) {
                 translate([-(w/2)+i*(th+sp)+dX,-d/2,-h/2]){
                     rotate([0,0,90]) {
                    translate([0,-th,0]) prism(d,th,h);
                    translate([0,th,0]) prism(d,-th,h);
                    }
                 };
            }
        
            for (i=[0:nY]) {
                translate([-w/2,-(d/2)+i*(th+sp)+dY,-h/2]){
                    translate([0,-th,0]) prism(w,th,h);
                    translate([0,th,0]) prism(w,-th,h);
                };
        
            }
        }
       translate([0,0,th/2]) cube([w+th,d+th,th/2],center=true);
    }
}
// mesh(24,12,1,2,1.5 );