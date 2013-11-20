class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups
  end

  def show
    @group = find_group
    @links = @group.links
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = find_group
  end

  def update
    @group = find_group

    if @group.update(group_params)
      redirect_to edit_group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = find_group
    @group.destroy

    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    Group.find(params[:id])
  end
end
