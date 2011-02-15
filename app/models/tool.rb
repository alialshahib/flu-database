#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Source file for the SAIRD tool definitions.

### IMPORTS

require('dev_tools')


### CONSTANTS & DEFINES

TOOL_FORM_ENUM = ToolForms.all_tool_forms.collect { |f| f.id }
pp TOOL_FORM_ENUM


### IMPLEMENTATION

# A a mini application or form for using website functionality.
#
# This is somewhat hacky. As "tools" are not really user data, or data in any
# sense, they should really be tableless resourcesor models. That is, they
# should be routed to appropriately and have a state, but there is no need for
# them to be represented in the database or for them to be created, editted, etc.
#
# But ...
#
# Hobo models get a lot for free - the indexes, the look-and-feel, auto-generated
# tags and pages, security, etc.. Also, making a tableless hobo model is _hard_.
# There is some prior art for tabless rails models but gives us little but
# routing. Also, being able to switch tools on or off may be useful. Thus, we
# take the hacky way and let the tools be a proper model.
#
class Tool < ActiveRecord::Base

  hobo_model # Don't put anything above this

  ## Fields & relationships:
  # NOTE: name is automagically derived from title
  fields do
    title       :string
    description :text
    tooltype    enum_string(*ToolForms.all_tool_forms.each { |f| f.id }), :required
    parameters  :text
    timestamps
  end


  ## Accessors:
  def tool_form_cls
    return ToolForms.tool_id_to_cls(tooltype)
  end

  ## Permissions:
  # TODO: do we need some mroe sophisticated access machinery where we can allow
  # or deny access to given groups or people?
  
  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    # TODO: this sucessfully hides the parameters _always_. Need a way to let it
    # be seen in the edit mode only by admins only.
    if [:parameters].member?(field)
      false
    else
      true
    end
  end

end
