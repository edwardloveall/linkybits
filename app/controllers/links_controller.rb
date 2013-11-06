class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = find_link
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
    @link = find_link
  end

  def update
    @link = find_link
    if @link.update(link_params)
      redirect_to links_path
    else
      render :edit
    end
  end

  def destroy
    @link = find_link
    @link.destroy

    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :description, :user_id)
  end

  def find_link
    Link.find(params[:id])
  end
end
