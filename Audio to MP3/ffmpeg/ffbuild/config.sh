# Automatically generated by configure - do not modify!
shared=
build_suffix=
prefix=/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/out
libdir=${prefix}/lib
incdir=${prefix}/include
rpath=
source_path=.
LIBPREF=lib
LIBSUF=.a
extralibs_avutil="-pthread -lm -Wl,-framework,OpenCL -framework VideoToolbox -framework CoreFoundation -framework CoreMedia -framework CoreVideo -framework CoreServices"
extralibs_avcodec="-L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lvpx -lm -lpthread -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lvpx -lm -lpthread -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lvpx -lm -lpthread -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lvpx -lm -lpthread -liconv -lm -framework AudioToolbox -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -laom -lm -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lfdk-aac -lmp3lame -lm -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lopus -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lSvtAv1Enc -lpthread -lm -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lvorbis -lm -logg -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lvorbisenc -lvorbis -lm -logg -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lx264 -lpthread -lm -ldl -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lx265 -lc++ -ldl -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lopenh264 -lstdc++ -pthread -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lz -framework VideoToolbox -framework CoreFoundation -framework CoreMedia -framework CoreVideo -framework CoreServices"
extralibs_avformat="-lm -lbz2 -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lz -Wl,-framework,CoreFoundation -Wl,-framework,Security"
extralibs_avdevice="-framework Foundation -framework AudioToolbox -framework CoreAudio -lm -framework AVFoundation -framework CoreVideo -framework CoreMedia -framework CoreGraphics -framework AudioToolbox -pthread -L/opt/homebrew/lib -lSDL2"
extralibs_avfilter="-framework OpenGL -framework OpenGL -pthread -lm -L/Users/harrychambers/desktop/ffmpeg-apple-arm64-build-master/tool/lib -lass -liconv -lharfbuzz -lm -framework ApplicationServices -lfribidi -lfreetype -lbz2 -lpng16 -lz -lm -lz -lbrotlidec -lbrotlicommon -framework CoreImage -framework AppKit -Wl,-framework,OpenCL"
extralibs_postproc="-lm"
extralibs_swscale="-lm"
extralibs_swresample="-lm"
avdevice_deps="avfilter swscale postproc avformat avcodec swresample avutil"
avfilter_deps="swscale postproc avformat avcodec swresample avutil"
swscale_deps="avutil"
postproc_deps="avutil"
avformat_deps="avcodec swresample avutil"
avcodec_deps="swresample avutil"
swresample_deps="avutil"
avutil_deps=""
