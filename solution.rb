require 'sinatra'
require 'make_todo'

get '/' do
  @notes = Tarea.all
  @title = 'Todas las Tareas'
  erb :home
end

post '/' do
  n = Tarea.create(params[:title])
  redirect '/'
end

get '/:id/complete' do
  n = Tarea.update(params[:id])
  redirect '/'
end

get '/:id/delete' do
  @note = Tarea.destroy(params[:id])
  @title = "Confirme si desea eliminar la tarea ##{params[:id]}"
  erb :delete
end

delete '/:id' do
  n = Tarea.destroy(params[:id])
  redirect '/'
end
