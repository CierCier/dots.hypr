import fabric

import os, psutil

from logging import getLogger

from fabric.widgets.box import Box
from fabric.widgets.circular_progress_bar import CircularProgressBar
from fabric.widgets.wayland import Window
from fabric.widgets.button import Button
from fabric.widgets.label import Label
from fabric.widgets.date_time import DateTime
from fabric.system_tray.widgets import SystemTray

from fabric.hyprland.widgets import WorkspaceButton, Workspace, ActiveWindow

from fabric.utils import ( set_stylesheet_from_file, bulk_replace, monitor_file, invoke_repeater, get_relative_path )



PYWAL = True
AudioWidget = True

logger = getLogger(__name__)
if AudioWidget == True:
    try:
        from fabric.audio.services import Audio
    except Exception as e:
        logger.warning(f"AudioWidget is disabled: {e}")
        AudioWidget = False
