Rails.application.routes.draw do
# before
get 'items/index'

# after
root 'items#index'
end
