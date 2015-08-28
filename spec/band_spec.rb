require('spec_helper')

  describe(Band) do
    it {should have_and_belong_to_many(:venues)}
  end
  describe 'callback' do
      it 'capitalizes every band name' do
        band1 = Band.create({:description => 'langhorn slim'})
        expect(band1.description).to eq 'Langhorn Slim'
      end
    end
