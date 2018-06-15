require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'omniauth-camdram'

class CamdramExample < Sinatra::Base
  use Rack::Session::Cookie

  get '/' do
    redirect '/auth/camdram'
  end

  get '/auth/:provider/callback' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  end

  get '/auth/failure' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  end

  use OmniAuth::Builder do
    provider OmniAuth::Strategies::Camdram, ENV["CAMDRAM_APP_ID"], ENV["CAMDRAM_APP_SECRET"], scope: "user_shows user_orgs"
  end
end

run CamdramExample.run!
