class AgreemntsController < ApplicationController
  before_action :set_agreemnt, only: [:show, :edit, :update, :destroy]

  # GET /agreemnts
  # GET /agreemnts.json
  def index
    current_company = current_user.company
    @agreemnts = Agreemnt.includes(:invoices, :payments)


  end

  # GET /agreemnts/1
  # GET /agreemnts/1.json
  def show
    @agreemnt = Agreemnt.find(params[:id])

    if @agreemnt.agreemnt_type == "МСС"

      @standards  = "Международни стандарти за финасови отчети"
      @balance    = "отчет за финансовото състояние"
      @opr        = "отчет за доходите"
      @osk        = "отчет за промените в собствения капитал"
    else
      @standards  = "Национални стандарти за финансови отчети за малки и средни предприятия"
      @balance    = "баланс"
      @opr        = "отчет за приходите и разходите"
      @osk        = "отчет за собствения капитал"
    end
  end

  # GET /agreemnts/new
  def new
    current_company = current_user.company
    @agreemnt = Agreemnt.new
    @users = current_company.users
    @clients = current_company.clients
  end

  # GET /agreemnts/1/edit
  def edit
    current_company = current_user.company
    @users = current_company.users
    @clients = current_company.clients
  end

  # POST /agreemnts
  # POST /agreemnts.json

  def report
    current_company = current_user.company
    @agreemnts = Agreemnt.where(closed: false).includes(:invoices, :payments)

  end


  def create
    current_company = current_user.company
    @users = current_company.users
    #@clients = current_company.clients

    @agreemnt = Agreemnt.new(agreemnt_params)

    respond_to do |format|
      if @agreemnt.save
        format.html { redirect_to @agreemnt, notice: 'Agreemnt was successfully created.' }
        format.json { render :show, status: :created, location: @agreemnt }
      else
        format.html { render :new }
        format.json { render json: @agreemnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreemnts/1
  # PATCH/PUT /agreemnts/1.json
  def update
    current_company = current_user.company
    @users = current_company.users
    @clients = current_company.clients
    respond_to do |format|
      if @agreemnt.update(agreemnt_params)
        format.html { redirect_to @agreemnt, notice: 'Agreemnt was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreemnt }
      else
        format.html { render :edit }
        format.json { render json: @agreemnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreemnts/1
  # DELETE /agreemnts/1.json
  def destroy
    @agreemnt.destroy
    respond_to do |format|
      format.html { redirect_to agreemnts_url, notice: 'Agreemnt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreemnt
      @agreemnt = Agreemnt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreemnt_params
      params.require(:agreemnt).permit(:name, :date, :client_id, :amount, :budget_hours, :manager, :agreemnt_type, :closed)
    end
end
