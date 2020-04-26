include <tpyramid.scad>
//-------------------------------------------------

// Generate mesh as module
module support(w,d,h=10,th=1,sp=2 ){
    union() {
        cube([w,d,1],center=true);
            n=8;
            nX=floor((w+sp)/(n*th+sp))-0.9;
            nEl=ceil(nX);
            nSp=nEl-1;
            wEl=nEl*n*th+nSp*sp;
            shf=(w-wEl)/2;
            dX=n*th+sp;
            nY=floor(d/(th+sp))-2;
            dY=(d-2*sp)/nY;
            for (i=[0:nX]) {
                for (j=[0:nY]) {
                translate([-w/2+i*dX+shf+n*th/2,-d/2+j*dY+sp,h/2]) 
                    cube([n*th,th,h],center=true);
                    
                    translate([-w/2+i*dX+shf+n*th/2,-d/2+j*dY+sp,th/2])tpyramid(n*th/2-th,-th/2,1,2,1);
                    translate([-w/2+i*dX+shf+n*th/2,-d/2+j*dY+sp,h-th])tpyramid(n*th/2-th,-th/2,1,1,2);
                
                
                 };
            }


    }
}
//support(120,35,15,1,4 );