class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.order('CASE WHEN priority IS NULL THEN 1 ELSE 0 END, priority')
    @tags = Tag.all.joins(:tickets).distinct('tags.id')
    @counts = Tag.all.joins(:tickets).group('tags.id').count

    if params[:user]
      if params[:user].to_i == -1
        @tickets = @tickets.where(user_id: nil)
      else
        @tickets = @tickets.where(user_id: params[:user])
      end
    end

    if params[:tag]
      tag = Tag.find(params[:tag])
      @tickets = @tickets.tagged_with(tag)
    end
  end

  def download_as_xls
    if user_signed_in?
      fname = Rails.root.join('public', 'downloads', "report_#{current_user.id}.xlsx")
      User.extract_tickets_to_excel(fname, current_user.id)
      send_file fname
    else
      raise 'Only signed in users can download their tickets'
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
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        if has_bad_words?(@ticket)
          puts "bad words found in ticket"
          flash[:alert] = 'Hey watch your tongue!'
        end
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    if !@ticket.user.nil? && (@ticket.user != current_user)
      raise 'Access Denied'
    end

    update_params = ticket_params
    if @ticket.user.nil?
      update_params[:user_id] = nil
    end

    respond_to do |format|
      if @ticket.update(update_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    if !@ticket.user.nil? && (@ticket.user != current_user)
      raise 'Access Denied'
    end

    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:priority, :header, :text).merge(user_id: current_user&.id)
  end

  def bad_words
    %w(dumb creepy jerk lame wimp stupid)
  end

  def has_bad_words?(ticket)
    bad_words.any? { |w| ticket.text.include?(w) }
  end
end
