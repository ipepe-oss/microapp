require "microapp"

Microapp.create do |app|
  app.gem "slim"
  app.web do
    get "/" do
      slim :index
    end
  end
end

__END__
@@ layout
html
  body
    == yield

@@ index
.title Hello world.
