module Template
  def template(source_template, req_id)
	#Instead of finding the positions of %CODE% and %ALTCODE% and then breaking string into chunks and then joining again,
	#it is easier and simpler to use regular expression to search pattern and replace
    source_template.gsub(/%CODE%/, req_id).gsub(/%ALTCODE%/, req_id[0..4]+'-'+req_id[5..7])
  end   
end
