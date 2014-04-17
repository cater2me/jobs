module Template
  def template(source_template, req_id)
    template = String.new(source_template)
  
    # get code and altcode
    code = String.new(req_id) 
    altcode = code[0..4] + "-" + code[5..7]
  
    # substitutes codes into template using gsub
    template.gsub("%CODE%", code).gsub("%ALTCODE%", altcode)
  end
end
