get '/sample' do
  'Hello world'
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/viewer' do
  erb :viewer, :locals => {:document => params[:document]}
end

get '/document/:document' do
  send_file File.join(settings.public_folder, "swagger_docs/#{params['document']}.json")
end


get '/apis' do
  @swagger_docs = []
  Dir[File.join(File.dirname(__FILE__), '../public/swagger_docs/', '*.json')].each {
      |file| @swagger_docs.push( File.basename(file, '.json' ) )
  }
  puts @swagger_docs
  erb :apis
end
