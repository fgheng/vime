" 获得当前文件所在目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" 获取配置文件所在目录
let s:home = s:home.'/config'
" 插件配置文件所在路径
let s:plugin_config_path = s:home.'/plugins'
" 自定义配置路径
let s:custom_config_path = s:home.'/custom'
" 获取当前目录下的所有.vim文件
"let file_list = split(globpath(plugin_config_path,'*.vim'),'\n')
let s:custom_file_list = split(globpath(s:custom_config_path,'*.vim'),'\n')

" 定义加载配置的命令
command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'

" 加载基础配置
LoadScript base.vim

" 加载插件列表
LoadScript plug.vim

" 加载按键映射配置
LoadScript keymap.vim

" 根据载入的插件来载入对应的插件配置
for config in g:plugs_order
	let s:plug_path = join([s:plugin_config_path, config], "/").".vim"
	if filereadable(s:plug_path)
		exec 'source' fnameescape(s:plug_path)
	endif
endfor

" 加载自定义配置
for config in s:custom_file_list
    exec 'source' fnameescape(config)
endfor

" 加载主题配置
LoadScript theme.vim
