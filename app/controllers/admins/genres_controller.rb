class Admins::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
		@genres = Genre.all
		@genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "successfully"
      redirect_to admins_genres_path
		else
			render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(name: params[:genre][:name], status: params[:genre][:status].to_i)
      flash[:notice] = "successfully"
      redirect_to admins_genres_path
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  


  private
  def genre_params
      params.require(:genre).permit(:name, :status)
  end

end
