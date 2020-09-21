class ListsController < ApplicationController
  def new
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
end
