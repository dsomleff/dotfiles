# Ansible

## Installation

1.  make it `setup_new_machine.sh` executable

    ```bash
    chmod +x setup_new_machine.sh
    ```

2.  Run the script

    ```bash
    ./setup_new_machine.sh
    ```

## Working with Tags

### Running with Tags

To execute tasks with specific tags, use the `--tags` option when running your playbook. For example:

```bash
ansible-playbook setup_new_machine.yml --tags zsh
```

This command would run only the tasks tagged with `zsh`, skipping all other tasks.

### Excluding Tags

You can also exclude tasks with specific tags using the `--skip-tags` option:

```bash
ansible-playbook playbook.yml --skip-tags zsh
```

This command would run all tasks except those tagged with `zsh`.
