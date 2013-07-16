require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute %CODE% but not %ALTCODe% in the template" do
    template('Code is %CODE%; alt code is %ALTCODe%', '5678901234').should == 'Code is 5678901234; alt code is %ALTCODe%'
  end

  it "should substitute %CODE% and %ALTCODE% in the template twice" do
    template('Code is %CODE%; alt code is %ALTCODE%, Again Code is %CODE%; alt code is %ALTCODE%',
     '5678901234').should == 'Code is 5678901234; alt code is 56789-012, Again Code is 5678901234; alt code is 56789-012'
  end

	it "should substitute %CODE% and %ALTCODE% in the template even if number is <4" do
    template('Code is %CODE%; alt code is %ALTCODE%', '124').should == 'Code is 124; alt code is 124-'
  end

  it "should substitute %CODE% and %ALTCODE% in the template even if number is >4 but <7" do
    template('Code is %CODE%; alt code is %ALTCODE%', '1234509').should == 'Code is 1234509; alt code is 12345-09'
  end

  it "should substitute %CODE% only in the template" do
    template('Code is %CODE%', '12341234').should == 'Code is 12341234'
  end 
end
