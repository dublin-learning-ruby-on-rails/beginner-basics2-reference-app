class PostsController < ApplicationController
  before_action :authorise
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  around_action :use_different_database, only: :index2

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/index2
  def index2
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def use_different_database
    ActiveRecord::Base.establish_connection(:development2)
    yield
    ActiveRecord::Base.establish_connection(Rails.env)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authorise
    case action_name
    when 'index', 'show'
      # continue with the action
    when 'new', 'create', 'edit', 'update', 'destroy'
      unless user_signed_in? && current_user.is_admin?
        render html: 'Unauthorised Access', status: :forbidden
      end
    end
  end

end
