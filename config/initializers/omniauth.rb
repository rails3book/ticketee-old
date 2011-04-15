Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Nn1QencWdwK7Dh8sDdoA', '4M76Ct1nrSZPkO42YHCYNBpp51mk57lKChQ0GmeJirs'
  provider :github, '349074772f455bec6213', 'f82bbce91b888a90e85bf256d859628d1a654152'
end