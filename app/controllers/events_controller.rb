class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @events=Event.all
    
  end

  def show
    @event=Event.find(params[:id])
  end

  def new
    @newevent=Event.new
  end

  def create    
    event_params = params[:event]
    @newevent = Event.new(title: event_params[:title], description: event_params[:description], start_date: event_params[:start_date].to_datetime, duration: event_params[:duration], price: event_params[:price], location: event_params[:location], administrator: current_user)

    if @newevent.save 
      
      flash[:notice] = "Event successfully created"
      redirect_to root_path
    else
      render new_event_path
    end

  end

  def destroy
    @event=Event.find(params['id'])
    @event.destroy
    flash[:notice] = "Event successfully deleted"
    redirect_to root_path
  end
end
