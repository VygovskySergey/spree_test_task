class ProductsImport < ApplicationRecord
  include AASM

  has_attached_file :import,
    path: ':rails_root/public/:rails_env/:id/:filename'
  validates_attachment_presence     :import
  validates_attachment_content_type :import,
    content_type: ['text/plain', 'text/csv', 'application/vnd.ms-excel'],
    message: 'Unsupported file'

  aasm column: 'state' do
    state :waiting_for_process, :initial => true
    state :processing
    state :processed
    state :processed_with_errors

    event :process do
      transitions :from => :waiting_for_process, :to => :processing
    end

    event :finish_process do
      transitions :from => :processing, :to => :processed
    end

    event :finish_process_with_errors do
      transitions :from => :processing, :to => :processed_with_errors
    end

    event :finish_with_errors do
      transitions :from => :waiting_for_process, :to => :processed_with_errors
    end
  end
end
