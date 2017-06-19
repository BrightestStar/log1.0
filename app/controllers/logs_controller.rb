class LogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @logs = Log.all
  end

  def new
    @log = current_user.logs.build
  end

  def create
    @log = current_user.logs.build(log_params)

    if @log.save
      redirect_to logs_path
    else
      render :new
    end
  end

  def show
    @log = Log.find(params[:id])
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])

    if @log.update(log_params)
      redirect_to logs_path
    else
      render :edit
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to logs_path, notice: "Deleted!"
  end

  private

  def log_params
    params.require(:log).permit(:title, :body)
  end

end
