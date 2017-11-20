class ListsController < ApplicationController
  before_action :find_list, :only => [:show, :edit, :update, :destroy, :done]

  def index
    # 依到期日 (due_date) 近到遠，取得 todos
    @lists = List.order(date: :asc)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_url, :notice => "成功新增一筆代辦事項！"
    else
      render :action => :new
    end
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to list_path(@list), :notice => "更新成功！"
    else
      render :edit
    end
  end

  def destroy
    if Time.current < @list.date
      @list.destroy
      flash[:notice] = "已刪除！"
    else
      flash[:notice] = "超過期限，無法刪除！"
    end

    redirect_to lists_url
  end

  def done
    @list.update(done: !(@list.done))
  end

  private

  def list_params
    params.require(:list).permit(:title, :date, :description)
  end

  def find_list
    @list = List.find(params[:id])
  end

end
