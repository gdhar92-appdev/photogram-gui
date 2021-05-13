class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames.first
    
    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb"})
    end

  end

  def create

    new_username = params.fetch("input_username")

    a_new_user = User.new
    a_new_user.username = new_username
    a_new_user.save

    redirect_to("/users/" + new_username)

    #render({ :template => "user_templates/create.html.erb"})

  end

  def update_user
    
    input_user_id = params.fetch("path_user_id").to_i
    new_username = params.fetch("input_username")

    matching_user = User.where({ :id => input_user_id})
    the_user = matching_user.first
    the_user.username = new_username
    the_user.save

    redirect_to("/users/" + new_username)

    #render({ :template => "user_templates/update.html.erb"})
  end

end