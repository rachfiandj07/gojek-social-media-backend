require_relative '../../app/helpers/customSuccessMessage.rb'
 
describe CustomSuccessMessage do
    it 'should raise sucess custom message ' do
        customSucessMessage = CustomSuccessMessage.new('Success', 201)

        expect(customSucessMessage.message).to eq('Success')
        expect(customSucessMessage.status).to eq(201)
    end
end
