""" Public definitions for demo_repo """

load(
    "//internal:rules.bzl",
    _demo_rule = "demo_rule",
)

demo_rule = _demo_rule
