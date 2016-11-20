#http://jasonseifer.com/2010/04/06/rake-tutorial

desc "build something"

stuff = %w(
vacuum_plug
plasma_cap
washer);

stuff.each do |s|
  o = "#{s}.stl"
  i = "#{s}.scad"
  file o => "#{s}.scad" do
    command = "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o #{o} -D \'quality=\"production\"\' #{i}"
    puts "executing: #{command}"
    sh command 
  end
end
