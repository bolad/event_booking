require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '#validations' do

     it { should belong_to(:event) }
     it { should belong_to(:user) }

  end

end
