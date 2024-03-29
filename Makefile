# Options and directories ------------------------------------------------------
# Option for R
R_OPTS=--vanilla

# Name targets -----------------------------------------------------------------
syllabus: syllabus/syllabus.pdf
lec000 : lecture/000/slides.html lecture/000/slides.pdf
lec001 : lecture/001/slides.html lecture/001/slides.pdf
lec002 : lecture/002/slides.html lecture/002/slides.pdf

# Define individual links ------------------------------------------------------
# Build syllabus
syllabus/syllabus.pdf : syllabus/syllabus.tex
	tectonic syllabus/syllabus.tex
# Lecture 00
lecture/000/slides.html : lecture/000/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/000/slides.pdf : lecture/000/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 01
lecture/001/slides.html : lecture/001/slides.rmd
	Rscript -e "rmarkdown::render('$<')"
lecture/001/slides.pdf : lecture/001/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"
# Lecture 02
lecture/002/slides.html : lecture/002/slides.rmd
	Rscript -e "rmarkdown::render('$<', wait = 4, timeout = 120)"
lecture/002/slides.pdf : lecture/002/slides.html
	Rscript -e "pagedown::chrome_print('$<', wait = 4, timeout = 120)"

# Global targets ---------------------------------------------------------------
lec-all: lec000 lec001 lec002
all: lec-all syllabus
# Define clean
clean:
	rm -f lec-all
