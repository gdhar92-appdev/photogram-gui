Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_photo_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:path_photo_id", { :controller => "photos", :action => "delete_photo"})

  get("/insert_photo", { :controller => "photos", :action => "create"})

  get("/update_photo/:path_photo_id", { :controller => "photos", :action => "update"})

  get("/insert_comment_record", { :controller => "photos", :action => "insert_comment"})

  get("/insert_user_record", { :controller => "users", :action => "create"})

  get("/update_user/:path_user_id", { :controller => "users", :action => "update_user"})
end
