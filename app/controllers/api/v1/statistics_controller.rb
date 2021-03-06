module Api::V1
  class StatisticsController < ApplicationController
    def index
    end

    def dashboard
      # return unless params[:user]
      response = ClickhouseData.q1(params)
      # @data = JSON.parse(@response)
      @labels = response.first
      @values = response.last
      respond_to do |format|
        format.html { render(:text => "not implemented") }
        format.js { }
      end
    end
  end
end