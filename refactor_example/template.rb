module Template
  def template(source_template, req_id)


    # Two assumptions
    # 1. All the occurances of %CODE% and %ALTCODE% is replaced.
    # 2. Replacement is case sensitive

    # For %CODE% we are only replacing it with req_id,
    # Following gsub! function does the same.
    
    # Since there is no rule specifying dividing req_id;
    # I am assuming that if total number of digits in number < 5 then,
    # Only the first part with '-'' becomes replacement code
    altcode = req_id[0..4].to_s + "-" + req_id[5..7].to_s
    # First gsub substitute %CODE% and second %ALTCODE%
    source_template.gsub(/%CODE%/,req_id).gsub(/%ALTCODE%/,altcode)
  end
end


# This is how modules can be included
class RunTemplate
  include Template

end

class RunTemplate1
  extend Template
end

puts RunTemplate.new.template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')

puts RunTemplate1.template('Code is %CODE%; alt code is %ALTCODE%, Again Code is %CODE; alt code is %ALTCODE%',
     '5678901234')