class Api::ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
  end
  def update
    weather(SC)
    condition('sc')
    weather(WB_NE)
    condition('wb_ne')
    weather(WB_SE)
    condition('wb_se')
    weather(CB)
    condition('cb')
  end
end