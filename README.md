# canine_guard

This repository contains the source code for the canine_guard project, which is organized as follows:

- **docs**: Documentation files such as user guides and design documents.
- **scripts**: Scripts for setting up the environment, launching nodes, etc.
- **src**: Source code for the ROS packages.
  - Each package (`package_1`, `package_2`, etc.) contains its own ROS package structure with a `CMakeLists.txt` file for building and a `package.xml` file for package metadata and dependencies.
  - Submodules (`submodule_1`, `submodule_2`, etc.) contain additional ROS packages.
- **examples**: Example configurations, launch files, or code snippets demonstrating how to use the packages within the repository.
- **3rdparty**: External dependencies included as Git submodules.

For more information on how to use this project, please refer to the documentation located in the `docs` directory.


## Setting the commit template

To set up the commit template for the specific Git repository, follow these steps:

1. Use the following command to set the commit.template configuration option in your Git repository:

    ```bash
    git config commit.template git_commit_template.txt
    ```

2. verify that the commit template configuration is set correctly by checking the Git configuration for the current repository:

    ```bash
    git config --get commit.template
    ```

    This command should return the path to your commit template file.

3. Now, whenever you run `git commit` without the `-m` option to specify a commit message, Git will open your text editor with the commit template pre-filled. You can then fill in the sections with the appropriate information for your commit.


## Setting up the submodules
To clone this repository and initialize submodules, use the following commands:

```bash
git submodule init
git submodule update
```

## Install necessary packages
```bash
sudo apt install ros-humble-rmw-cyclonedds-cpp
sudo apt install ros-humble-rosidl-generator-dds-idl
```

## Initial build

```bash
cd src
source cgss_build.sh
```

## Sourcing a new terminal
```bash
cd src
source cgss_shell_setup.sh
```
