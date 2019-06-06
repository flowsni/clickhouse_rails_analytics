module Api::V1
  class StatisticsController < ApplicationController
    def index
    end

    def dashboard
      @response = ClickhouseData.get_data

      binding.pry
      respond_to do |format|
        format.html { render(:text => "not implemented") }
        format.js { }
      end
    end
  end
end