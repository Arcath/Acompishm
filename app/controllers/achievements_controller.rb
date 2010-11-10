class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
  end
  
  def show
    @achievement = Achievement.find(params[:id])
  end
  
  def new
    @achievement = Achievement.new
  end
  
  def create
    @achievement = Achievement.new(params[:achievement])
    if @achievement.save
      flash[:notice] = "Successfully created achievement."
      redirect_to @achievement
    else
      render :action => 'new'
    end
  end
  
  def edit
    @achievement = Achievement.find(params[:id])
  end
  
  def update
    @achievement = Achievement.find(params[:id])
    if @achievement.update_attributes(params[:achievement])
      flash[:notice] = "Successfully updated achievement."
      redirect_to @achievement
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy
    flash[:notice] = "Successfully destroyed achievement."
    redirect_to achievements_url
  end
end
