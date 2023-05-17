# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "react", to: "https://ga.jspm.io/npm:react@18.2.0/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@18.2.0/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.23.0/index.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.0-alpha2/lib/assets/compiled/rails-ujs.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true