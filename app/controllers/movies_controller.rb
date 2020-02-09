class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @comments = Comment.where( movie_id: params[:id])
    @comment = Comment.new

  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
        if @movie.save
          format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        else
          fformat.html { render :new }
        end
      end    
    end

    def update
      @movie = Movie.find(params[:id])
      respond_to do |format|
        if @movie.update(movie_params)
          format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @movie = Movie.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      end
    end

    private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :duration, :genre, :description, :trailer)
    end
end

