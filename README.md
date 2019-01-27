# Unity3d

Installs [Unity3d][] in docker for running headless builds on Ubuntu 18.04.
Unity3d inside docker will be able to target Linux and Windows.
Install [docker-compose][] to use docker command easier.

# Activating Unity license

To run Unity first you need to login with your account.
Activation information will be stored outside of container in `~/.cache/docker-unity3d` folder.

Run Unity3d:

    docker-compose run unity3d-activate

Now login with your e-mail and password. Then close the window.

# Running the build

First export following environment variables:

    export UID
    export BUILD_NAME=YourProjectName
    export BUILD_PROJECT=/absolute/path/to/your/project

Exporting `UID` is important to make docker run container as your user. This means any files Unity
will modify (for example, under `Library`) will written under you user, not as root.

`BUILD_NAME` will be used for folder & binary name.

`BUILD_PROJECT` should be **absolute** path to your Unity project.

To build 64-bit Linux binary execute following:

    docker-compose run unity3d-build-linux64

To build 64-bit Windows binary execute following:

    docker-compose run unity3d-build-windows64

The output will be zip file in in project folder.

# Build with custom build method

To do the build by executing custom C# method run following:

    docker-compose run unity3d-build -buildTarget Linux64 -executeMethod YouCustom.BuildMethod

Adjust value of `-buildTarget` to `Windows64` if building Windows binary.

Make sure your custom build places output in `/tmp/${BUILD_NAME}` folder.

[Unity3d]: https://unity3d.com/
[docker-compose]: https://docs.docker.com/compose/
