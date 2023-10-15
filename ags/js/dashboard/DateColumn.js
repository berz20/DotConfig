import icons from '../icons.js';
import Clock from '../misc/Clock.js';
import * as vars from '../variables.js';
import { Widget } from '../imports.js';
import Theme from '../services/theme/theme.js';

const SysProgress = (type, title, unit, max) => Widget.Box({
    className: `circular-progress-box ${type}`,
    hexpand: true,
    connections: [[vars[type], box => {
        box.tooltipText = max === 0
            ? `${title}: ${Math.floor(vars[type].value * 100)}${unit}`
            : `${title}: ${(vars[type].value * max).toFixed(1)}/${(max).toFixed(1)} ${unit}`;
    }]],
    child: Widget.CircularProgress({
        hexpand: true,
        className: `circular-progress ${type}`,
        child: Widget.Icon(icons.system[type]),
        startAt: 0.75,
        inverted: true,
        binds: [['value', vars[type]]],
        connections: [[Theme, prog => {
            prog.rounded = Theme.getSetting('radii') > 0;
        }]],
    }),
});

export default () => Widget.Box({
    vertical: true,
    className: 'datemenu',
    children: [
        Clock({ format: '%H:%M' }),
        Widget.Label({
            binds: [['label', vars.uptime, 'value', t => `uptime: ${t}`]],
        }),
        Widget.Box({
            className: 'calendar',
            children: [
                Widget({
                    type: imports.gi.Gtk.Calendar,
                    hexpand: true,
                    halign: 'center',
                }),
            ],
        }),
        Widget.Box({
            className: 'system-info',
            children: [
                SysProgress('cpu', 'Cpu', '%',0.0),
                SysProgress('ram', 'Ram', 'Gb', 15.836),
                SysProgress('temp', 'Temperature', '°',0.0),
                SysProgress('mem', 'Mem', 'Gb', 460.0),
            ],
        }),
    ],
});
