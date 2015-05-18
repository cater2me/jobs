module Template
  def template(source_template, req_id)
    # make use of existing variables
    template = String.new(source_template)
    code     = String.new(req_id)
    altcode  = code[0..4] + "-" + code[5..7]

    # simplify the replacement code using gsub with provided variables
    template.gsub('%CODE%', code).gsub('%ALTCODE%', altcode)
  end
end
