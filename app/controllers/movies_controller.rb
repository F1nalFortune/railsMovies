class MoviesController < ApplicationController
  
  # def search
  #   movies = Movie.where(title:'Interstellar')
  #   render 
  # end

  def search
    lookup = params[:lookup]
    type = params[:type]
    # type = "Title"
    case type
    when "Title"
      @movies = Movie.where(title:lookup)
    when "Genre"
      @movies = Movie.where(genre:lookup)
    when "Actor"
      @movies = Movie.where(actor:lookup)
    else
      @movies = Movie.all
    end

  end

  # def search
  #   @movies = Movie.all
  #   # redirect_to search_path
  # end

  def title
    lookup = params[:lookup]
    @movies = Movie.where(title:lookup)
    render json: { movies: movies }
    # redirect_to search_path
  end

  def actor
    lookup = params[:lookup]
    @movies = Movie.where(actor:lookup)
    binding.pry
    render json: { movies: movies }
    # redirect_to search_path
  end

  def genre
    lookup = params[:lookup]
    @movies = Movie.where(genre:lookup)
    render json: { movies: movies }
    # redirect_to search_path
  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movies = Movie.new
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private



  def movie_params
    params.require(:movie).permit(:title, :genre, :actor)
  end

end
