class Api::V1::RatingsController < ApiController
  def create
    @rating = Rating.new(rating_params.merge(post_id: params['post_id']))

    if @rating.save
      render json: { status: 200, avg_rating: Post.find(params['post_id']).rating.average(:point).to_f }, status: :ok
    else
      render json: { status: 422, message: @rating.errors }, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:point)
  end
end
