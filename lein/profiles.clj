{:user {:plugins [[cider/cider-nrepl "0.10.0-SNAPSHOT"]]
        :resource-paths [#=(eval (System/getenv "JAVA_API_PATH"))]}
 :android-user {:dependencies [[cider/cider-nrepl "0.10.0-SNAPSHOT"]]
                :android {:aot-exclude-ns ["cider.nrepl.middleware.util.java.parser"
                                           "cider.nrepl" "cider-nrepl.plugin"]}}
 :android-common {:android {:sdk-path #=(eval (System/getenv "ANDROID_SDK_PATH"))}}}
