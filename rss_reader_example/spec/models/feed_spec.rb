require 'spec_helper'

describe Feed do
  let(:feed){FactoryGirl.create(:feed)}
  subject{feed}
  it {should respond_to :url}
  it {should respond_to :title}
  it {should respond_to :posts}

  it {should validate_uniqueness_of(:url)}
  it {should validate_presence_of(:url)}
end
