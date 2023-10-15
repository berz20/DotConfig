import icons from '../../icons.js';
import FontIcon from '../../misc/FontIcon.js';
import options from '../../options.js';
import PanelButton from '../PanelButton.js';
import Gtk from 'gi://Gtk';
import { Battery, Widget } from '../../imports.js';

const Indicator = () => Widget.Stack({
    items: [
        ['false', Widget.Icon({ binds: [['icon', Battery, 'icon-name']] })],
        ['true', FontIcon({ icon: icons.battery.charging })],
    ],
    connections: [[Battery, stack => {
        stack.shown = `${Battery.charging || Battery.charged}`;
    }]],
});

const PercentLabel = () => Widget.Revealer({
    transition: 'slide_right',
    revealChild: true,
    child: Widget.Label({
        binds: [['label', Battery, 'percent', p => `${p}%`]],
    }),
});

const EnergyAndTimeLabel = () => Widget.Revealer({
    transition: 'slide_right',
    revealChild: false,
    child: Widget.Label({
        binds: [['label', Battery, 'time-remaining', p => {
            const hours = Math.floor(p / 3600);
            const minutes = Math.floor((p % 3600) / 60);
            const roundedEnergyRate = Battery.energy_rate.toFixed(1); // Round to 1 decimal place
            return `${hours}:${minutes.toString().padStart(2, '0')} (${roundedEnergyRate}W)`;
        }]],
    }),
});

const LevelBar = () => Widget({
    type: Gtk.LevelBar,
    valign: 'center',
    binds: [['value', Battery, 'percent', p => p / 100]],
});

export default () => {
    const percentRevealer = PercentLabel()
    const timeRevealer = EnergyAndTimeLabel()

    return PanelButton({
        className: 'battery-bar',
        onClicked: () => {
            percentRevealer.revealChild = !percentRevealer.revealChild;
            timeRevealer.revealChild = !timeRevealer.revealChild;
        },
        content: Widget.Box({
            binds: [['visible', Battery, 'available']],
            connections: [[Battery, w => {
                w.toggleClassName('charging', Battery.charging || Battery.charged);
                w.toggleClassName('medium', Battery.percent < options.battaryBar.medium);
                w.toggleClassName('low', Battery.percent < options.battaryBar.low);
            }]],
            children: [
                Indicator(),
                percentRevealer,
                timeRevealer,
                // LevelBar(),
            ],
        }),
    });
};
