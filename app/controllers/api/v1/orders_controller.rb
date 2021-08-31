class Api::V1::OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]

    def index
        @orders = Order.where(property_id: params[:property_id])
        render json: @orders
    end

    def show
        render json: @order
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            render json: @order
        else
            render error: { error: 'error creating new order'}, status: 400
        end
    end

    def update
        if @order
            @order.update(order_params)
            render json: {message: 'Order updated'}, status: 200
        else
            render error: { error: 'error updating order'}, status: 400
        end
    end

    def destroy
        if @order
            @order.destroy
            render json: {message: 'Order deleted'}, status: 200
        else
            render error: { error: 'error deleting order'}, status: 400
        end
    end

    private

    def set_order
        @order = Order.find(params[:id])
    end

    def order_params
        params.require(:order).permit(
            :order_status, :order_type, :property_id, :description
        )
    end
end
