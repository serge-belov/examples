def _demo_rule_impl(ctx):
    print("hello {}".format(ctx.label))

demo_rule = rule(
    implementation = _demo_rule_impl,
)
