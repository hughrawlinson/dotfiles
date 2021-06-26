if test -f /usr/libexec/java_home
    set JAVA_VERSION "1.8"
    set JAVA_HOME (/usr/libexec/java_home -v $JAVA_VERSION)
    set JAVACMD "$JAVA_HOME/bin/java"

    fish_add_path $HOME/.jenv/bin
    status --is-interactive; and source (jenv init -|psub)
end
