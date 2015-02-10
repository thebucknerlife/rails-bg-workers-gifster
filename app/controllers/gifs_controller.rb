class GifsController < ApplicationController

  before_action :authorize

  def index
    @gifs = Gif.all.order('created_at DESC')
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)
    @gif.attach_image(gif_params)
    @gif.user = current_user

    if @gif.save
      redirect_to gifs_path
    else
      flash.now[:error] = @gif.errors.full_messages.to_sentence
      render :new
    end
  end

private

  def gif_params
    params.require(:gif).permit(:title, :remote_image_url, :image)
  end
end
