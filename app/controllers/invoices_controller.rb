class InvoicesController < ApplicationController
    before_action @set_invoice, only: [:show, :update, :destroy, :edit]

    def index
        @query = Invoice.ransack(params[:q])
        @art = params[:q].blank? ? Invoice.none : @query.result(distinct: true)
        @invoices = Invoice.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
    def show
        
    end
    def edit

    end
    def update
        if @invoice.update(invoice_params)

        end
    end
    def new
        @invoice = Invoice.new
        @patient = Patient.find(params[:patient_id])
    end
    def create
        @invoice = Invoice.new(invoice_params)
        @pat = @invoice.patient_id
        if @invoice.save
            redirect_to patient_path(@pat), notice: "invoice was successfully created"
         else
            render :new
            flash[:alert] = "there was an error creating the invoice"
        end
    end
    def destroy
        @invoice.destroy
        if @invoice.deleted
            flash[:notice] = "invoice was successfully deleted"
        else
            flash[:alert] = "there was an error deleting the invoice"
        end
    end

    private 
    def set_invoice
        @invoice = Invoice.find(params[:id])
    end
    def invoice_params
        params.require(:invoice).permit(:description, :patient_id)
    end
end
