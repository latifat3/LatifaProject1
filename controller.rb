require_relative './database.rb'
require 'sinatra'


get'/students/new' do
	erb :application do
		erb :new
	end
end

post'/students' do
	db = DBHandler.new
	@students = db.create(params[:firstname],params[:lastname],params[:email],params[:major],params[:graduationstatus])
	redirect to '/students'
end



get '/' do

	redirect to '/students'
end

get'/students' do

	db = DBHandler.new
	@students = db.all
	erb :application do
		erb :index
	end
end

get '/students/:id' do
	id = params[:id].to_i
	db = DBHandler.new
	@student = db.get(id)
	erb :application do
		erb :show
	end
end

get '/students/:id/edit' do
	
	id = params[:id].to_i
	db = DBHandler.new
	@student = db.get(id)
	erb :application do
		erb :edit
	end
end

post '/students/:id' do
	id = params[:id].to_i
	db = DBHandler.new
	db.update(id, params[:firstname],params[:lastname],params[:email],params[:major],params[:graduationstatus])
	redirect to '/students'
end

get '/students/:id/delete' do
	id = params[:id].to_i
	db = DBHandler.new
	db.destroy(id)
	redirect to '/students'
end
