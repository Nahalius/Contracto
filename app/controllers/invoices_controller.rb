class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    current_company = current_user.company
    @invoices = Invoice.all
    @agreemnts = current_company.clients
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @current_company = current_user.company
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",orientation: 'Landscape',zoom:  0.65   # Excluding ".pdf" extension.
        end
      end
  end

  # GET /invoices/new
  def new
    current_company = current_user.company
    @invoice = Invoice.new
    @users = current_company.users
    #@agreemnts = current_company.clients.agreemnts
  end

  # GET /invoices/1/edit
  def edit
    current_company = current_user.company
    @users = current_company.users
  end

  # POST /invoices
  # POST /invoices.json
  def create
    current_company = current_user.company
    @users = current_company.users
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    current_company = current_user.company
    @users = current_company.users
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:number, :date, :agreemnt_id, :amount, :manager, :text)
    end
end
