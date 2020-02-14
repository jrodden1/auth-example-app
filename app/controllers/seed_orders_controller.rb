class SeedOrdersController < ApplicationController
   # load_and_authorize_resource
   load_resource
   authorize_resource except: [:edit]
   
   def index
      @seed_orders = SeedOrder.accessible_by(current_user.ability)
   end

   def edit
      authorize :read, SeedOrder
      @seed_order = SeedOrder.find(params[:id])
   end
end
