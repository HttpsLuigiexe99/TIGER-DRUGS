TIGERDROGA = {

    Blip = {
        {name="Campo di Marijuana", color=2, id=140, x = 5378.874, y = -5227.23, z = 32.902, grandezza=0.8},
        {name="Processo di Marijuana", color=25, id=501, x = 2329.1206054688, y = 2571.6494140625, z = 46.676940917969, grandezza=0.8},
        {name="Vendita di Marijuana", color=1, id=500, x = -1171.8752441406, y = -1572.2219238281, z = 4.6636276245117, grandezza=0.8},
    },

 ----------------------------------TIGER DEVELOPMENT ™----------------------------------

    Other = {
        job_police = "police",
        block_time = false
    }
}

Lang = {
    ["INVENTARIO PIENO"] = "Inventario Pieno, Svuotati un po :)",
    ["veicolo"] = "Esci dal veicolo per compiere questa azione!",
    ["DROGATERMINATA"] = "Non hai abbastanza droga da processare!",
    ["drogavendita"] = "Non hai abbastanza droga da vendere!",
    ["POLIZIANONDIPONIBILE"] = "Non ci sono poliziotti sufficienti!",
    ["ORARIOON"] = "Non puoi raccogliere a quest'ora! Vatti a fare una canna!",
    ["DROGAVENDUTA"] = "Hai venduto tutta droga con successo!"
}

----------------------------------TIGER DEVELOPMENT ™----------------------------------

TIGERDROGA.Droga = {

    Marijuana = {

        ["raccolta"] = {
            pos = vector3(5378.874, -5227.23, 32.905),
            police =0,
         
            item = {
                add = "marijuana",
                add_quantity = 1
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            },

            other = {
                info = "Premi [~s~E~s~] per raccogliere",--Testo inizionio Processo
                key = 'E',
                abilitato = true,--3dme 
                pogressbar = true,--ProgressBar     
                animazione = true,--Animazione Raccolta 
                messaggio = "me Sta ~p~Raccogliendo..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Raccogliendo..."--Messaggio ProgressBar
            }
        },

        ["processo"] = {
            pos = vector3(5374.060, -5222.85, 32.129),
            police = 0,
         
            item = {
                add = "marijuana2",
                add_quantity = 1,

                remove = "marijuana",
                remove_quantity = 2
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            },

            other = {
                info = "Premi [~s~E~s~] per processare",--Testo 
                key = 'E',
                abilitato = true,--3dme 
                pogressbar = true,--ProgressBar      
                animazione = true,--Animazione Raccolta 
                messaggio = "me Sta ~p~Processando..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Processando..."--Messaggio ProgressBar
            }
        },

        ["vendita"] = {
            pos = vector3(5367.422, -5218.20, 31.379), 
            police = 0,
         
            item = {
                remove = "marijuana2",
                add_money = 100
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            },

            other = {
                info = "Premi [~s~E~s~] per vendere",--Testo 
                key = 'E',
                abilitato = true,--3dme 
                pogressbar = true,--ProgressBar       
                animazione = true,--Animazione Raccolta 
                messaggio = "me Sta ~p~Vendendo..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Vendendo..."--Messaggio ProgressBar
            }
        }
    },

    Cocaina = {
        ["raccolta"] = {
            pos = vector3(363.14041137695,6462.3559570313,30.238111495972),
            police = 0,
         
            item = {
                add = "oggettococaina",
                add_quantity = 1
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            },

            other = {
                info = "Premi [~s~E~w~] per raccogliere",--Testo 
                key = 'E',
                abilitato = true,--3dme 
                pogressbar = true,--ProgressBar      
                animazione = true,--Animazione Raccolta 
                messaggio = "me Sta ~p~Raccogliendo..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Raccogliendo..."--Messaggio ProgressBar
            }
        },

        ["processo"] = {
            pos = vector3(2433.9440917969,4969.0043945313,42.347564697266),
            police = 0,
         
            item = {
                add = "oggettococaina2",
                add_quantity = 1,

                remove = "oggettococaina",
                remove_quantity = 2
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            },

            other = {
                info = "Premi [~s~E~s~] per processare",--Testo 
                key = 'E',
                abilitato = true,--3dme 
                pogressbar = true,--ProgressBar     
                animazione = true,--Animazione Raccolta 
                messaggio = "me Sta ~p~Processando..",--Messagio 
                messaggio_progressbar = "Processando..."--Messaggio ProgressBar
            }
        },

        ["vendita"] = {
            pos = vector3(1721.2960205078,3319.9853515625,41.223514556885), 
            police = 0,
         
            item = {
                remove = "oggettococaina2",
                add_money = 100
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            },

            other = {
                info = "Premi [~s~E~s~] per vendere",--Testo 
                key = 'E',
                abilitato = true,--3dme 
                pogressbar = true,--ProgressBar       
                animazione = true,--Animazione  
                messaggio = "me Sta ~p~Vendendo..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Vendendo..."--Messaggio ProgressBar
            }
        }
    }
}
----------------------------------TIGER DEVELOPMENT ™----------------------------------