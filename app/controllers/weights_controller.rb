class WeightsController < ApplicationController

  def index
    @weights = current_user.weights
    xAxis_categories = @weights.map(&:created_at)
    tickInterval     = 1
    data             = @weights.map(&:weight)
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "#{current_user.name}さんの体重推移")
      f.xAxis(categories: xAxis_categories, tickInterval: tickInterval)
      f.series(name: '体重', data: data, type: 'line')
    end
  end

  def new
    @weight = Weight.new
  end

  def create
    Weight.create(weight: weight_params[:weight], user_id: current_user.id)
    redirect_to root_url
  end

  def destroy
    weight = Weight.find(params[:id])
    weight.destroy if weight.user_id == current_user.id
  end

  private
  def weight_params
    params.require(:weight).permit(:weight)
  end
end