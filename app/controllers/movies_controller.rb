class MoviesController < ApplicationController
	
	def index
		@movies= Movie.released
	end

	def show
		@movie=Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		
  		if @movie.update(movie_params)

  			redirect_to @movie, notice: "Movies successfully updated!"
  		else
  			render :edit
  		end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to @movie, notice: "Movies sucessfully created!"
		else
		 render :new 
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_url, alert: "Movies successfully destroyed!"
	end


	private

	def movie_params

		movie_params = params.require(:movie).permit(:cast, :director, :duration, :image_file_name, :title, :description, :rating, :released_on, :total_gross)
	end


end
