module Template
  def template(source_template, req_id)
    # Substitute for %CODE%
    template = source_template.gsub(/%CODE%/, req_id).gsub(/%ALTCODE%/, altcode(req_id))
  end

  def altcode(req_id)
    req_id[0..4] + "-" + req_id[5..7]
  end
end
