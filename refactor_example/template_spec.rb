require_relative 'template'
require 'byebug'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')). to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute a code into the string" do
    expect(substitute_code('Code is %CODE%', '%CODE%', '5678901234')). to eq 'Code is 5678901234'
    expect(substitute_code('; alt code is %ALTCODE%','%ALTCODE%','56789-012')). to eq '; alt code is 56789-012'
  end
end
