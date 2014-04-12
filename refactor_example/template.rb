module Template
  def template(source_template, req_id)
    #template = String.new(source_template) ##No need because source_tempalte is being passed as a string

    # Substitute for %CODE%
    source_template.gsub!(/%CODE%/,req_id)

    # Substitute for %ALTCODE%
    source_template.gsub(/%ALTCODE%/, alter_req_id(req_id))
  end

  def alter_req_id(req_id)
    req_id[0..-3].insert(-4,"-")
  end
end
