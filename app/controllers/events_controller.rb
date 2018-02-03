class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :create, :update, :destroy]
  # before_action :admin_user, :only => [:new, :create, :destroy, :edit]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    puts @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    @taken = 0
    @event.tickets.each do |ticket|
      @taken += ticket.places
    end
    @available = @event.size - @taken
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    #@event = current_user.events.build(event_params)
    @event = current_user.events.build(params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date, :image,
                                                     :for_adult, :size))

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    @available = @event.size
    @taken = 0
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:artist, :event_date, :description, :image, :price_low, :price_high, :size, :available, :taken)
  end

  def correct_user
    if current_user.is_admin
      redirect_to events_path, alert: "Only administrator can perform this action!"
    end
  end

  # def admin_user
  #   authenticate_or_request_with_http_basic("Ads") do |username, password|
  #     username == "admin" && password == "admin"
  #   end
  # end
  #
  # def is_admin?
  # end

end
