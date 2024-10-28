require "microapp"

Microapp.create do |app|
  app.gem "slim"
  app.db(table: :emails, columns: {email: :string, name: :string}) do |db|
    app.keystore do |keystore|
      app.web do
        get "/" do
          slim :index
        end

        post '/subscribe' do |params|
          keystore[params[:email]] = params[:name]
        end
      end
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
