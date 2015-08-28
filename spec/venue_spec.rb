require('spec_helper')

  describe(Venue) do
    it {should have_and_belong_to_many(:bands)}
  end

  describe 'validate' do
   it 'validates the presence of a venue' do
     venue = Venue.new({description: ''})
     expect(venue.save()).to eq false
   end
 end



  describe 'callback' do
      it 'capitalizes venue name' do
        Venue1 = Venue.create({:description => 'the silver dollar'})
        expect(band1.description).to eq 'The Silver Dollar'
      end
    end
