import HoverRevealer from '../../misc/HoverRevealer.js';
import PanelButton from '../PanelButton.js';
import Asusctl from '../../services/asusctl.js';
import Indicator from '../../services/onScreenIndicator.js';
import icons from '../../icons.js';
import { App, Widget, Utils } from '../../imports.js';
import { Bluetooth, Audio, Notifications, Network } from '../../imports.js';

const ProfileIndicator = () => Widget.Icon({
    connections: [[Asusctl, icon => {
        icon.visible = Asusctl.profile !== 'Balanced';
        icon.icon = icons.asusctl.profile[Asusctl.profile];
    }]],
});

const ModeIndicator = () => Widget.Icon({
    connections: [[Asusctl, icon => {
        icon.visible = Asusctl.mode !== 'Hybrid';
        icon.icon = icons.asusctl.mode[Asusctl.mode];
    }]],
});

const MicrophoneMuteIndicator = () => Widget.Icon({
    icon: icons.audio.mic.muted,
    connections: [[Audio, icon => {
        icon.visible = Audio.microphone?.isMuted;
    }, 'microphone-changed']],
});

const DNDIndicator = () => Widget.Icon({
    icon: icons.notifications.silent,
    binds: [['visible', Notifications, 'dnd']],
});

const BluetoothDevicesIndicator = () => Widget.Box({
    connections: [[Bluetooth, box => {
        box.children = Bluetooth.connectedDevices
            .map(({ iconName, name }) => HoverRevealer({
                indicator: Widget.Icon(iconName + '-symbolic'),
                child: Widget.Label(name),
            }));

        box.visible = Bluetooth.connectedDevices.length > 0 && Bluetooth.enabled;
    }, 'notify::connected-devices']],
});

const BluetoothIndicator = () => Widget.Icon({
    className: 'bluetooth',
    icon: icons.bluetooth.enabled,
    binds: [['visible', Bluetooth, 'enabled']],
});

// const NetworkIndicator = () => Widget.Stack({
//     items: [
//         ['wifi', Widget.Icon({
//             connections: [[Network, icon => {
//                 icon.icon = Network.wifi?.iconName;
//             }]],
//         })],
//         ['wired', Widget.Icon({
//             connections: [[Network, icon => {
//                 icon.icon = Network.wired?.iconName;
//             }]],
//         })],
//     ],
//     binds: [['shown', Network, 'primary']],
// });

const NetworkIndicator = () => Widget.Icon({
    className: 'network',
    connections: [[Network, icon => {
        if (Network.wifi.enabled) {
            icon.icon = Network.wifi?.iconName || '';
        }
        else {
            icon.icon = 'network-wireless-disconnected-symbolic';
        }
    }]],
});

const NetworkRevealerIndicator = ({ direction = 'left' } = {}) => Widget.Box({
    connections: [[Network, box => {
        box.children = [HoverRevealer({
            className: `network-hover-all`,
            direction,
            indicator: NetworkIndicator(),
            child: Widget.Label({
                className: 'network-hover',
                vexpand: true,
                truncate: 'end',
                connections: [[Network, label => {
                    label.label = `${Network.wifi?.ssid} ` || 'Not Connected ';
                }]],
            }),
            connections: [[Network, revealer => {
                const label = `${Network.wifi?.ssid} `;
                if (revealer.label === label)
                return;

                revealer.label = label;
                revealer.revealChild = true;
                Utils.timeout(3000, () => {
                    revealer.revealChild = false;
                });
            }]],
        })];
    }, 'notify::networks']],
});

const AudioIndicator = () => Widget.Icon({
    connections: [[Audio, icon => {
        if (!Audio.speaker)
            return;

        const { muted, low, medium, high, overamplified } = icons.audio.volume;
        if (Audio.speaker.isMuted)
            return icon.icon = muted;

        icon.icon = [[101, overamplified], [67, high], [34, medium], [1, low], [0, muted]]
            .find(([threshold]) => threshold <= Audio.speaker.volume * 100)[1];
    }, 'speaker-changed']],
});

const AudioRevealerIndicator = ({ direction = 'left' } = {}) => Widget.Box({
    connections: [[Audio, box => {
        box.children = [HoverRevealer({
            className: `audio-hover-all`,
            direction,
            indicator: AudioIndicator(),
            child: Widget.Label({
                className: 'audio-hover',
                vexpand: true,
                truncate: 'end',
                connections: [[Audio, label => {
                    label.label = `${Math.round(Audio.speaker?.volume * 100)}% `;
                }, 'speaker-changed']],
            }),
            connections: [[Audio, revealer => {
                const label = `${Math.round(Audio.speaker?.volume * 100)}% `;
                if (revealer.label === label)
                return;

                revealer.label = label;
                revealer.revealChild = true;
                Utils.timeout(3000, () => {
                    revealer.revealChild = false;
                });
            }]],
        })];
    }, 'notify::speakers']],
});

const MicrophoneIndicator = () => Widget.Icon({
    connections: [[Audio, icon => {
        if (!Audio.microphone)
            return;

        const { muted, low, medium, high, overamplified } = icons.audio.mic;
        if (Audio.microphone.isMuted)
            return icon.icon = muted;

        icon.icon = [[101, overamplified], [67, high], [34, medium], [1, low], [0, low]]
            .find(([threshold]) => threshold <= Audio.microphone.volume * 100)[1];
    }, 'microphone-changed']],
});

const MicrophoneRevealerIndicator = ({ direction = 'left' } = {}) => Widget.Box({
    connections: [[Audio, box => {
        box.children = [HoverRevealer({
            className: `mic-hover-all`,
            direction,
            indicator: MicrophoneIndicator(),
            child: Widget.Label({
                className: 'mic-hover',
                vexpand: true,
                truncate: 'end',
                connections: [[Audio, label => {
                    label.label = `${Math.round(Audio.microphone?.volume * 100)}% `;
                }, 'microphone-changed']],
            }),
            connections: [[Audio, revealer => {
                const label = `${Math.round(Audio.microphone?.volume * 100)}% `;
                if (revealer.label === label)
                return;

                revealer.label = label;
                revealer.revealChild = true;
                Utils.timeout(3000, () => {
                    revealer.revealChild = false;
                });
            }]],
        })];
        box.visible = !Audio.microphone.isMuted;
    }, 'microphone-changed']],
});

export default () => PanelButton({
    className: 'quicksettings panel-button',
    onClicked: () => App.toggleWindow('quicksettings'),
    // onScrollUp: () => {
    //     Audio.speaker.volume += 0.02;
    //     Indicator.speaker();
    // },
    // onScrollDown: () => {
    //     Audio.speaker.volume -= 0.02;
    //     Indicator.speaker();
    // },
    connections: [[App, (btn, win, visible) => {
        btn.toggleClassName('active', win === 'quicksettings' && visible);
    }]],
    child: Widget.Box({
        children: [
            // Asusctl?.available && ProfileIndicator(),
            // Asusctl?.available && ModeIndicator(),
            // MicrophoneMuteIndicator(),
            DNDIndicator(),
            BluetoothDevicesIndicator(),
            BluetoothIndicator(),
            NetworkRevealerIndicator(),
            AudioRevealerIndicator(),
            MicrophoneRevealerIndicator(),
        ],
    }),
});
