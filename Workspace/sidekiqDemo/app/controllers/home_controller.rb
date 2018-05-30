class HomeController < ApplicationController
  def index
  HardWorker.perform_async('abc')
 end
end
 