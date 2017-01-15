class TransactionController < ApplicationController
  before_action :user_authenticated!

  def show
  end

  def new
    @list = []
    
    UserGroup.where(user_id: current_user.id).each do |i|
    	@list << i.group_id
    end

    @group = unless @list.include?(params[:id].to_i)
    	redirect_to root_path
    else
    	Group.find params[:id]
    end
  end

  def transact

  	@from = current_user.id
  	@to = params[:group_account][:to_id].to_i
  	@amount = params[:amount].to_f
  	@group_id = params[:id].to_i

  	@group_account = GroupAccount.where(group_id: @group_id).first
  	@mapper = @group_account.mapper
  	@matrix = YAML.load(@group_account.matrix)

  	@matrix[@mapper[@from]][@mapper[@to]] += @amount

  	@group_account.update(matrix: @matrix)

  	redirect_to root_path
  	byebug
  	end
end

