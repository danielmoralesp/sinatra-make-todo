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

#get '/:id' do
#  @note = Tarea.update(params[:id])
#  @title = "Editar Tarea ##{params[:id]}"
#  erb :edit
#end

#put '/:id' do
#  @note = Tarea.update(params[:id])
#  n.title = params[:title]
#  n.done = params[:done] ? true : false
#  n.updated_at = Time.now
#  redirect '/'
#end

get '/:id/complete' do
  n = Tarea.update(params[:id])
#  n['done'] = n['done'] ? false : true # flip it
  redirect '/'
end

get '/:id/delete' do
  @note = Tarea.destroy(params[:id])
  @title = "Confirme si desea eliminar la tarea ##{params[:id]}"
  erb :delete
end

delete '/:id' do
  n = Tarea.destroy(params[:id])
#  n.destroy
  redirect '/'
end
