import Theme from '../services/theme/theme.js';
import PowerMenu from '../services/powermenu.js';
import icons from '../icons.js';
import { App, Widget, Utils } from '../imports.js';
import Gtk from 'gi://Gtk';

const Item = (label, icon, onActivate) => Widget.MenuItem({
    onActivate,
    child: Widget.Box({
        children: [
            Widget.Icon(icon),
            Widget.Label({
                label,
                hexpand: true,
                xalign: 0,
            }),
        ],
    }),
});

export default () => Widget.Menu({
    className: 'desktop-menu',
    children: [
        Widget.MenuItem({
            child: Widget.Box({
                children: [
                    Widget.Icon(icons.powermenu.shutdown),
                    Widget.Label({
                        label: 'System',
                        hexpand: true,
                        xalign: 0,
                    }),
                ],
            }),
            submenu: Widget.Menu({
                children: [
                    Item('Shutdown', icons.powermenu.shutdown, () => PowerMenu.action('shutdown')),
                    Item('Log Out', icons.powermenu.logout, () => PowerMenu.action('logout')),
                    Item('Reboot', icons.powermenu.reboot, () => PowerMenu.action('reboot')),
                    Item('Sleep', icons.powermenu.sleep, () => PowerMenu.action('reboot')),
                ],
            }),
        }),
        Widget.MenuItem({
            child: Widget.Box({
                children: [
                    Widget.Icon(icons.powermenu.shutdown),
                    Widget.Label({
                        label: 'Web Pages',
                        hexpand: true,
                        xalign: 0,
                    }),
                ],
            }),
            submenu: Widget.Menu({
                children: [
                    Item('Corsi Magistrale', icons.web.cmag, () => Utils.execAsync('firefox https://www.fisicamagistrale.unito.it/do/iscritti.pl/Search?search=matricola:912651&title=Le%20mie%20registrazioni%20agli%20insegnamenti&format=2')),
                    Item('ChatGPT', icons.web.chatgpt, () => Utils.execAsync('firefox https://chat.openai.com/')),
                    Item('Google Calendar', icons.web.gcalendar, () => Utils.execAsync('firefox https://calendar.google.com/calendar/u/0/r')),
                    Item('Google Drive', icons.web.gdrive, () => Utils.execAsync('firefox https://drive.google.com/drive/u/0/shared-with-me')),
                    Item('GitHub', icons.web.github, () => Utils.execAsync('firefox https://github.com/')),
                    Item('OverLeaf', icons.web.overleaf, () => Utils.execAsync('firefox https://www.overleaf.com/')),
                    Item('Jitsi', icons.web.jitsi, () => Utils.execAsync('firefox https://meet.jit.si/')),
                ],
            }),
        }),
        Item('Applications', icons.apps.apps, () => App.openWindow('applauncher')),
        Widget({ type: Gtk.SeparatorMenuItem }),
        Item('Settings', icons.settings, () => Theme.openSettings()),
    ],
});
