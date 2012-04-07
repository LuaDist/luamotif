SRCS=		luamotif.c widgets.c constants.c
LIB=		motif

CFLAGS+=	-fPIC -I/usr/include -I${PKGDIR}/include -I/usr/include/lua5.1
LDADD+=		-L${XDIR}/lib -L${PKGDIR}/lib -lXm -lXt -lX11 -lm -lbsd

PKGDIR=		/usr/local
LIBDIR=		${PKGDIR}/lib/lua/5.1

${LIB}.so:	${SRCS:.c=.o}
		cc -shared -o ${LIB}.so ${CFLAGS} ${SRCS:.c=.o} ${LDADD}
		ln -s ${LIB}.so lib${LIB}.so

clean:
		rm -f *.o *.so
install:
	-mkdir -p ${LIBDIR}
	cp motif.so libmotif.so ${LIBDIR}
