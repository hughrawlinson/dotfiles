set EMSDK_HOME "$HOME/Development/github.com/emscripten-core/emsdk"
if test -d $EMSDK_HOME
    alias emsdk_setup ". $EMSDK_HOME/emsdk_env.fish"
end
