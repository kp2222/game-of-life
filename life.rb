$: << File.expand_path(File.dirname(__FILE__))

require 'world'
require 'world_renderer'
require 'pattern_loader'


if ARGV.include?("-p")
  # load the world seed from pattern file in examples folder
  world = World.new PatternLoader.new(ARGV[1]).load
else
  WORLD_SIZE = ARGV[0].to_i || 100
  WORLD_SEED = WORLD_SIZE.times.collect{ WORLD_SIZE.times.collect { [0,1].sample }}
  world = World.new WORLD_SEED
end

# Render the world in the console
renderer = WorldRenderer.new world
while(true) do
  renderer.render
  sleep 0.1
  world.progress
end
