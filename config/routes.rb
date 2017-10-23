Rails.application.routes.draw do
  root 'weather#index'

  get 'weather/index'
  get 'weather/data', defaults: { format: 'json' }

  get 'weather/heatmap'
  get 'weather/heatmap_data', defaults: { format: 'json' }

  get 'map/index'
  get 'map/map_data', defaults: { format: 'json' }
end
