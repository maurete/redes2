# el nombre de archivo de salida, sin extensión:
out = main
# nombre de los archivos fuente, sin/con extensión:
fuente = main
dep = conf/config.tex conf/packages.tex conf/comandos.tex
# archivos auxiliares
aux = conf/config.aux conf/packages.aux conf/comandos.aux
# 'compilador':
cc = latex
# 'compilador' de pdf:
ccpdf = pdflatex
# 'visor de pdf':
visor = evince

# todo, incluido el borrado de archivos auxiliares
all : pdflatex
	$(visor) $(out).pdf

# convierte de dvi a pdf:
pdf : dvi
	dvipdf $(out)
	rm $(out).dvi

# archivo intermedio:
dvi : $(fuente).tex $(dep)
	$(cc) $(fuente).tex
ifneq ($(fuente), $(out))
	mv $(fuente).dvi $(out).dvi
endif
	rm $(fuente).aux $(aux)
	rm $(fuente).log

# pdflatex:
pdflatex : $(fuente).tex $(dep)
	$(ccpdf) $(fuente).tex
ifneq ($(fuente), $(out))
	mv $(fuente).pdf $(out).pdf
endif
	rm $(fuente).aux $(aux)
	rm $(fuente).log

# para cuando hago make clean
clean:
	rm -rf $(out).pdf $(out).dvi $(fuente).log