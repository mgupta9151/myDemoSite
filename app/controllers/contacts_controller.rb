class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token 
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def get_state
    if params[:country].present?
       state = CS.states(params[:country].to_sym).map{|x| [x[0],x[1]]}
       render json: {"data" => state}
    end     
  end
  def get_city
    if params[:state].present?
       city = CS.cities(params[:state].to_sym)
       render json: {"data" => city}
    end     
  end

  private
   
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :country, :state, :city, :subject)
    end
end
