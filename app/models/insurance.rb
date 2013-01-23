class Insurance < ActiveRecord::Base

  mount_uploader :insurance_proof, InsuranceProofUploader

  attr_accessible :account, :carrier, :coverage
  
  belongs_to :interpreter
  
end
