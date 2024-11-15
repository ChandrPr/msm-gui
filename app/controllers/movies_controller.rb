class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def insert_movie

    movie = Movie.new
    movie.description = params['query_description']
    movie.duration = params['query_duration']
    movie.image = params['query_image']
    movie.title = params['query_title']
    movie.year = params['query_year']
    movie.director_id = params['query_director_id']
    movie.save
    
    redirect_to("/movies")
  end

  def update_movie
    movie = Movie.where({ :id => params['path_id'] })[0]
    movie.description = params['query_description']
    movie.duration = params['query_duration']
    movie.image = params['query_image']
    movie.title = params['query_title']
    movie.year = params['query_year']
    movie.director_id = params['query_director_id']
    movie.save
    
    redirect_to("/movies/#{params['path_id']}")
  end

  def delete_movie
    Movie.where({ :id => params['path_id'] })[0].destroy
    redirect_to("/movies")
  end

end
