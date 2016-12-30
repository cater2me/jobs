require 'spec_helper'

describe Post do
  let(:feed){FactoryGirl.create(:feed)}

  describe 'properties' do

    it {should respond_to :url}
    it {should respond_to :title}
    it {should respond_to :author}
    it {should respond_to :content}
    it {should respond_to :preview}
    it {should respond_to :feed}

    it {should validate_uniqueness_of(:url)}
    it {should validate_presence_of(:url)}
  end
end
