:android-user {:dependencies [[cider/cider-nrepl "0.9.1"]]
               :android {:aot-exclude-ns ["cider.nrepl.middleware.util.java.parser"
                                          "cider.nrepl" "cider-nrepl.plugin"]}}
:android-common {:android {:sdk-path "/home/oren/android-sdk-linux"}}
