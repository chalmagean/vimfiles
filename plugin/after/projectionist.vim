let g:projectionist_heuristics = {
      \   'app/controllers/*_controller.rb': {
      \     'alternate': [
      \       'spec/requests/{}_spec.rb',
      \       'spec/controllers/{}_spec.rb'
      \     ],
      \     'type': 'source'
      \   }
      \ }
