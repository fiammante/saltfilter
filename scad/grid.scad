module grid(

//------------parameters---------------------------
// overall size of X dimension
gridX=62,  
// overall size of Y dimension
gridY=60,  
// X border size
borderX=2, 
// Y border size
borderY=2, 
// width of solid part of grid
meshSolid=0.5,
// width of blank part of grid 
meshSpace=2,  
// thickness in Z direction
thickness=1,

// If you want it round, set to "true". For rectangular to "false". If "true" is set, then only gridX and borderX are used as diameters and gridY and borderY are simply ignored
flag_round=false
){

//-------------------------------------------------
meshX=gridX-(borderX*2);
meshY=gridY-(borderY*2);
nX=meshX/(meshSolid+meshSpace);
nY=meshY/(meshSolid+meshSpace);

// Generate mesh as module
module myMesh(){
    for (i=[0:nX]) {
         translate([-(meshX/2)+i*(meshSolid+meshSpace),-meshY/2,-thickness/2]){
             cube(size=[meshSolid,meshY,thickness],center=false);
         };
    }

    for (i=[0:nY]) {
        translate([-meshX/2,-(meshY/2)+i*(meshSolid+meshSpace),-thickness/2]){
           cube(size=[meshX,meshSolid,thickness],center=false);
        };

    }
}

if (flag_round==true) {
    
    // Genrate frame (Round)
    inner_radius = (gridX-2*borderX)/2;
    difference() {
        cylinder(r=gridX/2, h=thickness, center=true);
        translate([0,0,-0.1]) {
            cylinder(r=inner_radius, h=thickness+0.2, center=true);
        };
    }

    intersection() {
        cylinder(r=inner_radius,h=thickness, center=true);
        myMesh();
    };
    
} else {
    
    // Generate frame (rectancular)
    difference() {
        cube (size=[gridX,gridY,thickness],center=true);
        translate([0,0,-0.1]) {
            cube (size=[meshX,meshY,thickness+0.5],center=true);
        }
    }
    myMesh();
}
}
d=35;
h=15;
w=130;
offset=6;
th=1;
sh=1.5;
slh=2*h+8*th;
sld=d-8*th;
first=8;
translate([(sld+th)/2,(slh+th)/2,0]) 
grid(sld,slh,2,2,0.5,2,1.5*th);
translate([-(sld+th)/2,(slh+th)/2,0]) 
grid(sld,slh,2,2,0.5,2,1.5*th);
translate([(sld+th)/2,-(slh+th)/2,0]) 
grid(sld,slh,2,2,0.5,2,1.5*th);
translate([-(sld+th)/2,-(slh+th)/2,0]) 
grid(sld,slh,2,2,0.5,2,1.5*th);
