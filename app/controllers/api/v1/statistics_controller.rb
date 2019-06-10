module Api::V1
  class StatisticsController < ApplicationController
    def index
    end

    def dashboard
      @response = ClickhouseData.q1
      # @data = JSON.parse(@response)
      respond_to do |format|
        format.html { render(:text => "not implemented") }
        format.js { }
      end
    end
  end
end