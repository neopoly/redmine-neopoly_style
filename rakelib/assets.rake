namespace :assets do
  desc "Build all static assets"
  task build: [:"assets:build:stylesheets"]

  namespace :build do
    def path(*segments)
      File.join(*segments)
    end

    CSS_FILES = %w(neopoly_style neopoly_style_responsive)

    desc "Convert SASS stylesheets to CSS"
    task :stylesheets do
      require "sass"

      CSS_FILES.each do |name|
        input  = path("lib", "assets", "stylesheets", "#{name}.sass")
        output = path("assets", "stylesheets", "#{name}.css")
        engine = Sass::Engine.for_file(input, syntax: :sass, style: :compact)
        File.write(output, engine.render)
        puts "Build: #{output}"
      end
    end
  end
end
