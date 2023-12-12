module Api
  module V1
    class EventPolicy < ApplicationPolicy

      def edit?
        record.organizer == user
      end

      def update?
        edit?
      end

      def destroy?
        edit?
      end
    end
  end
end
