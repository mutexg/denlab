# Vim Project Configuration

Vim can be configured to use the [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
plugin to provide code-completion.

Once you've installed the YouCompleteMe plugin you should whitelist the
configuration file that is part of the DenLabOS repository. You can
do this by adding the following option to your `.vimrc` file:

```vim
let g:ycm_extra_conf_globlist = ['~/denlab/.ycm_extra_conf.py']
```
