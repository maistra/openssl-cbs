load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def bsslwrapper_repositories(bind = True):
    http_archive(
        name = "bssl_wrapper",
        strip_prefix = "bssl_wrapper-c9649facde3ab1d8bc871c7375a8946c50950e97",
        url = "https://github.com/maistra/bssl_wrapper/archive/c9649facde3ab1d8bc871c7375a8946c50950e97.tar.gz",
        sha256 = "d84ea7d190210145695e5b172e8e6fb23f3464360da5efab5a1ae1a973c21f57",
    )

    if bind:
        native.bind(
            name = "bssl_wrapper_lib",
            actual = "@bssl_wrapper//:bssl_wrapper_lib",
        )

ABSEIL_COMMIT = "093cc27604df1c4a179b73bc3f00d4d1ce2ce113"  # same as Envoy
ABSEIL_SHA256 = "55d33c75aff05a8c4a55bdf0eddad66c71a963107bc2add96cf8eb88ddb47a80"

def abseil_repositories(bind = True):
    http_archive(
        name = "com_google_absl",
        strip_prefix = "abseil-cpp-" + ABSEIL_COMMIT,
        url = "https://github.com/abseil/abseil-cpp/archive/" + ABSEIL_COMMIT + ".tar.gz",
        sha256 = ABSEIL_SHA256,
    )

    if bind:
        native.bind(
            name = "abseil_strings",
            actual = "@com_google_absl//absl/strings:strings",
        )
        native.bind(
            name = "abseil_time",
            actual = "@com_google_absl//absl/time:time",
        )
