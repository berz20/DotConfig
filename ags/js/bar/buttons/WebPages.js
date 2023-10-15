import PanelButton from '../PanelButton.js';
import { Notifications, Utils, Widget, Variable } from '../../imports.js';
import icons from '../../icons.js';

export const GCalendar = () => PanelButton({
   className: 'gcalendar',
   // hexpand: false,
   // valign: 'center',
   content: Widget.Icon(icons.web.gcalendar),
   onClicked: () => Utils.execAsync('firefox https://calendar.google.com/calendar/u/0/r'),
});

export const Jitsi = () => PanelButton({
   className: 'jitsi',
   // hexpand: false,
   // valign: 'center',
   content: Widget.Icon(icons.web.jitsi),
   onClicked: () => Utils.execAsync('firefox https://meet.jit.si/'),
});

export const OverLeaf = () => PanelButton({
   className: 'overleaf',
   // hexpand: false,
   // valign: 'center',
   content: Widget.Icon(icons.web.overleaf),
   onClicked: () => Utils.execAsync('firefox https://www.overleaf.com/'),
});

export const GDrive = () => PanelButton({
   className: 'gdrive',
   // hexpand: false,
   // valign: 'center',
   content: Widget.Icon(icons.web.gdrive),
   onClicked: () => Utils.execAsync('firefox https://drive.google.com/drive/u/0/shared-with-me'),
});

export const CorsiMagistrale = () => PanelButton({
   className: 'corsi-magistral',
   // hexpand: false,
   // valign: 'center',
   content: Widget.Icon(icons.web.cmag),
   onClicked: () => Utils.execAsync('firefox https://www.fisicamagistrale.unito.it/do/iscritti.pl/Search?search=matricola:912651&title=Le%20mie%20registrazioni%20agli%20insegnamenti&format=2'),
});

export const GitHub = () => PanelButton({
   className: 'github',
   // hexpand: false,
   // valign: 'center',
   content: Widget.Icon(icons.web.github),
   onClicked: () => Utils.execAsync('firefox https://github.com/'),
});

export const ChatGPT = () => PanelButton({
   className: 'chatgpt',
   // hexpand: false,
   // valign: 'center',
   content: Widget.Icon(icons.web.chatgpt),
   onClicked: () => Utils.execAsync('firefox https://chat.openai.com/'),
});
