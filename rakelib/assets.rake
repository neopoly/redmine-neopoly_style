namespace :assets do
  desc "Build all static assets"
  task build: [:"assets:build:stylesheets"]

  namespace :build do
    def path(*segments)
      File.join(*segments)
    end

    desc "Convert SASS stylesheets to CSS"
    task :stylesheets do
      require "sass"
      input  = path("lib", "assets", "stylesheets", "neopoly_style.sass")
      output = path("assets", "stylesheets", "neopoly_style.css")
      engine = Sass::Engine.for_file(input, syntax: :sass, style: :compact)
      File.write(output, engine.render)
      puts "Build: #{output}"
    end
  end
end
