# Diploma, porazdeljeno računanje na superračunalniških gručah z ogrodji Singularity in Dask
Pred prvim zagonom  sbatch skripte (.sh datoteke)je potrebno na sistemi, kjer se poganja narediti ustrezno strukturo imenikov.
Predvidena struktura imenika je sledeča
- vsebniki/zvezki/podatki
- vsebniki/def_datoteke
- vebnik/sh_skripte

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
                                                                            

## Zagon sbatch skript
Zagon sbatch skripte je v ukazni lupini s pomočjo ukaza npr. 
-  ```sbatch vsebniki/sh_skripte/jupyter.sh | tail -f jupyter_out.log```
oz. bolj splošno
- ```sbatch vsebniki/sh_skripte/{ime_skripte}.sh | tail -f {ime_log_datoteke}.log```
ta ukaz pošlje posel preko slurm-a, ta pa potem alocira procesorska jedra oz. vozlišče/a. Vzporedno pa na standardni izhod izpisuje vsebino log datoteke, v katero se zapišejo prijavni podatki.

## Primer izpisa prijavnih podatkov

```
                    Žeton (token):
                    aefc56de683c03d2587adab9fcdef5585689bd72994406d1

                    Za naslednja ukaza je potrebno na osebnem računalniku odpreti dve istanci gnu terminala

                    Ukaz za povezova na vozlišče preko ssh, jupyter zvezek:
                    ssh -N -L localhost:8890:nsc-gsv003:8888 mu6736@nsc-login1.ijs.si

                    Ukaz za povezova na vozlišče preko ssh, Dask dashboard:
                    ssh -N -L localhost:8891:nsc-gsv003:8787 mu6736@nsc-login1.ijs.si

                    -----------------------------------------------------------------------------------------------

                    V brskalniku se nahaja jupyter zvezek na naslednjem naslovu;
                    localhost:8890

                    V brskalniku se nahaja Dask dashboard na naslednjem naslovu;
                    localhost:8891

```
