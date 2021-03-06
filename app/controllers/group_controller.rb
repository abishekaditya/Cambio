class GroupController < ApplicationController
  before_action :user_authenticated!
  def new
    @group = Group.new
    @usergroup =UserGroup.new
  end

  def create

    @group = Group.new(name_params)
    @group.admin = current_user.id

    if @group.save

      redirect_to root_path
    else
      redirect_to group_new_path
      flash[:error] = "Unique group name needed"
    end

    @admin = UserGroup.create(:user_id => current_user.id, :group_id => @group.id)
    @matrix = GroupAccount.create(:group_id => @group.id,:matrix => [[0]], :mapper => {current_user.id => 0})
  end

  def index
    @ug = UserGroup.joins(:group).where(:user_id => current_user.id).select(:group_id)
    @group = Group.where(:id => @ug).order(:id)

    @user = Array.new

    @ug.each do |x|
      @ne = UserGroup.joins(:user).where(:group_id => x.group_id).select(:user_id)
      @user << User.where(:id => @ne).order(:id)
    end
  end

  def add
    @mygroups = Group.where(:admin => current_user.id)
    @usergroup = UserGroup.new
  end

  def adder
    @usergroup = UserGroup.new
    @usergroup.user_id = User.select(:id).where(:username => params[:username]).first.id
    @usergroup.group_id = params[:user][:group_id]

    @group_account = GroupAccount.where(group_id: params[:user][:group_id])
    @total = Group.find(params[:user][:group_id]).users.count
    
    @mapper = @group_account.first.mapper
    @current_table = YAML.load(@group_account.first.matrix)

    @current_table.each do |i|
      i << 0
    end
    @current_table << Array.new(@total+1, 0)

    @mapper[@usergroup.user_id] = @total

    @group_account.update(matrix: @current_table, mapper: @mapper)

    
    
    if @usergroup.save!
      redirect_to root_path
    else
      redirect_to group_add_path
      flash[:error] = "Not working"
    end
  end


  def show
    @x = []
    @group_members = UserGroup.where(group_id: params[:id])
    @member_count = @group_members.count

    @list = []
    @all_groups = UserGroup.where(user_id: current_user.id)
    @all_groups.each do |i|
      @list << i.group_id
    end

   @group = unless @list.include?(params[:id].to_i)
      redirect_to root_path
   end

  @group_account = GroupAccount.where(group_id: params[:id]).first
  @matrix = YAML.load(@group_account.matrix)
  end


  private
  def name_params
    params.require(:group).permit(:name)
  end

  def user_params
    params.require(:usergroup).permit(:user_id)
  end

end
