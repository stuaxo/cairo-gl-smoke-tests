all: masking-filling-stroking-gl operators-gl
egl: masking-filling-stroking-egl operators-egl

FLAGS = -Wall -O0 -g3

GL_DEPS = cairo x11 gl
GL_CFLAGS = `pkg-config --cflags $(GL_DEPS)`
GL_LIBS = `pkg-config --libs $(GL_DEPS)` -lm

EGL_DEPS = cairo x11 egl
EGL_CFLAGS = `pkg-config --cflags $(EGL_DEPS)`
EGL_LIBS = `pkg-config --libs $(EGL_DEPS)` -lm

SOURCES = glx-utils.c gl-utils.h egl-utils.c masking-filling-stroking.c operators.c

%-gl: $(SOURCES)
	gcc -o $@ $(FLAGS) $(GL_CFLAGS) glx-utils.c $*.c $(GL_LIBS)
%-egl: $(SOURCES)
	gcc -o $@ $(FLAGS) $(EGL_CFLAGS) egl-utils.c $*.c $(EGL_LIBS)

clean:
	rm -f \
	masking-filling-stroking-gl \
	operators-gl \
	masking-filling-stroking-egl \
	operators-egl \
	*~
