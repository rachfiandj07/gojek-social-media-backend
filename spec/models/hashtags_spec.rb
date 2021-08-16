require_relative '../../models/hashtags.rb'

describe Hashtags do
    before :each do
        @stub_client = double()
        @hashtags = Hashtags.new(hashtag_id: 1, name: '#gigih', createdAt: '2021-08-15 00:51:03', updatedAt: '2021-08-15 00:51:03')
        @response = {
            "hashtag_id" => 1, 
            "name" => 1, 
            "createdAt" => '2021-08-15 00:51:03',
            "updatedAt" => '2021-08-15 00:51:03'
        }
        allow(Mysql2::Client).to receive(:new).and_return(@stub_client)
    end

    context 'post' do
        describe 'given valid params' do
            it 'should create hashtag' do
                stub_query = "INSERT INTO hashtags (name) VALUES ('#{@hashtags.name}')"
                stub_query_last_insert = "SET @id = LAST_INSERT_ID();"
                stub_query_response = "SELECT * FROM hashtags WHERE hashtag_id = @id"
                expect(@stub_client).to receive(:query).with(stub_query)
                expect(@stub_client).to receive(:query).with(stub_query_last_insert)
                expect(@stub_client).to receive(:query).with(stub_query_response)

                expect(stub_query).to eq(@response)

                @hashtags.post
            end
        end
    end

    context 'post hashtag' do
        describe 'given valid params' do
            it 'should create post hastag' do
                stub_query = "INSERT INTO post_hashtags (hashtag_id,post_id) VALUES (#{@hashtags.hashtag_id},1)"
                expect(@stub_client).to receive(:query).with(stub_query)
                
                @hashtags.post_hashtag(1)
            end
        end
    end
end