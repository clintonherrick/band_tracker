require('spec_helper')

  describe(Venue) do
    it {should have_and_belong_to_many(:bands)}
  end
  describe 'callback' do
      it 'capitalizes venue name' do
        Venue1 = Venue.create({:description => 'the silver dollar'})
        expect(band1.description).to eq 'The Silver Dollar'
      end
    end
