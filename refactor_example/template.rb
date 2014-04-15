module Template
  def insert_codes(source_template, req_id)
    # Substitute for %CODE%
    code_substitute(source_template, req_id)
    alt_substitute(source_template, req_id)
    # Substitute for %ALTCODE%
  end

  def code_substitute(source_template, req_id)
    source_template.gsub!(/%CODE%/,req_id)
  end

  def alt_substitute(source_template, req_id)
    source_template.gsub(/%ALTCODE%/, alter_req_id(req_id))
  end

  def alter_req_id(req_id)
    req_id[0..-3].insert(-4,"-")
  end
end
