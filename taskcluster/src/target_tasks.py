from taskgraph.target_tasks import register_target_task


@register_target_task("diff")
def diff_target_task(full_task_graph, parameters, graph_config):
    return [label for label, task in full_task_graph.tasks.items() if task.kind == "diff-from-lobby"]


@register_target_task("test")
def merge_target_task(full_task_graph, parameters, graph_config):
    return [label for label, task in full_task_graph.tasks.items() if task.kind == "verify"]


@register_target_task("r+")
def rplus_target_task(full_task_graph, parameters, graph_config):
    return [label for label, task in full_task_graph.tasks.items() if task.kind in {"verify", "publish"}]


@register_target_task("merge")
def merge_target_task(full_task_graph, parameters, graph_config):
    return [label for label, task in full_task_graph.tasks.items() if task.kind == "publish"]
