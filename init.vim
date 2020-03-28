
 " 获得当前文件所在目录
 let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
 " 获取配置文件所在目录
 let s:home = s:home.'/config'
 " 插件配置文件所在路径
 let s:plugin_config_path = s:home.'/plugins'

command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'

" 加载插件列表
LoadScript plug.vim
" 加载配置
LoadScript config.vim
" 加载基础配置
LoadScript base.vim
" 加载按键映射配置
LoadScript keymap.vim

" 插件目录存在才根据是否安装插件来载入配置
for plugin_name in g:plugs_order
	if HasInstall(plugin_name)
		" 如果已经安装了插件，那么载入插件配置
		let config_path = join([s:plugin_config_path, plugin_name], "/").".vim"
		if filereadable(config_path)
			exec 'source' fnameescape(config_path)
		endif
	endif
endfor

" 加载自定义配置
" for config in s:custom_file_list
"     exec 'source' fnameescape(config)
" endfor

" 加载主题配置
LoadScript theme.vim

