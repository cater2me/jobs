module Template
  def template(source_template, req_id)
    # Substitute for %CODE%
    template = source_template.gsub(/%CODE%/, req_id)

    # Substitute for %ALTCODE%
    altcode = req_id[0..4] + "-" + req_id[5..7]
    template.gsub!(/%ALTCODE%/, altcode)
  end
end
