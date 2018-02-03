class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:index]

  # GET /tickets
  # GET /tickets.json
  def index
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets
  end

  def all
    if current_user.is_admin
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets
    end

  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json


  def destroy
    if current_user.is_admin
      @ticket = current_user.tickets.find(params[:id])

      if @ticket.event.event_date.past?
        redirect_to tickets_all_path, alert: "You can not remove tickets for events from past."
        return
      end

      if !@ticket.to_return
        @ticket.to_return = true
        @ticket.save
        redirect_to tickets_all_path, notice: "Your ticket has been marked to return."
        return
      else
        redirect_to tickets_all_path, alert: "Your ticket is already marked to return."
        return
      end
    end

    @ticket = Ticket.find(params[:id])

    if @t.event.event_date.past?
      redirect_to tickets_all_path, alert: "You can not remove tickets for events from past."
      return
    end

    if @ticket.to_return
      redirect_to tickets_all_path, alert: "You can not remove this ticket."
      return
    end

    @money = @ticket.places * @tticket.event.price * 0.75
    @ticket.destroy

    @user = User.find(current_user.id)
    @user.money += @money
    @user.save

    redirect_to tickets_all_path, notice: "Ticket has been deleted."
  end

  def create
    @event = Event.find(params[:event_id])

    @params = ticket_params
    @params["event_id"] = params[:event_id]
    @params["user_id"] = current_user.id

    # check if event is not from past
    # if @event.event_date.past?
    #   redirect_to event_path(@event), alert: "You can not buy tickets for events from past!"
    #   return
    # end

    # if (@event.event_date - Date.today).to_i > 31
    #   redirect_to event_path(@event), alert: "You can buy ticket only month before event."
    #   return
    # end

    # check if user has already ticket for this event
    # if @event.tickets.exists?(user_id: current_user.id)
    #   redirect_to event_path(@event), alert: "You already have ticket for this event!"
    #   return
    # end

    @ticket = Ticket.new(@params)

    #check if ticket has valid places number
    # if @ticket.places < 1 || @ticket.places > 5
    #   redirect_to event_path(@event), alert: "Invalid number of places!"
    #   return
    # end

    # check if user has enough money
    # if @ticket.places * @event.price_low > current_user.money
    #   redirect_to event_path(@event), alert: "You don't have enough money!"
    #   return
    # end

    # check if there are enough places
    # @taken = 0
    # @event.tickets.each do |ticket|
    #   @taken += ticket.places
    # end

    # if @event.size - @taken < @ticket.places
    #   redirect_to event_path(@event), alert: "There are not enough places left for this event."
    #   return
    # end

    if @ticket.save
      @user = User.find(current_user.id)
      @user.money -= @ticket.places * @event.price_low
      @user.save
      redirect_to event_path(@event), notice: "You bought new ticket."

    else
      @error_text = ""
      @ticket.errors.full_messages.each {|m| @error_text += m + ". "}
      redirect_to event_path(@event), alert: @error_text

    end
  end


  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json

  # DELETE /tickets/1 # def destroy
  #   @ticket.destroy
  #   respond_to do |format|
  #     format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  # DELETE /tickets/1.json


  def ticket_params
    params.require(:ticket).permit(:name, :seat_id_seq, :address, :price, :email_address, :places, :taken)
  end

  def correct_user
    if current_user.is_admin
      redirect_to events_path, alert: "Only administrator can do this!"
    end
  end

end
