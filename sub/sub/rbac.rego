package rbac

user_roles = {"John Wick": ["cluster-admin", "non-critical"], "Theodore Logan": ["end-user"], "Thomas Anderson": ["cluster-admin"]}
permissions = {
      "end-user": [{"context": "yaml", "match": {"namespace": ["default"]}}],
      "cluster-admin": [{"context": "yaml", "match": {"kind": ["*"]}}],
      "Thomas Anderson": [{"context": "yaml", "match": "*"}]
}
rejections = {
      "non-critical": [{"context": "yaml", "match": {"label": [{"acme/production-level": "critical"}]}}]
}