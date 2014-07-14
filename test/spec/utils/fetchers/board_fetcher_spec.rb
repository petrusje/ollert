require_relative '../../../../utils/fetchers/board_fetcher'

describe BoardFetcher do
  describe '#fetch' do
    it 'uses client to get member boards' do
      member_id = "bensisko"
      options = {filter: :open, fields: :name, organization: true}
      boards = "{{'organization': 'Starfleet', 'name': 'DS9', 'id': 'u19234e9jfd10'}}"

      client = double(Trello::Client)
      expect(client).to receive(:get).with("/members/#{member_id}/boards", options).and_return(boards)

      expect(BoardFetcher.fetch(client, member_id)).to eq boards
    end
  end
end