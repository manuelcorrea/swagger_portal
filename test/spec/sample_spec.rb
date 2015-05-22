require_relative '../test_helper'

describe Sinatra::Application, "#sample controller" do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  it "can successfully get sample" do
    get "/sample"
    expect(last_response.body).to eq 'Hello world'
  end
end
