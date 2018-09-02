
$fn=50;

holeDepth = 15;
holeDia = 32;
holeDist = 60;
rod = 12.5;
t = 5;

slotDia = 10;
slotLen = 50;
slotDist = 25;

centerDia = 10;

difference(){
    union(){
        cylinder(h=t,d=180);
        cylinder(h=holeDepth+t,d=centerDia+t);
        
        for ( i = [0:3] ){
           rotate([0,0,120*i]){
               translate([holeDist,0,0]){
                cylinder(h=holeDepth+t,d=holeDia+t);
               }
           } 
        }
        for ( i = [0:3] ){
            rotate([0,0,120*i]){
                translate([centerDia/2-t,-t/2])
                    cube([holeDist, t, holeDepth + t]);
            }
        }
    }
    
    translate([0, 0, -t*2])
    cylinder(h=holeDepth+4*t,d=centerDia);

    for ( i = [0:3] ){
       rotate([0,0,120*i]){
           translate([holeDist,0,-10]){
            cylinder(h=holeDepth+10,d=holeDia);
            translate([0,0,t])
                cylinder(h=100,d=rod);
           }
       } 
    }

    rotate([0,0,60]){
        for ( i = [0:3] ){
           rotate([0,0,120*i]){
                translate([slotDist, 0, -t*2]){
                    union(){
                        cylinder(h=t*4,d=slotDia);
                        translate([slotLen,0,0])
                            cylinder(h=t*4,d=slotDia);
                        translate([0,-slotDia/2,0])
                                cube([slotLen, slotDia, t*4]);
                    }
                }
            }
        }
    }
}

