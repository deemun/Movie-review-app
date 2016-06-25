class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def new
  	@movie = Movie.new
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def create
  	@movie = Movie.new(movie_params)

  	if @movie.save
          redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
  	else
  		render :new
  	end
 end

 def update
 	@movie = Movie.find(params[:id])

 	if@movie.update_atrributes(movie_params)
 		redirect_to movie_path(@movie)
 	else
 		render :edit
 	end
 end

 def destroy
 	@movie = Movie.find(params[:id])
 	@movie.destroy
 	redirect_to movies_path
 end

 def search
  @movies = Movie.where("title LIKE ? AND director LIKE ? AND runtime_in_minutes LIKE ?", "%#{params[:q]}%", "%#{params[:p]}", "%#{params[:o]}") #called q because its short.
  render :index #calling index.html.erb
  
 end
 

 private

 def movie_params   #created so that user can only update column fields that we specify, security reasons. 
 	params.require(:movie).permit( #strong params, never trust what comes from client
 		:title, :release_date, :director, :runtime_in_minutes, :description, :image
 		)
 end

 

end

