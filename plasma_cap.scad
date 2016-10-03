id = 33;
od = 50;
d = 10;
lip = 3;

plasma_cap(label = "AUDREY");
translate([od*1.1, 0,0]) plasma_cap(label = "CLAIRE");
module plasma_cap(label = "THIS"){
     difference() {
	  union() {
	       cylinder(h = d+lip, d = id);
	       cylinder(h = lip, d = od);}
	  rotate([0,180,0]) translate([0, 0,-1.5])  linear_extrude(5)  text(label, size = 8, halign="center", valign="center");
	  translate([0,0,lip]) cylinder(h = 10, d = id *0.85);
     }
}
