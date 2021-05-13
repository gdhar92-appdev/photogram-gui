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

  def create
    
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

    #render({ :template => "photo_templates/create.html.erb"})
  end

end