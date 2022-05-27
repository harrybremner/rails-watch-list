class ReviewsController < ApplicationController

  before_action :set_list, only: %i[new create]

  def new
    @review = Review.new # Needed to instantiate the form_for
  end

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # No need for app/views/reviews/destroy.html.erb
    redirect_to list_path, status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
