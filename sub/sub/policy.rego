package user_policy

yaml_items(s) = result {
  vals := split(s, "---\n")
  result := [item | val := vals[_]
                    val != ""
					item := yaml.unmarshal(val)]
}

check[result] {
  items := yaml_items(input.content)
  item := items[_]
  item.kind == "Deployment"
  item.metadata.labels["acme/production-level"] == "critical"
  item.spec.replicas < 3
  result := {"deny": sprintf(`Critical production deployment: %q may not have fewer than 3 replicas`, [item.metadata.name])}
}

