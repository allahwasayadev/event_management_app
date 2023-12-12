module Api
  module V1
    class EventsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_event, only: [:show, :edit, :update, :destroy, :join, :unjoin]

      def index
        @events = Event.all.id_ordered_desc
        respond_to do |format|
          format.html
          format.json { render json: @events }
        end
      end

      def show
        respond_to do |format|
          format.html
          format.json { render json: @event }
        end
      end

      def new
        @event = current_user.organized_events.new
      end

      def create
        @event = current_user.organized_events.new(event_params)
        if @event.save
          respond_to do |format|
            format.turbo_stream
            format.json { render json: @event, status: :created, location: api_v1_event_url(@event) }
          end
        else
          respond_to do |format|
            format.turbo_stream
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end

      def edit
        authorize @event
      end

      def update
        authorize @event
        if @event.update(event_params)
          respond_to do |format|
            format.turbo_stream
            format.json { render json: @event, status: :accepted }
          end
        else
          respond_to do |format|
            format.turbo_stream
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        authorize @event
        @event.destroy
        respond_to do |format|
          format.turbo_stream
          format.json { head :no_content }
        end
      end

      def join
        @event.joiners << current_user
        respond_to do |format|
          format.turbo_stream
          format.json { render json: @event, status: :accepted }
        end
      end

      def unjoin
        @event.joiners.delete(current_user)
        respond_to do |format|
          format.turbo_stream
          format.json { render json: @event }
        end
      end

      private
        def set_event
          @event = Event.find(params[:id])
        end

        def event_params
          params.require(:event).permit(:name, :description, :date, :location, :organizer_id)
        end
    end
  end
end
