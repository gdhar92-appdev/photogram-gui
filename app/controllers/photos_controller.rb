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
    a_new_photo.owner_id = input_owner_id.to_i

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

    #render({ :template => "photo_templates/create.html.erb"})
  end

  def update

    input_image_id = params.fetch("path_photo_id").to_i
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    matching_photos = Photo.where({ :id => input_image_id})
    the_photo = matching_photos.first
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
    #render({ :template => "photo_templates/update.html.erb"})

  end

  def insert_comment
    
    input_image_id = params.fetch("input_photo_id").to_i
    input_author = params.fetch("input_author_id").to_i
    input_comment = params.fetch("input_body")

    a_new_comment = Comment.new
    a_new_comment.photo_id = input_image_id
    a_new_comment.author_id = input_author
    a_new_comment.body = input_comment

    a_new_comment.save

    redirect_to("/photos/" + input_image_id.to_s)

    #render({ :template => "photo_templates/insert.html.erb"})
  end

end