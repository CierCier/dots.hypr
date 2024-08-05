const { Gtk } = imports.gi
import Variable from "resource:///com/github/Aylur/ags/variable.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js"
import Mpris from 'resource:///com/github/Aylur/ags/service/mpris.js';

const options = userOptions.music.cava

export default () => Widget.Label({
  className: 'txt-smallie bar-music-txt',
  attribute: {
    cavaVar: Variable([], {
        listen: [
            [
              'bash', '-c',
              `printf "[general]\n  \
                        framerate=60\n    \
                        bars = ${options.bars}\n  \
                        bar_spacing = ${options.spacing}\n \
                        [input]\n \
                        method = pipewire\n \
                        [output]\n        \
                        channels = mono\n \
                        method = raw\n    \
                        raw_target = /dev/stdout\n \
                        data_format = ascii\n \
                        ascii_max_range = ${options.characters.length-1}\n" | \
                        cava -p /dev/stdin`
            ],
            (out) => out.split(';').slice(0, -1).map((x) => parseInt(x))
          ]
    }),
  }
  ,//////
  setup: (self)=>{
    const varHandler =  self.attribute.cavaVar.connect('changed', ()=> {
        const mpris = Mpris.getPlayer('');
        if (!mpris) self.label = 'No Media';
        else{
            var str = "";
            const cavaData = self.attribute.cavaVar.getValue();
            for (let i = 0; i < cavaData.length; i++) {
                str += options.characters[cavaData[i]];
            }
            self.label = str;
        }

    } );

    self.on('destroy', ()=> {
        self.attribute.cavaVar.stopListen();
        self.attribute.cavaVar.disconnect(varHandler);
    });
  }

})