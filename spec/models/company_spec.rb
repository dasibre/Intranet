# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  phone      :string(50)
#  fax        :string(50)
#  website    :string(255)
#  address_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Company do
  pending "add some examples to (or delete) #{__FILE__}"
end
