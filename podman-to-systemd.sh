#!/bin/sh


service_dir="$HOME/.config/systemd/user"
user_flag="--user"
if [ "$(id -u)" -eq 0 ]; then
    service_dir="/etc/systemd/system"
    user_flag=
fi


if [ "$#" -eq 0 ]; then
    printf "[%s] Usage: %s container1 container2 ...\n" "$0" "$0"
    exit 0
fi

for container_name in "$@"; do
    printf "[%s] Generating systemd service for %s\n" "$0" "$container_name"
    podman generate systemd --new \
        --name "$container_name" \
        --files
done
printf "\n"


for service in ${PWD}/*.service; do
    service=${service##*/}
    printf "\n[%s] Moving %s to %s\n" "$0" "$service" "$service_dir"
    mv "$service" "$service_dir"
    chmod +x "${service_dir}/${service}"

    printf "[%s] Reloading systemd daemon\n" "$0"
    systemctl $user_flag daemon-reload

    printf "[%s] Enabling  %s\n" "$0" "$service"
    systemctl $user_flag enable --now "$service"
done

