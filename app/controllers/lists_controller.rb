class ListsController < ApplicationController
  def new
  end

  def download
    download_file_name = "public/master/master.txt"
    send_file download_file_name
  end
end
