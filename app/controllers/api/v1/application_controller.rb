class Api::V1::ApplicationController < ActionController::Metal
  include AbstractController::Rendering
  include ActionController::Renderers::All
  include ActionController::ConditionalGet
  include ActionController::Caching
  # include ActionController::EtagWithTemplateDigest
  # include ActionController::RackDelegation
  # include ActionController::MimeResponds
end
