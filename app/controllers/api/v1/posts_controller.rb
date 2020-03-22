class Api::V1::PostsController < ApiController
  before_action :validate_empty_params, only: %i[create]

  def index
    @posts = Post.limit(params['limit']).order(avg_rating: :desc)
    render json: @posts.map { |i| [i.title].push(i.content) }.flatten
  end

  def create
    @post = Post.new(post_params.merge(
                       user_id: User.find_or_create_by(login: params['login']).id,
                       ip: request.remote_ip
                     ))

    if @post.save
      render json: { status: 200, data: { title: @post.title, content: @post.content, ip: @post.ip.to_s } }, status: :ok
    else
      render json: { status: 422, message: @post.errors }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def validate_empty_params
    if params['post'].empty?
      render json: {
        status: 422,
        message: { "title": ["can't be blank"], "content": ["can't be blank"] }
      }, status: :unprocessable_entity
    end
  end
end
