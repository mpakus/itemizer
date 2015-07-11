class Api::V1::ApplicationController < ActionController::Metal
  # rails_api ;-P
  include AbstractController::Rendering
  include ActionView::Rendering
  include ActionController::Rendering

  include ActionController::Renderers::All
  include ActionController::ConditionalGet
  include ActionController::RackDelegation

  include ActionController::Caching
  include ActionController::EtagWithTemplateDigest
  include ActionController::StrongParameters
  include ActionController::HideActions

  include AbstractController::Callbacks
  include ActionController::Rescue
  include ActionController::Instrumentation

  include ActionController::RequestForgeryProtection
end
