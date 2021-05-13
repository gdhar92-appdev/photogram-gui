class PhotosController < ApplicationController

  def index
  
    matching_photos = Photo.all
    
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({:template => "photo_templates/index.html.erb"})

  end

  def show
    
    url_photo_id = params.fetch("path_photo_id").to_i
    matching_photos = Photo.where({ :id => url_photo_id})
    @the_photo = matching_photos.first
    
    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show.html.erb"})
    end

  end

  def delete_photo

    url_photo_id = params.fetch("path_photo_id").to_i
    matching_photos = Photo.where({ :id => url_photo_id})
    the_photo = matching_photos.first
    the_photo.destroy
    redirect_to("/photos")
    #render({ :template => "photo_templates/delete.html.erb"})

  end

end