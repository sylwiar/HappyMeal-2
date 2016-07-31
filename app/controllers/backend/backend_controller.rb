class Backend::BackendController < ApplicationController

  layout 'backend'
  before_filter :authenticate

end
