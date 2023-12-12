# spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
  end

  describe 'associations' do
    it { should belong_to(:organizer).class_name('User') }
    it { should have_many(:event_participants).dependent(:destroy) }
    it { should have_many(:joiners).through(:event_participants) }
  end

  describe 'scopes' do
    let!(:older_event) { create(:event, created_at: 1.day.ago) }
    let!(:newer_event) { create(:event, created_at: 1.hour.ago) }

    it 'orders events by descending ID' do
      expect(Event.id_ordered_desc).to eq([newer_event, older_event])
    end
  end
end
