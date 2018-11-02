autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'app/controllers/*.rb': {
\      'alternate': 'spec/requests/{}_spec.rb'
\    },
\    'app/*.rb': {
\      'alternate': 'spec/{}_spec.rb'
\    },
\    'spec/requests/*_spec.rb': {
\      'alternate': 'app/controllers/{}_controller.rb'
\    },
\    'spec/*_spec.rb': {
\      'alternate': 'app/{}.rb'
\    }
\ })
