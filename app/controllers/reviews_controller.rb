class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
  	@review = Review.new(review_params)
    @reviews = Review.all
  	if @review.save
  	 redirect_to review_path(@review.id), notice: 'Book was successfully created.'
    else
    render action: :index
    end
  end

  def index
  	@reviews = Review.all
  	@review = Review.new
  end

  def show
  	@review = Review.find(params[:id])
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  	@review = Review.find(params[:id])
  	if @review.update(review_params)
  	redirect_to review_path, notice: 'Book was successfully updated.'
    else
     render action: :edit
    end
  end

  def destroy
	  review = Review.find(params[:id])
    review.destroy
  	redirect_to reviews_path, notice: 'Book was succesfully destroyed.'
  end





  private

  def review_params
  	  params.require(:review).permit(:title, :review)
  end


end
