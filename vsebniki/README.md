# Pred zagonom skripte
Trenutne skripte so imajo hardcoded ime vsebnika, ki ga pričakujejo zagnati
to je potrebno spremenini v primeru drugega imena vsebnika.
Sprememba imena, poti ali port-a vsebnika se spremeni znotraj ukaza

singularity exec --bind vsebniki/zvezki/:/opt/notebooks/ vsebniki/zadnijVsebnik.sif jupyter notebook  --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root  

Piračovana HPC gruča je IJS, ob poganjanju na drugi HPC gruči je potrebno
spremeniti parameter spremenljivki cluster znotraj .sh datotek

trenutna vrednost:
cluster="nsc-login1.ijs.si"
