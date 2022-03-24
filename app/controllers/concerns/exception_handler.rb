module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render(
        json: {
          error_type: 'record_invalid',
          errors: e.record.errors.messages
        },
        status: :unprocessable_entity
      )
    end
  end
end
