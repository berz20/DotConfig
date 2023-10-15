import OverviewButton from './buttons/OverviewButton.js';
import Workspaces from './buttons/Workspaces.js';
import FocusedClient from './buttons/FocusedClient.js';
import MediaIndicator from './buttons/MediaIndicator.js';
import DateButton from './buttons/DateButton.js';
import NotificationIndicator from './buttons/NotificationIndicator.js';
import SysTray from './buttons/SysTray.js';
import ColorPicker from './buttons/ColorPicker.js';
import SystemIndicators from './buttons/SystemIndicators.js';
import PowerMenu from './buttons/PowerMenu.js';
import Separator from '../misc/Separator.js';
import ScreenRecord from './buttons/ScreenRecord.js';
import BatteryBar from './buttons/BatteryBar.js';
import SubMenu from './buttons/SubMenu.js';
import KbLayout from './buttons/KbLayout.js';
import LockTime from './buttons/LockTime.js';
import Tomato from './buttons/Tomato.js';
import RcloneDrive from './buttons/RcloneDrive.js';
import { SystemTray, Widget, Variable } from '../imports.js';
import { Notifications, Mpris, Battery } from '../imports.js';
import { GitHub, CorsiMagistrale, GDrive, OverLeaf, Jitsi, GCalendar, ChatGPT } from './buttons/WebPages.js';
import { video_block, mic_muted, mic_block, none_block } from '../variables.js';
import Recorder from '../services/screenrecord.js';

const submenuItems = Variable(1);
SystemTray.connect('changed', () => {
    submenuItems.setValue(SystemTray.items.length + 1);
});

const SeparatorDot = (service, condition, color = '#484544') => Separator({
    orientation: 'vertical',
    valign: 'center',
    style:'background-color: '+color,
    connections: service && [[service, dot => {
        dot.visible = condition(service);
    }]],
});

// const SeparatorDotVideo = () => Separator({
//     orientation: 'vertical',
//     valign: 'center',
//
//     style:'background-color: #00ff00',
//     connections: [
//       [video_block, dot => {
//         dot.visible = video_block.value == 1;
//     }]
//    ],
// });
//
// const SeparatorDotMic = () => Separator({
//     orientation: 'vertical',
//     valign: 'center',
//
//     style:'background-color: #ffa000',
//     connections: [
//       [mic_block, dot => {
//         dot.visible = mic_block.value == 1;
//     }]
//    ],
// });
//
// const SeparatorDotNone = () => Separator({
//     orientation: 'vertical',
//     valign: 'center',
//
//     // style:'background-color: #ffa000',
//     connections: [
//       [none_block, dot => {
//         dot.visible = none_block.value == 1;
//     }]
//    ],
// });

const Start = () => Widget.Box({
    className: 'start',
    children: [
        OverviewButton(),
        SeparatorDot(),
        Workspaces(),
        SeparatorDot(),
        FocusedClient({
            direction: 'right',
            children: [
                CorsiMagistrale(),
                ChatGPT(),
                GCalendar(),
                GDrive(),
                GitHub(),
                OverLeaf(),
                Jitsi(),
            ],
        }),
        Widget.Box({ hexpand: true }),
        NotificationIndicator(),
        SeparatorDot(Notifications, n => n.notifications.length > 0 || n.dnd),
    ],
});

const Center = () => Widget.Box({
    className: 'center',
    children: [
        DateButton(),
    ],
});

const End = () => Widget.Box({
    className: 'end',
    children: [
        SeparatorDot(none_block, v => v.value ==1,'#484544'),
        SeparatorDot(mic_block, v => v.value ==1,'#ffa000'),
        SeparatorDot(video_block, v => v.value ==0,'#00ff00'),
        // SeparatorDot(Mpris, m => m.players.length > 0),
        MediaIndicator(),
        Widget.Box({ hexpand: true }),

        SubMenu({
            items: submenuItems,
            children: [
                SysTray(),
                RcloneDrive(),
                Tomato(),
                LockTime(),
                KbLayout(),
                ColorPicker(),
            ],
        }),
        SeparatorDot(),
        // ScreenRecord(),
        // SeparatorDot(Recorder, r => r.recording),
        BatteryBar(),
        SeparatorDot(Battery, b => b.available),
        SystemIndicators(),
        SeparatorDot(),
        PowerMenu(),
    ],
});

export default monitor => Widget.Window({
    name: `bar${monitor}`,
    exclusive: true,
    monitor,
    anchor: ['top', 'left', 'right'],
    child: Widget.CenterBox({
        className: 'panel',
        startWidget: Start(),
        centerWidget: Center(),
        endWidget: End(),
    }),
});
