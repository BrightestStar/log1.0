class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)

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
