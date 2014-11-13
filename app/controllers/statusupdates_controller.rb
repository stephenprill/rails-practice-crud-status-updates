class StatusupdatesController < ApplicationController
  def index
    @statusupdates = Statusupdate.all
  end

  def new
    @statusupdate = Statusupdate.new
  end

  def create
    @statusupdate = Statusupdate.new(params.require(:statusupdate).permit(:status, :user, :likes))
  if @statusupdate.save
    redirect_to statusupdates_path, notice: 'Event was succussfully created.'
  else
    render :new
  end
  end

  def show
    @statusupdate = Statusupdate.find(params[:id])
  end

  def edit
    @statusupdate = Statusupdate.find(params[:id])
  end

  def update
    @statusupdate = Statusupdate.find(params[:id])
    if @statusupdate.update(params.require(:statusupdate).permit(:status, :user, :likes))
      redirect_to statusupdates_path, notice: 'Event was successfully updated.'
    else
      render :edit
  end
  end

  def destroy
    @statusupdate = Statusupdate.find(params[:id])
    @statusupdate.destroy
    redirect_to statusupdates_path, notice: 'Event was successfully deleted.'
  end

end
