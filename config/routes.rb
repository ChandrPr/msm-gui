Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  post("/insert_director", { :controller => "directors", :action => "insert_director" })
  post("/modify_director/:path_id", { :controller => "directors", :action => "update_director" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete_director" })
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  post("/insert_movie", { :controller => "movies", :action => "insert_movie" })
  post("/modify_movie/:path_id", { :controller => "movies", :action => "update_movie" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete_movie" })
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  post("/insert_actor", { :controller => "actors", :action => "insert_actor" })
  post("/modify_actor/:path_id", { :controller => "actors", :action => "update_actor" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete_actor" })
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
