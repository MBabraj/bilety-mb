class TicketsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:index, :edit, :update, :destroy]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @ticket = Ticket.all
    # @event = Event.find(params[:event_id])
    # @ticket = @event.tickets
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
    @ticket = current_user.tickets.new
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
        redirect_to tickets_all_path, alert: "You can't remove tickets for past events."
        return
      end

      if !@ticket.to_return
        @ticket.to_return = true
        @ticket.save
        redirect_to tickets_all_path, notice: "You returned ticket."
        return
      else
        redirect_to tickets_all_path, alert: "You already returned ticket."
        return
      end
    end

    @ticket = Ticket.find(params[:id])

    if @ticket.event.event_date.past?
      redirect_to tickets_all_path, alert: "You can't remove tickets for past events."
      return
    end

    if @ticket.to_return
      redirect_to tickets_all_path, alert: "You can not remove this ticket."
      return
    end

    @money = @ticket.places * @ticket.event.price_low * 0.75
    @ticket.destroy

    @user = User.find(current_user.id)
    @user.money += @money
    @user.save

    redirect_to tickets_all_path, notice: "Ticket has been deleted."
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @event = @ticket.event
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @event, notice: 'Ticket was successfully created.' }
        format.json { render :'events/eventdet', status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :'events/eventdet', status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
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

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :seat_id_seq, :address, :price, :email_address, :places, :taken)
  end

  def correct_user
    if current_user.is_admin
      redirect_to events_path, alert: "Only administrator can do this!"
    end
  end


end
