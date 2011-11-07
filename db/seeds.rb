# coding: utf-8

[  "Artes plásticas" ,
   "Circo" ,
   "Comunidade" ,
   "Feito à mão" ,
   "Humor" ,
   "Quadrinhos" ,
   "Dança" ,
   "Design" ,
   "Eventos" ,
   "Moda" ,
   "Comida" ,
   "Cinema & Vídeo" ,
   "Jogos" ,
   "Jornalismo" ,
   "Música" ,
   "Fotografia" ,
   "Tecnologia" ,
   "Teatro" ,
   "Literatura" 
  ].each do |category|
    Category.find_or_create_by_name(category)
  end

Site.find_or_create_by_name(:name => "Coletivo Social",
            :title => "Coletivo social é de todo mundo e o primeiro website de contribuição voluntária em grupo", 
            :path => "coletivo_social", 
            :host => "coletivosocial.dev", 
            :gender => "male", 
            :email => "contato@coletivosocial.com", 
            :twitter => "coletivo.social", 
            :facebook => "http://www.facebook.com/pages/coletivosocial", 
            :blog => "http://blog.coletivosocial.com"
            )


=begin    execute "INSERT INTO sites (name, title, path, host, gender, email, twitter, facebook, blog) VALUES
    ('Catarse', 'A primeira plataforma de financiamento colaborativo de projetos criativos do Brasil', 'catarse', 'catarse.me', 'male', 'contato@catarse.me', 'Catarse_', 'http://www.facebook.com/Catarse.me', 'http://blog.catarse.me'),
    ('Multidão', 'Produção Cultural Colaborativa', 'multidao', 'multidao.localhost', 'female', 'contato@multidao.art.br', 'multidao_art', 'http://www.facebook.com/pages/Multidaoart/139326962792941', 'http://blog.multidao.art.br')
    "
=end
