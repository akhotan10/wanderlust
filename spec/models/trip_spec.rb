require 'rails_helper'

RSpec.describe Trip, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:highlights) }

    it { should have_many(:activities) }

    it { should have_many(:eating_lists) }

    it { should have_many(:itineraries) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
