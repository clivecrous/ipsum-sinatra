LANGUAGES = %w|latin english french|

require 'sinatra'
LANGUAGES.each do |language|
  require "ipsum-#{language}"
end

get '/' do
  @sentences = 5
  erb :form
end

post '/' do
  redirect "/#{request['language']}/#{request['sentences']}"
end

get '/:language/:sentences' do |language,sentences|
  @language = language.strip.downcase.to_sym
  @sentences = sentences.to_i
  erb :result
end
