class TechnicalDataSheetsController < ApplicationController
  
  layout "empty"

  def index

    @tds = Customer.find_by_id(session[:user].id).products.find_by_id(params[:product_id]).technical_data_sheets.new
    @product_id = params[:product_id]

  end

  def create

    @tds = Customer.find_by_id(session[:user].id).products.find_by_id(params[:tds][:product_id]).technical_data_sheets.create( params[:tds] )

    if @tds.save

      flash[:message]  = @tds.tds_file_name + " Uploaded Successful."
      redirect_to :action => 'index', :product_id => params[:tds][:product_id]

    else
      flash[:message]  = "Upload Failed. Please try again."
      redirect_to :action => 'index'
    end
    
  end


  def product_tds_delete

    @tds = Customer.find_by_id(session[:user].id).products.find_by_id(params[:product_id]).technical_data_sheets.find_by_id( params[:tds_id] )

    if @tds.destroy

      respond_to do |format|
        format.html { redirect_to products_path }
        format.js
        # format.json { render :json => {:name2 => 'John'} }
      end

    else
      
      respond_to do |format|
        format.html { redirect_to products_path }
        format.js
        # format.json { render :json => {:name2 => 'John'} }
      end
      
    end

  end

  def admin_product_tds_upload


    @tds = Customer.find_by_id(params[:customer_id]).products.find_by_id(params[:product_id]).technical_data_sheets.new
    @customer_id = params[:customer_id]
    @product_id = params[:product_id]

  end

  def admin_product_tds_create
    
    @tds = Customer.find_by_id(params[:customer_id]).products.find_by_id(params[:tds][:product_id]).technical_data_sheets.create( params[:tds] )

    if @tds.save

      flash[:message]  = @tds.tds_file_name + " Uploaded Successful."
      redirect_to :action => 'admin_product_tds_upload', :product_id => params[:tds][:product_id], :customer_id => params[:customer_id]

    else
      flash[:message]  = "Upload Failed. Please try again."
      redirect_to :action => 'admin_product_tds_upload'
    end


  end

  def admin_product_tds_delete

    @tds = Customer.find_by_id(params[:customer_id]).products.find_by_id(params[:product_id]).technical_data_sheets.find_by_id(params[:tds_id] )

    if @tds.destroy

      respond_to do |format|
        format.html  { redirect_to admins_path }
        format.js
     
      end

    else

      respond_to do |format|
        format.html { redirect_to admins_path }
        format.js
      
      end

    end

  end

  
end
