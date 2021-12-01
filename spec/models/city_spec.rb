require 'rails_helper'

RSpec.describe City, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:country) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
