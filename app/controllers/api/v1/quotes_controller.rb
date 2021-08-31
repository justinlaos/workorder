class Api::V1::QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :update, :destroy]

    def index
        @quotes = Quote.where(order_id: params[:order_id])
        render json: @quotes
    end

    def show
        render json: @quote
    end

    def create
        @quote = Quote.new(quotes_params)
        if @quote.save
            render json: @quote
        else
            render error: { error: 'error creating new quote'}, status: 400
        end
    end

    def update
        if @quote
            @quote.update(quotes_params)
            render json: {message: 'Quote updated'}, status: 200
        else
            render error: { error: 'error updating quote'}, status: 400
        end
    end

    def destroy
        if @quote
            @quote.destroy
            render json: {message: 'Quote deleted'}, status: 200
        else
            render error: { error: 'error deleting quote'}, status: 400
        end
    end

    private

    def set_property
        @quote = Quote.find(params[:id])
    end

    def quotes_params
        params.require(:quote).permit(
            :time_est, :price_est, :order_id, :selected
        )
    end
end
