from taskgraph.transforms.base import TransformSequence
import os

transforms = TransformSequence()

@transforms.add
def set_env(config, tasks):
    for task in tasks:
        print(task)
        env = task["worker"].setdefault("env", {})
        env["GITHUB_PR"] = str(os.environ.get("ARCHIPELAGO_INDEX_PULL_REQUEST_NUMBER", -1))
        yield task
