require_relative 'template'
require_relative 'spec_helper'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', 5678901234).should == 'Code is 5678901234; alt code is 56789-012'
  end

end
