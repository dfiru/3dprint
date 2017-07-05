require 'erb'
require 'rake'
require 'rake/clean'
require 'fileutils'

BASE_SCAD_COMMAND = "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
#http://jasonseifer.com/2010/04/06/rake-tutorial

CLEAN.include('build')

#define the order in which p&r stages happen
def convert_erb(basefile,outfile)
  template_file = File.open(basefile, 'r').read
  erb = ERB.new(template_file)
  File.open(outfile, 'w+') { |file| file.write(erb.result(binding)) }
end


desc "create build_folder"
file "build" do |t|
  FileUtils.mkdir_p t.name
end

bns = :broom_clamp
namespace bns do |n|

  @template = File.join("src", bns.to_s, "broom_overcentre_latch.scad.erb")
  desc "create the namespace's subfolder"
  file "build/#{bns}" => ["build"] do |t|
    FileUtils.mkdir_p t.name
  end
  
  desc "generate files for synthesis"
  task :broom, [] => ["build/#{bns}"] do |t, arg|
    @diameter = 21
    @height = 32
    @screw_diameter = 4.5
    broom_base(t, arg)
  end

  def broom_base(t, arg)
    common_name = File.join("build", t.to_s.split(":"))
    common_name += "-d#{@diameter}X#{@height}h"
    o           = "#{common_name}.stl"
    i           = "#{common_name}.scad"
    convert_erb(@template, i)
    command = "#{BASE_SCAD_COMMAND} -o #{o} -D \'quality=\"production\"\' #{i}"
    puts "executing: #{command}"
    sh command 

  end
end
