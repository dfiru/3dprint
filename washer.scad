id = 7;
od = 10;
d = 10;

washer();

module washer(){
     difference() {
	  cylinder(h = d, d = od);	       
	  cylinder(h = d, d = id);
     }
}
