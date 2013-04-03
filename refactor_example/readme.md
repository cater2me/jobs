# Full Stack Engineer Development Challenge (what I did..)

### Refactoring

I refactored the method #template. Originally, it looked like this...

````ruby
def template(source_template, req_id)
  template = String.new(source_template)

  # Substitute for %CODE%
  template_split_begin = template.index("%CODE%")
  template_split_end = template_split_begin + 6
  template_part_one =
    String.new(template[0..(template_split_begin-1)])
  template_part_two =
    String.new(template[template_split_end..template.length])
  code = String.new(req_id)
  template =
    String.new(template_part_one + code + template_part_two)

  # Substitute for %ALTCODE%
  template_split_begin = template.index("%ALTCODE%")
  template_split_end = template_split_begin + 9
  template_part_one =
    String.new(template[0..(template_split_begin-1)])
  template_part_two =
    String.new(template[template_split_end..template.length])
  altcode = code[0..4] + "-" + code[5..7]
  template_part_one + altcode + template_part_two
end
````
The problem with the above code is that it does simple things in a very simple way. It's very middle school level and does not take advantage of constructs and libraries built into Ruby.

For example, the first section of code under the first comment is simply trying to replace %CODE% with another string (req_id). However, the programmer went about it by spliting the string up into 2 sections (before %CODE% and after) and then simply concatenated the two strings together with the req_id in the middle. This is also similar to what is happening in the second block of code under the second comment. In this case, the programmer is also playing with the alternate representation of the code to put a dash in the middle. 

One ugly thing about this code is that it is using String.new a lot when it is not needed. If we were truly manipulating the strings we might need copies of the originals, but we are not doing that. As long as the method we call on the string isn't a destructive (bang!) method, the return value will reflect the message sent to the object, but the original object will remain in tact. 

Instead of searching for the %CODE% string via #index, I simply used gsub which takes a regular express, and a string to replace any matches of that regex in the string that gsub was called on. Chaining two calls to #gsub together allows us to ultimately return a string that replaces %CODE% and %ALTCODE% with the proper strings. The test given in the example passes with my code, shown below. 

````ruby
def template(source_template, req_id)
  # Substitute for %CODE%
  template = source_template.gsub(/%CODE%/, req_id).gsub(/%ALTCODE%/, altcode(req_id))
end

def altcode(req_id)
  req_id[0..4] + "-" + req_id[5..7]
end
````

I factored altcode into it's own method because it's a bit different than the regular code. If I were to ever wish to represent the altcode in a different way, all I would have to do is change this function.