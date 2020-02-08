class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show

  end

  def new
    @movie = Movie.new
  end

  def edit

  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
        if @movie.save
          format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        else
          format.html { render :new }
        end
      end    
    end

    def update
      respond_to do |format|
        if @movie = Movie.find(params[:id])
          format.html { redirect_to @song, notice: 'Movie was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @movie.destroy
      respond_to do |format|
        format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      end
    end

    private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.fetch(:movie, {})
    end
end

