# Diploma
Pred prvim zagonom  sbatch skripte (.sh datoteke)je potrebno na sistemi, kjer se poganja narediti ustrezno strukturo imenikov.
Predvidena struktura imenika je sledeča
- vsebniki/zvezki/podatki
- vsebniki/def_datoteke
Imenik vsebniki vsebuje Singularity vsebnike s končnico .sif. Ima tudi dva pod imenika, prvi zvezki, ki vsebuje Jupyter zvezke in podimenik podatki
za surove podatke npr. cvs,txt... datoteke, drugi def_datoteke vsebuje definicijske datoteke Singularity vsebnikov.prikazan 
Spodaje je prikazano drevo predvine strukture imenikov.


                                                            vsebniki
                                                                |
                                                                |
                                                                |
                                                              |   |
                                                            |       |
                                                          |           |
                                                       def_dat      zvezki
                                                                      | 
                                                                      |
                                                                      |
                                                                   podatki
                                                                            
