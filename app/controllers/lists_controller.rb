class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    plist = List.new(upload_params)
    if @list.save
      redirect_to uploaded_lists_path
    end
  end


  def download
    filepath = Rails.root.join('app','downloads','master.txt')
    stat = File::stat(filepath)
    send_file(filepath, :filename => 'master.txt', :length => stat.size)
  end
  # def download
  #   filename = "#{params[:id]}.txt"
  #   filepath = Rails.root.join('app','downloads', filename)
  #   stat = File::stat(filepath)
  #   send_file(filepath, :filename => filename, :length => stat.size)
  # end
  
  private 
  
  def upload_params
    params.require(:list).permit(:user_id, :name, :details, :pdf_file)
  end

end
