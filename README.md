# vime

## 1. About

该项目的特点是一个插件对应一个配置文件，只要在插件列表中增加了插件，那么就会自动载入该插件的配置文件。可以说耦合性很低，甚至每个插件配置文件中的配置单独拿出来放到你自己的vim配种中就可以用了。

![vime](./assets/readme2.png)

### 2. 整体结构

```bash
├── coc-settings.json
├── config/
   ├── custom/
   ├── plugins/
   ├── base.vim
   ├── keymap.vim
   ├── plug.vim
   ├── plugs-list.vim
   └── theme.vim
├── init.vim
└── vimrc -> ./init.vim
```

简单了解下整个结构，我用的插件管理器是[junegunn/*vim*-*plug*](https://github.com/junegunn/vim-plug)。

目录结构：

1. `plug.vim`文件就是`vim-plug`的插件配置文件，里面是我们需要的插件列表，写在这里面的插件会加载他的配置，插件的配置在`plugins`目录下，vim/nvim启动的时候会根据`plug.vim`中的插件列表来这个目录下加载对应名字的配置文件，注释掉的插件不会加载其配置文件。

2. `plugs-list.vim`该文件是一些插件列表，不会加载，只是用来保存下都用过哪些插件，后期想更改插件的时候来这里先找。

3. `base.vim`用于基础配置

4. `keymap.vim`用于按键映射

5. `theme.vim`用于主题配置

6. `plugins`目录下是所有插件的配置文件，一个插件一个配置文件，只会加载`plug.vim`中安装的插件的配置。

   为了便于移植，取消了这种全局性的变量，一些需要配置文件路径的插件罗列如下，如果你需要某个插件的配置，直接复制这个插件的配置的话，需要将一些路径更改为自己的路径。

   - `config/plug.vim`:  `g:plugins_path`这是插件的安装目录
   - `config/plugins/fzf.vim.vim`: `g:fzf_dir`这是fzf用到的目录，`g:fzf_history_dir`这是fzf的历史文件所在的目录
   - `config/plugins/coc.nvim.vim`: `g:coc_data_home` 这是coc插件的安装目录

7. `custom`该目录是用户自己定义的简单脚本，该目录下的所有`.vim`脚本都会在启动的时候加载

### 3. 依赖

需要安装如下软件：

1. nodejs，npm，neovim(pip install)：必装
2. ripgrep：必装，用于文件内容检索
3. neovim-remote:：可选，vimtex会用到，但是也可以不用，安装体验更好，`pip install neovim-remote`
4. clangd：可选，用于c系补全

### 5. 安装

```bash
git clone https://github.com/fgheng/vime -C .config/nvim
```

然后打开neovim，执行`:PlugInstall`等待插件安装完毕即可！

### 6. 快捷键

不管您选择了哪种补全插件，哪种检索插件，我们的快捷键配置都会尽可能保持一致，无须更改您的使用习惯，改变的只是`neo/vim`表现形式。

#### 6.1 补全行为

补全使用的[neoclide/*coc.nvim*](https://github.com/neoclide/coc.nvim)插件，该项目中也有[ycm-core/*YouCompleteMe*](https://github.com/ycm-core/YouCompleteMe)的配置，但最近主要使用coc，故ycm的配置已经很久不更新了。

| 按键       | 描述                                                         | 提供者 |
| ---------- | ------------------------------------------------------------ | ------ |
| tab        | 1. 如果存在下拉框，那么选择下一个<br>2. 如果不存在下拉框，那么强制显示下拉框，前提是有内容显示，否则输入tab | coc    |
| shift-tab  | 如果存在下拉框的话，选择下拉框的上一个                       | coc    |
| enter      | 选中下拉框中的该条目，如果条目可以扩展，那么将会扩展         | coc    |
| gd         | 跳转到定义                                                   | coc    |
| gr         | 跳转到引用                                                   | coc    |
| gi         | 跳转到实现                                                   | coc    |
| gy         | 跳转到类型定义                                               | coc    |
| alt-j      | 1. normal模式下，跳转到下一处错误<br>2. instert模式下，如果存在下拉框，选择下一个条目<br>3. instert模式下，如果存在snippet跳转块，跳转到下一处补全处 | coc    |
| alt-k      | 同alt-j行为相反                                              | coc    |
| K          | 查看当前光标下函数的帮助                                     | coc    |
| \<space>k  | 查看当前光标下函数的参数帮助                                 | coc    |
| \<space>rn | 重命名变量、函数名称等                                       | coc    |
| \<space>f  | 按照lsp的建议对代码错误进行自动修复                          | coc    |

| 按键      | 描述                    | 提供者 |
| --------- | ----------------------- | ------ |
| \<space>l | 打开coclist             | coc    |
| \<space>a | 打开coclist dialogistic | coc    |
| \<space>c | 打开coclist command     | coc    |
| \<space>o | 打开coclist outline     | coc    |
| \<space>O | 打开coclist symbols     | coc    |
|           |                         |        |

#### 6.2 窗口与tab

| 按键           | 描述                                                         |
| -------------- | ------------------------------------------------------------ |
| ==>窗口<==     |                                                              |
| ctrl-w-h/j/k/l | 分别在当前窗口的左/下/上/右侧打开一个新的窗口                |
| ctrl-h/j/k/l   | 分别移动光标到当前窗口的左/下/上/右侧窗口                    |
| alt-H/J/K/L    | 分别移动光标到当前窗口的左/下/上/右侧窗口                    |
| ctrl-w-o       | 最大化当前窗口，再按一次恢复                                 |
| -              | 选择窗口<br>交换窗口                                         |
| q              | 关闭窗口                                                     |
| alt+(          | 窗口左右方向变小                                             |
| alt+)          | 窗口左右方向变大                                             |
| alt+-          | 窗口上下方向变小                                             |
| alt+_          | 窗口上下方向变大                                             |
| ==>tab<==      |                                                              |
| \<leader>tn    | 在后面新建一个tab                                            |
| \<leader>tc    | 关闭一个tab                                                  |
| alt-H/L        | 将当前的tab移动到左侧/右侧                                   |
| alt-h/l        | 切换到上一个/下一个tab<br>如果存在浮动终端，则切换为上一个或下一个浮动终端 |

#### 6.3 文件管理

文件管理使用的插件是[weirongxu/*coc*-*explorer*](https://github.com/weirongxu/coc-explorer)、[Shougo/*defx*.nvim](https://github.com/Shougo/defx.nvim)，两者之一，需要在`plug.vim`中选择，快捷键行为基本一致。支持浮动窗口。

~~同时可以使用\<leader>f打开ranger。~~因为coc-explorer开始支持浮动窗口，因此将\<leader>f映射为了浮动模式的coc-explorer，不再使用ranger，如果希望使用ranger，那么可以在plug.vim中加入ranger插件即可。

| 按键  | 描述                                          |
| ----- | --------------------------------------------- |
| j     | 下一个                                        |
| k     | 上一个                                        |
| h     | 收起目录                                      |
| l     | 展开目录/打开文件                             |
| H     | 递归收起目录                                  |
| L     | 递归打开目录                                  |
| J     | 跳到下一个可以展开的地方                      |
| K     | 跳到上一个可以展开的地方                      |
| enter | 进入目录并切换工作目录为进入的目录            |
| back  | 跳到上一级目并切换工作目录为切换的目录        |
| r     | 刷新目录                                      |
| v     | 选中/取消选中，并向下移动                     |
| V     | 选中/取消选中，并向上移动                     |
| *     | 选中/取消选中                                 |
| sh    | 水平打开                                      |
| sv    | 垂直打开                                      |
| st    | 新tab中打开                                   |
|       |                                               |
| dd    | 剪切文件                                      |
| Y     | 复制文件                                      |
| D     | 删除文件                                      |
| P     | 粘贴文件                                      |
| R     | 重命名文件                                    |
| N     | 添加文件或者目录，如果最后有`/`则表示添加目录 |
| yy    | 复制文件路径                                  |
| y     | 复制文件名称                                  |
| .     | 显示/关闭隐藏文件                             |
|       |                                               |
| x     | 使用系统默认应用打开文件                      |
| f     | 搜索文件                                      |
| F     | 递归搜索文件                                  |
|       |                                               |

#### 6.4 buffer与文件检索等

该操作主要由[junegunn/*fzf*.vim](https://github.com/junegunn/fzf.vim)、[Yggdroot/*LeaderF*](https://github.com/Yggdroot/LeaderF)、[neoclide/*coc*.*nvim*](https://github.com/neoclide/coc.nvim)、[liuchengxu/*vim*-*clap*](https://github.com/liuchengxu/vim-clap)中的一个完成，快捷键基本一致，主要看`plug.vim`中选择的是哪一个插件，其中[neoclide/*coc*.*nvim*](https://github.com/neoclide/coc.nvim)优先级最低，有其他插件，那么就会覆盖掉coc的操作。

| 按键  | 描述                                                         | 提供者               |
| ----- | ------------------------------------------------------------ | -------------------- |
| alt-r | 最近打开的文件                                               | fzf/leaderf/clap/coc |
| alt-b | 显示当前打开的所有buffer                                     | fzf/leaderf/clap/coc |
| alt-f | 1. 搜索工程目录下的文件<br>2. 搜索wiki笔记目录下的文件       | fzf/leaderf/clap/coc |
| alt-F | 搜索HOME下的所有文件                                         | fzf/leaderf/clap/coc |
| alt-w | 显示打开的窗口                                               | fzf/leaderf/clap/coc |
| alt-m | 显示所有的标记                                               | fzf/clap/coc         |
| alt-M | 显示所有映射                                                 | fzf/clap/coc         |
| alt-s | 1. 使用rg搜索当前工程下的文件内容<br>2. 如果正在编辑wiki目录下的笔记，那么使用rg会搜索wiki笔记目录下的内容 | fzf/leaderf/clap/coc |
| alt-c | 显示所有命令                                                 | fzf/leaderf/clap/coc |
| ？    | 模糊搜索所有打开的buffer的内容                               | fzf/leaderf/clap/coc |
| alt-y | 显示复制内容                                                 | clap/coc             |
| alt-g | 显示未提交的file列表                                         | fzf/clap             |
| alt-G | 显示所有提交的file列表                                       | fzf/clap/coc         |


#### 6.5 多光标

多光标使用的是插件[vim-visual-multi](https://github.com/mg979/vim-visual-multi)以及coc自带的多光标，如果`plug.vim`中没有[vim-visual-multi](https://github.com/mg979/vim-visual-multi)那么会使用coc自带的插件，coc行为与前者类似，但是功能不如前者多。

| 按键             | 模式                  | 描述                                                         |
| ---------------- | --------------------- | ------------------------------------------------------------ |
| tab              | visual-multi-mode     | 光标和扩展模式直接切换                                       |
| shift-左右方向键 | normal                | 选中区域并进入visual-multi-mode                              |
| ctrl-c           | normal                | 在当前位置插入一个光标（然后使用上下左右键移动到指定未知添加下一个光标，hjkl键会移动添加的光标） |
| ctrl-down/up     | normal                | 垂直方向插入多光标                                           |
| ctrl-s           | normal/visual         | 1. 选中当前光标下的所有单词<br>2. visual模式下选中所有的当前选中的内容 |
| ctrl-n/N         | normal                | 在visual模式下选中内容之后，按下ctrl-n会在下一处与当前选中内一样的地方插入光标。非visual模式下，与ctrl-s表现差不多，不过是依次选择当前光标下的单词。 |
| q                | visual-multi-mode     | ~~取消当前位置插入的光标，并跳到下一个匹配位置~~<br>取消当前光标或者选中的区域 |
| ~~Q~~            | ~~visual-multi-mode~~ | ~~取消当前的光标或者选中的区域~~                             |
| ]/[              | visual-multi-mode     | 在多个选中的光标之间进行跳转                                 |
| n/N              | visual-multi-mode     | 跳到下一个/上一个匹配的模式，可以代替]/[进行使用             |
| S                | visual-multi-mode     | 在多光标模式下，将多个选中的内容以某种符号进行进行包围       |
| o                | visual-multi-mode     | 交换光标位置                                                 |
| m                |                       |                                                              |
| \\\/             | normal                | 以正则匹配的方式设置多光标                                   |
|                  |                       |                                                              |


#### 6.6 注释与文档

文档生成器使用[kkoomen/*vim*-*doge*](https://github.com/kkoomen/vim-doge)

| 按键       | 模式   | 描述         |
| ---------- | ------ | ------------ |
| \<leader>d | normal | 生成函数文档 |

注释插件使用[nerdcomment](https://github.com/preservim/nerdcommenter)或者[*tyru*/*caw*.*vim*](https://github.com/tyru/caw.vim)

caw快捷键，功能没有nerdcomment多，但是简洁够用

| 按键        | 模式         | 描述                     |
| ----------- | ------------ | ------------------------ |
| \<leader>cc | nomal/visual | 注释/取消注释            |
| \<leader>ci | nomal/visual | 在当前光标处加入注释     |
| \<leader>cI | nomal/visual | 在当前行的最开始加入注释 |
| \<leader>ca | nomal/visual | 在当前行最后加入注释     |
| \<leader>cw | nomal        | 给单词加注释             |
| \<leader>cb | nomal/visual | 给选中的区域弄一个块注释 |
| \<leader>co | nomal        | 在下一行加入注释         |
| \<leader>cO | nomal        | 在上一行加入注释         |

下面的是nerdcomment的快捷键

| 按键               | 模式          | 描述                                       |
| ------------------ | ------------- | ------------------------------------------ |
| \<leader>cc        | normal/visual | 注释                                       |
| \<leader>cu        | normal/visual | 取消注释选中的内容                         |
| \<leader>cs        | normal/visual | 用一种比较好看的方式注释当前行或选中的内容 |
| \<leader>ci        | normal/visual | 注释/取消注释                              |
| \<leader>cm        | normal/visual | 用一种最简单的方式注释当前行或选中的内容   |
| \<leader>cl        | normal/visual | 按行的方式注释选中的内容                   |
| \<leader>cb        | normal/visual | 注释选中的内容                             |
| \<leader>ca        | normal        | 切换到另一种注释符号                       |
|                    |               |                                            |
| \<leader>cA        | normal        | 在当前行最后增加注释符号并进入插入模式     |
| \<leader>c$        | normal        | 从当前光标处注释到当前行的最后             |
| \<leader>c\<space> |               |                                            |
|                    |               |                                            |
| \<leader>cn        |               |                                            |

#### 6.7 终端

终端使用的是[voldikss/vim-*floaterm*](https://github.com/voldikss/vim-floaterm)

| 按键  | 模式           | 描述                         |
| ----- | -------------- | ---------------------------- |
| alt = | normal         | 打开/关闭当前终端            |
| alt + | normal/tnormal | 新建一个终端                 |
| alt h | tnormal        | 打开终端后，切换到上一个终端 |
| alt l | tnormal        | 打开终端后，切换到下一个终端 |

#### 6.8 代码折叠

代码折叠使用的插件是[pseewald/vim-*anyfold*](https://github.com/pseewald/vim-anyfold)

| 按键 | 模式   | 描述                 |
| ---- | ------ | -------------------- |
| zc   | normal | 折叠                 |
| zC   | normal | 循环折叠             |
| zo   | normal | 打开折叠             |
| zO   | normal | 循环打开折叠         |
| zc   | normal | 打开折叠或者关闭折叠 |
| zA   | normal | za的循环             |
| zm   | normal | 折起更多             |
| zM   | normal | 折起所有             |
| zr   | normal | 减少折叠             |
|      | normal | 打开所有折叠         |

#### 6.9 笔记

笔记使用的是插件[vimwiki/*vimwiki*](https://github.com/vimwiki/vimwiki)，可以记笔记可以写日记，支持markdown。

可以使用[junegunn/*fzf.vim*](https://github.com/junegunn/fzf.vim)、[Yggdroot/*LeaderF*](https://github.com/Yggdroot/LeaderF)进行笔记文件和笔记内容的搜索，这个已经配置好了可以直接使用。

![biji](https://s1.ax1x.com/2020/03/29/GE03VS.gif)

| 按键                 | 模式    | 描述                       |
| -------------------- | ------- | -------------------------- |
| ===>笔记<===         |         |                            |
| alt s                | normal  | 搜索vimwiki中的内容        |
| \<leader>ww          | normal  | 打开vimwiki                |
| \<leader>wt          | normal  | 在新的tab打开vimwiki       |
| \<leader>wd          | normal  | 删除当前page               |
| \<leader>wr          | normal  | 重命名当前的page           |
| ===>日记<===         |         |                            |
| \<leader>wi          |         | 打开日记列表               |
| \<leader>w\<leader>i |         | 更新当前的日记列表         |
| \<leader>w\<leader>w |         | 打开今天的日记             |
| \<leader>w\<leader>t |         | 在新的tab中打开今天的日记  |
| ctrl up/down         |         | 打开昨天/明天的日记        |
| ===>导航<===         |         |                            |
| enter                |         | 创建链接                   |
| ctrl shift enter     |         |                            |
| back                 |         | 回到上一级目录             |
| tab                  |         | 跳转到下一处链接           |
| shift tab            |         | 跳转到上一处链接           |
| ===>编辑快捷键<===   |         |                            |
| =                    |         | 增加标题                   |
| -                    |         | 减少标题                   |
| +                    |         | 创建链接                   |
| glm                  |         | 增加list item的缩进        |
| gll                  |         | 减少list item的缩进        |
| gl* 或 gl8           |         | 将该行变为*条目            |
| gl# 或 gl3           |         | 将该行变为#                |
| gl-                  |         | 将该行变为-                |
| gl1                  |         | 将改行变为1.               |
| ===>表格模式<===     |         |                            |
| cr                   | insert  | 插入模式                   |
| tab                  | instert | 插入模式，跳到下一个输入框 |
| gqq 或 gww           | normal  | 格式化表格                 |
|                      |         |                            |

#### 6.9 书签

标记使用vim-bookmarks或者coc-bookmarks，因为coc-explorer支持显示coc-bookmark中的书签，所以我使用coc-bookmark，不过可以在plug.vim中加入vim-bookmarks两者快捷键一致

| 按键 | 模式   | 描述                   |
| ---- | ------ | ---------------------- |
| ma   | normal | 增加一个带有备注的书签 |
| mm   | normal | 增加一个标签           |
| ml   | nromal | 打开书签列表           |
| mc   | nromal | 清除标签               |
| mj/k | normal | 跳转标签               |
|      |        |                        |
|      |        |                        |



#### 6.9 Surround

Surround是使用快捷键来给指定的字符串添加包围，比如引号等。使用的插件是[tpope/*vim*-*surround*](https://github.com/tpope/vim-surround)

| 按键      | 模式   | 描述                                             |
| --------- | ------ | ------------------------------------------------ |
| cs"''     | normal | changed surround "' 将双引号改为单引号           |
| cs'\<q>   | normal | 将单引号改变为\<q>包围                           |
| cst"      | normal | 将tag改变为双引号，比如\<q>hello\</q>变为"hello" |
| ds"       | normal | 删除双引号                                       |
| ysiw]     | normal | iw是选择一个单词，在选中的单词处增加中括号       |
| ysiw[     | normal | 同上，不过两侧会增加空格                         |
| yss)      | normal | 整行增加括号                                     |
| ysiw\<em> | normal | 在一个单词处增加\<em>\</em>包围                  |

#### 6.10 Git

git插件可以选择使用[airblade/vim-*gitgutter*](https://github.com/airblade/vim-gitgutter)、[tpope/vim-*fugitive*](https://github.com/tpope/vim-fugitive)、[neoclide/*coc-git*](https://github.com/neoclide/coc-git)

| 按键            | 模式    | 描述                       | 提供者|
| ------------------ | ------- | -------------------------- |--------|
| ~~gf~~ | normal | 折叠/打开未改变的行 | gitgutter |
| ~~gk~~ | normal | 跳转到上一个修改地方 | coc-git |
| ~~gj~~ | normal | 跳转到下一个修改地方 | coc-git |
| ~~gp~~ | normal | 浮动预览光标处的修改 | coc-git |
| ~~gu~~ | normal | 撤销光标处相对于上次提交的修改 | coc-git |
| \<leader>gb | normal | 打开/关闭 blame | fugitive |
| \<leader>gs | normal | git different split | fugitive |
| ~~gm~~ | normal | 查看当前文件的commits          | fzf/coc-git |
| ~~gM~~ | normal | 查看所有的commits              | fzf/coc-git |
| \<leader>gc | normal | git commit                     | fugitive  |
| \<leader>gw | normal | 写入，相当于git add | fugitive |


#### 6.11 数据库

数据库可以选择使用[tpope/vim-*dadbod*](https://github.com/tpope/vim-dadbod)

#### 6.12 绘图

绘图使用[vim-scripts/*DrawIt*](https://github.com/vim-scripts/DrawIt)，命令行输入`DrawIt`进入绘图模式。

#### 6.13 Latex

latex可以选择使用[lervag/*vimtex*](https://github.com/lervag/vimtex)

vimtex的快捷键都是以\<leader>l作为开头的。

| 按键        | 模式 | 描述         |
| ----------- | ---- | ------------ |
| \<leader>ll |      | 准备编译文档 |
| \<leader>lv           |      | 在pdf文档中定位到当前位置 |
| \<leader>ll or lk    |      | 停止编译 |
| \<leader>le          |      | 删除log，errors以及warnings |
| \<leader>lc           |      | 删除多余的文档 |
| %                 |      | 在定界符之间跳转            |
|                   |      |                             |


#### 6.14 Debug

debug可以选择使用[puremourning/*vimspector*](https://github.com/puremourning/vimspector)，暂时没有需求，所以还没有配置。

#### 6.15 Run

代码run使用韦大的插件，但是我现在还没有需求，做一暂时没有配置。

#### 6.16 翻译

翻译之前使用[voldikss/*coc-translator*](https://github.com/voldikss/coc-translator)，接下来又换成了[voldikss/*vim*-*translator*](https://github.com/voldikss/vim-translator)然后感觉都稍微有些许问题，最后选择了[iamcco/*dict*.*vim*](https://github.com/iamcco/dict.vim)，但是该插件不支持悬浮窗口，我需要对其更改下支持悬浮窗口。

| 按键          | 模式                       | 描述 |
| ------------- | -------------------------- | ---- |
| \<leader>w | normal/visual | 翻译当前光标下的内容/选中的内容，在新窗口展示 |
| \<leader>e | normal/visual | 在命令栏输出解释 |
| \<leader>r | normal/visual | 用翻译内容替换当前光标或选中的内容 |

#### 6.16 其他

| 按键   | 模式   | 描述                                                       |
| ------ | ------ | ---------------------------------------------------------- |
| alt q  | normal | 进入宏录制，因为q映射为了关闭窗口，所以使用alt q作为宏录制 |
| ctrl x | normal | 使用系统默认应用打开当前buffer文件                         |
|        |        |                                                            |
|        |        |                                                            |
|        |        |                                                            |
|        |        |                                                            |
|        |        |                                                            |

