# Diploma
Pred prvim zagonom  sbatch skripte (.sh datoteke)je potrebno na sistemi, kjer se poganja narediti ustrezno strukturo imenikov.
Predvidena struktura imenika je sledeča
- vsebniki/zvezki/podatki
- vsebniki/def_datoteke
- vebnik/sh_skkripte

Imenik vsebniki vsebuje Singularity vsebnike s končnico .sif. Ima tudi tri pod imenike, prvi zvezki, ki vsebuje Jupyter zvezke in podimenik podatki
za surove podatke npr. cvs,txt... datoteke, drugi def_datoteke vsebuje definicijske datoteke Singularity vsebnikov. Zadnji podimenik sh_skripte vsebuje bash skripte za zagon vsebnika na hpc gruči.
Spodaje je prikazano drevo predvine strukture imenikov.


                                                            vsebniki
                                                                |
                                                                |  
                                                                |
                                                          |     |     |
                                                       |        |         |
                                                    |           |             |
                                                 def_dat    sh_skripte       zvezki
                                                                              | 
                                                                              |
                                                                              |
                                                                            podatki
                                                                            
