PR = "r1"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://remove-npm-install.patch \
    file://0001-Adapt-init-script-for-OSTL.patch \
    file://otbr_setup.sh \
    file://default \
    npm://registry.npmjs.org;package=angular;version=1.8.0;destsuffix=npm/angular \
    npm://registry.npmjs.org;package=angular-animate;version=1.6.4;destsuffix=npm/angular-animate \
    npm://registry.npmjs.org;package=angular-aria;version=1.6.4;destsuffix=npm/angular-aria \
    npm://registry.npmjs.org;package=angular-material;version=1.1.4;destsuffix=npm/angular-material \
    npm://registry.npmjs.org;package=angular-messages;version=1.6.4;destsuffix=npm/angular-messages \
    npm://registry.npmjs.org;package=d3;version=3.5.17;destsuffix=npm/d3 \
    npm://registry.npmjs.org;package=material-design-lite;version=1.3.0;destsuffix=npm/material-design-lite \
"

inherit systemd

NODE_MODULES_DIR="${WORKDIR}/build/src/web/web-service/frontend/node_modules/"

do_copy_npm_packages() {
    for p in angular angular-animate angular-aria angular-material angular-messages d3 material-design-lite
    do
	cp -R ${WORKDIR}/npm/$p ${NODE_MODULES_DIR}/
    done
}
addtask copy_npm_packages after do_compile before do_install

EXTRA_OECMAKE:append = "\
    -GNinja \
    -DOT_THREAD_VERSION=1.3 \ 
    -DOTBR_INFRA_IF_NAME=wlan0 \ 
    -DOTBR_BACKBONE_ROUTER=ON \
    -DOPENTHREAD_CONFIG_BACKBONE_ROUTER_ENABLE=ON \
    -DOTBR_DUA_ROUTING=ON \
    -DOT_DUA=OFF \
    -DOT_MLR=OFF \
    -DOTBR_MDNS=avahi \
    -DOTBR_WEB=ON \
    -DBUILD_TESTING=OFF \ 
    -DCMAKE_BUILD_TYPE="Release" \
    -DOTBR_BORDER_ROUTING=ON \
    -DOTBR_COVERAGE=OFF \
    -DOTBR_SRP_ADVERTISING_PROXY=ON \ 
    -DOTBR_VENDOR_NAME="OpenThread" \
    -DOTBR_PRODUCT_NAME="Border Router" \
    -DOTBR_MESHCOP_SERVICE_INSTANCE_NAME="OpenThread Border Router" \
    -DOT_DUA=OFF \
    -DOT_POSIX_SETTINGS_PATH='"/tmp/"' \
    -DOT_MLR=OFF \
    -DOTBR_DBUS=ON \ 
    -DOT_LOG_LEVEL_DYNAMIC=OFF \
    -DOT_FULL_LOGS=ON \
    -DOT_JOINER=ON \
    -DOT_LOG_LEVEL=DEBG \
    -DOPENTHREAD_CONFIG_BACKBONE_ROUTER_DUA_NDPROXYNG_ENABLE=1 \
    -DOPENTHREAD_CONFIG_BACKBONE_ROUTER_MULTICAST_ROUTING_ENABLE=1 \
    -DOT_FIRWALL=ON \
    -DOT_DUA=ON \
    -DOT_DHCP6_SERVER=ON \
    -DOT_DHCP6_CLIENT=ON \
    -DOTBR_ENABLE_MDNS_AVAHI=1 \
    -DOTBR_TREL=ON \
    -DOT_BACKBONE_ROUTER_MULTICAST_ROUTING=ON \
    -DOT_COMMISSIONER=ON \
    -DOT_COAP=ON \
    -DOT_COAP_BLOCK=OFF \
    -DOT_COAP_OBSERVE=ON \
    -DOT_COAPS=ON \
    -DOT_BORDER_ROUTER=ON\
    -DOTBR_BORDER_ROUTING_NAT64=ON \
    -DOTBR_BORDER_AGENT=ON \
    -DOT_DNS_CLIENT_SERVICE_DISCOVERY=ON \
    -DOT_DNS_CLIENT=ON \
    -DOT_ECDSA=ON \
    -DOTBR_REST=ON \
    -DOT_SRP_SERVER=ON \
    -DOT_SRP_CLIENT=ON \
    -DOTBR_DNSSD_DISCOVERY_PROXY=ON \
    -DOT_REFERENCE_DEVICE=ON \
    -DOT_DNSSD_SERVER=ON \
    -DOTBR_NAT64=ON \
    -DOTBR_RADIO_URL=spinel+hdlc+uart:///dev/ttyACM0?uart-baudrate=460800 \
"

DEPENDS:append = " jsoncpp boost pkgconfig-native libnftnl nftables libnetfilter-queue nodejs-native avahi dbus iproute2 bind"

RDEPENDS:${PN}:append = " jsoncpp radvd libnftnl libnetfilter-queue nftables bash bind lsb-release"

FILES:${PN}:append = " \
    ${libexecdir}/otbr \
    ${bindir}/otbr_setup.sh \
"

do_install:append() {
    # default file for OSTL distribution (used by init script)
    install -d ${D}${libexecdir}/otbr/examples/platforms/${DISTRO}
    install -m 0644 ${WORKDIR}/default ${D}${libexecdir}/otbr/examples/platforms/${DISTRO}/default

    # init script
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/otbr_setup.sh ${D}${bindir}

    # init script and libraries
    install -d ${D}${libexecdir}/otbr/script
    install -m 0755 ${S}/script/setup ${D}${libexecdir}/otbr/script
    install -m 0644 ${S}/script/_*    ${D}${libexecdir}/otbr/script
}
