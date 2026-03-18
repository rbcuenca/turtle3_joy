# Repositorio com o conteudo para fazer um controle usb no estilo do ps3 funcionar com o turtlebot3 com ROS2 Humble em Ubuntu 22.04.

## instalar os seguinte pacotes:
```
sudo apt update
sudo apt install ros-humble-turtlebot3-msgs ros-humble-turtlebot3-teleop ros-humble-turtlebot3-bringup
sudo apt install -y ros-humble-joy ros-humble-teleop-twist-joy joystick evtest
source /opt/ros/humble/setup.bash
```

## Agora você pode listar joystick no /dev/input e dar permissão para o usuario acessar:

```
ls -l /dev/input/js0
sudo usermod -aG input $USER
```
## Agora edite o arquivo /etc/udev/rules.d/99-joystick.rules e cole o conteudo que está na sequencia:

```
sudo gedit /etc/udev/rules.d/99-joystick.rules
```
### Conteúdo a ser colado no arquivo:
```
KERNEL=="js[0-9]*", MODE="0666"
KERNEL=="event*", ATTRS{name}=="*360*", MODE="0666"
```
## Agora vmos fazer um "reload" das regras:

```
sudo udevadm control --reload-rules
sudo udevadm trigger
```

## Para testar o joystick fora do ROS:

```
jstest /dev/input/js0
```

## Para subir os nós necessários, copie os arquivos config.yaml e start_joy.sh para dentro do ~/colcon_ws e dê permissão de execução para o start_joy.sh.
```
cp config.yaml ~/colcon_ws/
cp start_joy.sh ~/colcon_ws/
cd ~/colcon_ws
chmod +x start_joy.sh
```
## agora é só ir ao diretório ~/colcon_ws e executar o start_joy.sh ou executar ele de onde estiver com o comando abaixo:
```
./colcon_ws/start_joy.sh
```
