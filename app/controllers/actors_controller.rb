class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
  
  def insert_actor
    actor = Actor.new
    actor.bio = params['query_bio']
    actor.dob = params['query_dob']
    actor.image = params['query_image']
    actor.name = params['query_name']
    actor.save

    redirect_to("/actors")
  end

  def update_actor
    actor = Actor.where({ :id => params['path_id'] })[0]
    actor.bio = params['query_bio']
    actor.dob = params['query_dob']
    actor.image = params['query_image']
    actor.name = params['query_name']
    actor.save

    redirect_to("/actors/#{params['path_id']}")
  end

  def delete_actor
    Actor.where({ :id => params['path_id'] })[0].destroy
    redirect_to("/actors")
  end

end
