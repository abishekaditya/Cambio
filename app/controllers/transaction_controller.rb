class TransactionController < ApplicationController
  before_action :user_authenticated!
  require 'cambio'

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

    @nmatrix = NMatrix.new(@matrix.count,@matrix.flatten)

    @min = Money.new(@nmatrix).answer



    @group_account.update(matrix: @min)


    redirect_to root_path

  end
end
