
us1 = User.create(email:"machaves@unal.edu.co", password: "machaves", nombre:"Mauricio",apellido: "Chaves", telefono: "3123467895", dependencia: "Ciencias Humanas", cargo: "Responsable", rol: 0)
us2 = User.create(email:"guiramirez@unal.edu.co", password: "guiramirez", nombre:"Guillermo",apellido: "Ramirez", telefono: "3154567890", dependencia: "Ciencias Humanas", cargo: "Responsable", rol: 0)



u1 = Ubicacion.create(lugar: "Sociología",user_id: 1)
u2 = Ubicacion.create(lugar: "CES",user_id: 1)
u3 = Ubicacion.create(lugar: "Rogelio Salmona",user_id: 2)
u4 = Ubicacion.create(lugar: "Aulas",user_id: 2)
u5 = Ubicacion.create(lugar: "Lenguas Extranjeras",user_id: 1)
u6 = Ubicacion.create(lugar: "Filosofía",user_id: 2)
u7 = Ubicacion.create(lugar: "Manuel Ancizar",user_id: 1)
u8 = Ubicacion.create(lugar: "Manuel Ancizar",user_id: 2)
u9 = Ubicacion.create(lugar: "Programa segunda lengua",user_id: 1)
u10 = Ubicacion.create(lugar: "Programa segunda lengua",user_id: 2)
u11 = Ubicacion.create(lugar: "Evocol",user_id: 2)
u12 = Ubicacion.create(lugar: "Las nieves",user_id: 1)
u13 = Ubicacion.create(lugar: "Las nieves",user_id: 2)
u14 = Ubicacion.create(lugar: "Casa Gaitán",user_id: 2)
u15 = Ubicacion.create(lugar: "Antonio Nariño",user_id: 1)
u16 = Ubicacion.create(lugar: "Antonio Nariño",user_id: 2)
u17 = Ubicacion.create(lugar: "Camilo Torres-Bloque 1",user_id: 1)

