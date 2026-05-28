#!/bin/bash


start_xrdp_services() {
    # Preventing xrdp startup failure
    rm -rf /var/run/xrdp-sesman.pid
    rm -rf /var/run/xrdp.pid
    rm -rf /var/run/xrdp/xrdp-sesman.pid
    rm -rf /var/run/xrdp/xrdp.pid

    # Use exec ... to forward SIGNAL to child processes
    xrdp-sesman && exec xrdp -n
}

stop_xrdp_services() {
    xrdp --kill
    xrdp-sesman --kill
    exit 0
}


echo "check if user is in passwd"
grep -m1 "${XXRDP_USER}" /etc/passwd  > /dev/null || exit 1

echo "check if homes exists:"
XXRDP_HOME=$(cut -d':' -f6 /etc/passwd | grep "/home/" | grep ${XXRDP_USER})

if [[ ! -d "${XXRDP_HOME}" ]]
then
    mkdir "${XXRDP_HOME}"
fi

# always fix owner of home:
chown $(id -u -n ${XXRDP_USER}): "${XXRDP_HOME}"

echo -e "starting xrdp services...\n"

trap "stop_xrdp_services" SIGKILL SIGTERM SIGHUP SIGINT EXIT
start_xrdp_services
