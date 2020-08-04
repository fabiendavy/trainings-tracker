class TrainingsController < ApplicationController
  def index
    @training = Training.new
  end
end
