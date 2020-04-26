module tpyramid(szx=1, szy=1,h=1,b=1,t=2){
    hull() polyhedron(
        // the four points at base
        points=[ [b+szx,b+szy,0],[b+szx,-(b+szy),0],[-(b+szx),-(b+szy),0],[-(b+szx),b+szy,0],
        // the four points at top 
        [t+szx,t+szy,h],[t+szx,-(t+szy),h],[-(t+szx),-(t+szy),h],[-(t+szx),t+szy,h]  ],
        // the side faces
        faces=[ [0,1,5,4],[1,2,6,5],[2,3,7,6],[3,0,4,7],
        // top and bottom faces
        [1,2,3,4],[4,5,6,7]  ] );
}
//tpyramid( 4, 0.5, 1, 2, 1);