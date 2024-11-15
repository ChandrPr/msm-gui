class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def insert_director
    director = Director.new
    director.bio = params['query_bio']
    director.dob = params['query_dob']
    director.image = params['query_image']
    director.name = params['query_name']
    director.save
    
    redirect_to("/directors")
  end

  def update_director
    director = Director.where({ :id => params['path_id'] })[0]
    director.bio = params['query_bio']
    director.dob = params['query_dob']
    director.image = params['query_image']
    director.name = params['query_name']
    director.save
    
    redirect_to("/directors/#{params['path_id']}")

  end

  def delete_director
    Director.where({ :id => params['path_id'] })[0].destroy
    redirect_to("/directors")
  end

end
