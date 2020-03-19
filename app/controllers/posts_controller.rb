class PostsController < ApplicationController
  before_action :find_post,only: [:show,:edit,:update,:destroy,:upvote,:downvote]
  before_action :authenticate_user!,except: [:index,:show]
  def index
    #align all posts in recently created  to old posts
    @posts = Post.all.order("created_at DESC")

  end

  def show
    @comments = Comment.where(post_id: @post)
    @random_post = Post.where.not(id: @post).order("rand()").first

  end

  def new
    #current user checks if there is user id in the post inorder to create new post
    @post=current_user.posts.build
  end

  def create
    #a post can have a only a title, description,link for a current signed up user
    @post=current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def upvote
    @post.upvote_by current_user
    redirect_to post_path
  end

  def downvote
    @post.downvote_by current_user
    redirect_to post_path
  end

  def edit
  end

  def update
    #autofill the title,description,link and any edit and save can be done
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    #delete the current post

    @post.destroy
    redirect_to root_path
  end

  def find
  end

  private

  def find_post
    #find the post with post with post id
    @post=Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:link,:description,:image)
  end
end
