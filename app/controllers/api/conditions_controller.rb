class Api::ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
  end
  def update
    
  end
end