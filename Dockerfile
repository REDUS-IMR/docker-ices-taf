FROM redusimr/ices-taf

LABEL org.label-schema.license="LGPL-3.0" \
      org.label-schema.vcs-url="https://github.com/REDUS-IMR/fishdocker" \
      org.label-schema.vendor="REDUS Project at IMR Norway"

ADD projects /projects

WORKDIR /projects

RUN Rscript -e "dirs <- list.dirs(path = getwd(), full.names = TRUE, recursive = FALSE)" \
	-e "print(dirs)" \
	-e "for (dir in dirs){" \
	-e "setwd(dir)" \
	-e "source(\"data.R\")" \
	-e "source(\"input.R\")" \
	-e "source(\"model.R\")" \
	-e "source(\"output.R\")" \
	-e "source(\"report.R\")" \
	-e "}" \
    && tar czf results.tar.gz * --exclude='.*'\
    && rm -rf /tmp/*

