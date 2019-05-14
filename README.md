# vime

<!-- vim-markdown-toc GitLab -->

* [开发使用](#开发使用)
    * [c/c++](#cc)
        * [准备](#准备)
        * [`.ccls`简单使用](#ccls简单使用)
        * [展示](#展示)
            * [lsp基本功能](#lsp基本功能)
            * [编译运行](#编译运行)
            * [debug](#debug)
    * [python](#python)
        * [准备](#准备-1)
        * [展示](#展示-1)
            * [lsp基本功能](#lsp基本功能-1)
            * [编译运行](#编译运行-1)
            * [debug](#debug-1)
    * [js/ts](#jsts)
        * [准备](#准备-2)
        * [展示](#展示-2)
            * [lsp基本功能](#lsp基本功能-2)
            * [编译运行](#编译运行-2)
            * [debug](#debug-2)
    * [java](#java)
        * [准备](#准备-3)
        * [展示](#展示-3)
            * [lsp 基本功能](#lsp-基本功能)
            * [编译运行](#编译运行-3)
            * [debug](#debug-3)
    * [html css](#html-css)
        * [准备](#准备-4)
        * [展示](#展示-4)
            * [lsp 基本功能](#lsp-基本功能-1)
            * [编译运行](#编译运行-4)
            * [debug](#debug-4)
    * [bash](#bash)
        * [准备](#准备-5)
        * [展示](#展示-5)
            * [lsp 基本功能](#lsp-基本功能-2)
            * [编译运行](#编译运行-5)
            * [debug](#debug-5)
* [插件快捷键](#插件快捷键)
    * [coc](#coc)
    * [ale](#ale)
    * [多光标](#多光标)
    * [leaderf](#leaderf)
    * [always match tag](#always-match-tag)
    * [easymotion](#easymotion)
    * [](#)
* [vime插件介绍与配置](#vime插件介绍与配置)
* [TODO](#todo)

<!-- vim-markdown-toc -->

作为一个初级vimer，我也是一点点在尝试各种插件，很多内容都是我自己的理解，可能会出错。

该文首先介绍vime如可开发各种不同的语言项目，接下来介绍vime的快捷键，最后介绍一些插件的使用与配置。

> 我建议先配置一个能投入生产的配置，然后在平时的学习中，一点一点的将vim配置成适合自己的样子。不要想着配置的很帅气，功能很强大，越简单越好，有些花里胡哨用不到的东西不建议配置浪费时间。

该文档我会一直更新，遇到好的插件我使用后会更新在这里。

## 开发使用

这部分主要介绍几种语言开发的最佳（删去）体验，一般我们所需要的主要功能无非就是补全，跳转，查看定义，错误提示，编译运行，debug等。我们的主要目标是先实现主要的功能，然后投入开发，其余的功能可以慢慢添加。

补全框架使用的是赵大神的[coc.nvim](https://github.com/neoclide/coc.nvim)，该框架实现了[lsp](https://langserver.org/)，后端可以对接多种语言服务，来帮助我们实现补全，跳转，格式化等功能。当然实现lsp的框架还有很多，[languageclient-neovim](https://github.com/autozimu/LanguageClient-neovim)，[vim-lsp](<https://github.com/prabirshrestha/vim-lsp>)，[vim-lsc](https://github.com/natebosch/vim-lsc)等。使用coc的主要原因是coc支持悬浮窗口，这是neovim的新特性。

![1557674152246](assets/1557674152246.png)

[该网站](<https://langserver.org/>)是一些lsp的集合，lsp一般都实现了如下的功能：

1. code completion
2. hover
3. jump to definition
4. symbols
5. find reference
6. diagnostics
7. format (可以代替格式化插件了)
8. rename
9. quickfix
10. 错误检查 (可以替换ale了，不过有的lsp后端的错误检查不是太强，仍可以使用ale作为互补)

coc实现了这些接口。

### c/c++

#### 准备

使用coc补全框架，lsp后端可以选用clangd，也可以选用ccls，这里推荐ccls(主要原因是clangd不太会用，晕)。

对于`clangd`，貌似只支持`compile_commands.json`文件，对于这个文件，可以手动写，也可以通过`cmake`来自动生成，对于手动写我没有研究过，而使用`cmake`自动生成则需要会写`CMakeList.txt`，这里有一篇`CMakeList.txt`的[简单的教程](#)。也可以使用`makefile`文件来生成`compile_commands.json`，这个需要用到[bear](https://github.com/rizsotto/Bear)这个软件。当然，生成`compile_commands.json`文件还有其他很多方式，可以参考[这里](https://github.com/MaskRay/ccls/wiki/Project-Setup)。

> compile_commands.json
>
> Compilation database as project format. With non-CMake and non-Gradle projects, you can still benefit from the advanced IDE features that CLion provides. ... A compilation database is a **JSON**-formatted file named **compile_commands**.**json** that contains structured data about every compilation unit in your project.

以我的理解`compile_commands.json`貌似只对现有的工程有效，也就是对学习已有代码很有帮助，而对于新建的工程则需要每次添加一个文件的时候更新一次`compile_commands.json`文件，我不清楚我理解的对不对。

下面推荐ccls作为lsp的原因也是基于上述考虑，如果使用ccls，需要在`coc-settings.json`中加入ccls的lsp，具体操作如下：

1. 打开vim，然后输入`:CocConfig`

2. 在打开的文件中加入如下内容：

   ```json
   "languageserver": {
       "ccls": {
           "command": "ccls",
               "filetypes": [
                   "c",
                   "cpp",
                   "cuda",
                   "objc",
                   "objcpp"
               ],
           "rootPatterns": [
                   ".clang",
                   ".ccls",
                   "compile_commands.json",
                   ".vim/",
                   ".git/",
                   ".hg/"
               ],
           "initializationOptions": {
                   "cache": {
                       "directory": ".ccls-cache"
                   }
               }
           },
   }
   ```

   完成之后就可以使用ccls作为lsp后端服务了。

ccls既可以使用`compile_commands.json`文件也可以使用自定义的`.ccls`文件。`.ccls`文件易于编写，在项目根目录加入这个文件之后就拥有补全，跳转之类的功能了。下面介绍如何使用`.ccls`文件。

#### `.ccls`简单使用

`.ccls`是一个行文本，位于项目根目录，用来指定编译参数。每一行都会作为编译参数增加到编译命令中，参数中不能有空格，比如`-Ifoo`，`-I\nfoo`是可以的，而`-I foo`是不可以。简单说了就是在编译项目的时候用到了哪些参数，那么这些参数一个一行添加到`.ccls`文件中就可以使用了。

```
clang
-Ifoo
-I./include
-I
../include

-I foo         这是错误的，上面的都是对的，除了第一行，其余的每一行都会增加到编译命令中
```

当然每一行开头也可以使用%开头的指令，表示该行的指令作用于哪些文件，有如下指令：

1. `%compile_commands.json`

   默认`.ccls`文件中的编译选项只会应用到没有在`compile_commands.json`中出现的文件。

   如果`%compile_commands.json`出现在`.ccls`文件开头，然后`%compile_commands.json`也被解析过了，那么`.ccls`中的编译指令将会追加到在`%compile_commands.json`中列出的文件后面。

2. `%c` / `%cpp` / `%objective-c` / `%objective-cpp`

   这些参数只能被用来解析c（%c），c++（%cpp），object-c（%objective-c），object-c++（%objective-c++）文件。例如：

   ```shell
   %c -std=c11
   %cpp -std=c++2a
   ```

   这就表示\*.c文件使用c11标准，\*.cpp文件使用c++2a标准。

4. `%h` / `%hpp`

   该指令对\*.h(%h)文件和\*.hh、\*.hpp(%hpp)文件有效。

   ```shell
   %h -x
   %h c++-header
   ```

   这表示对所有的\*.h文件按照c++头文件来解析。

4. 其他

   第一行如果不是`%compile_commands.json`，那么通常就是clang，不推荐clang++，因为如果有c文件，那么容易出错。

#### 展示

##### lsp基本功能

这是c的一个简单例子，可以看到可以实现补全，定义的跳转(快捷键gd,gr,gi,gy)，引用的跳转(快捷键gr)，函数提示（快捷键K, space k)等的功能。

[![asciicast](assets/245594.svg)](https://asciinema.org/a/245594)

这是c++的一个简单例子

[![asciicast](assets/245711.svg)](https://asciinema.org/a/245711)



##### 编译运行

留坑，等有比较好的编译运行方式的时候再来填坑。

##### debug

留坑

### python

#### 准备

使用coc补全框架，有多种lsp后端可选，可以从[这里](https://langserver.org/)查找可用的python lsp后端，~~推荐pyls~~，后面介绍如何安装。

对于python项目，推荐使用`pipenv`来建立一个虚拟环境，然后在虚拟环境下进行开发，方便移植，按照如下步骤进行：

1. 新建立一个文件夹，在该文件夹下面建立一个.venv文件夹，以后安装的所有包都在这里，如果不建立这个文件夹，那么以后安装的所有包会在`~/.local/share/virtualenv/XXX`下面。

2. 使用命令`pipenv install`来初始化虚拟环境，该命令生成了Pipfile文件和Pipfile.lock文件，其中Pipfile文件用于描述该工程安装了哪些包，Pipfile.lock文件用于描述该工程的依赖。如果是已有的工程，那么该命令会根据Pipfile和Pipfile.lock或requirements.txt中的内容进行相关依赖的安装。

3. 使用`pipenv install`进行包安装的时候，因为源的问题，安装包比较慢，因此我们在初始化之后可以更改Pipfie文件中的源，有以下源可供选择：

   ```shell
   阿里云：http://mirrors.aliyun.com/pypi/simple/ 
   豆瓣：http://pypi.douban.com/simple/ 
   清华大学：https://pypi.tuna.tsinghua.edu.cn/simple/ 
   中国科学技术大学：https://pypi.mirrors.ustc.edu.cn/simple/
   直接更改[[source]]下面的url即可
   ```

   如果更换源出现问题，那就不要换啦。

4. 两种开发方式：

   1. 进入虚拟环境（建议）

      在项目目录下通过命令`pipenv shell`进入虚拟环境。

      该开发方式不需要配置什么东西，可以直接在虚拟环境中开发，不过需要安装几个包，neovim和pylint，在虚拟环境中执行下面的命令:

      ```shell
      pip install neovim	# 必装，否则在虚拟环境中，neovim找不到python。
      ```
      
   2. 不进入虚拟环境

      如果不进入虚拟环境，那直接打开文件开发就就好了。

5. lsp后端

   单纯的补全后端可以选用jedi也可以选用微软的补全后端。

   1. 如果使用jedi作为补全后端，需要自己安装jedi，后面就不需要看了。

   2. 如果想使用微软的python后端，那么需要在`coc-settings.json`中进行设置，按照下面的步骤进行：

      1. 打开neovim，输入`:CocConfig`，打开coc-settngs.json文件

      2. 在该文件中加入如下内容：

         ```json
         "python.jediEnabled": false
         ```

   3. 这里~~推荐~~使用pyls即[python-language-server](https://github.com/palantir/python-language-server)作为补全后端(有点卡，而且有点bug，rename不能用，所以改成推荐微软的lsp后端，但是pyls对于错误提示非常厉害，不过这个可以使用ale代替)，直接在虚拟环境中使用如下命令进行安装：

      ```shell
      pip install jedi
      pip install 'python-language-server[all]' # 注意有单引号
      ```

      接下来需要在`coc-settings.json`文件中进行配置了，按照如下步骤进行：

      1. 打开vim，输入`:CocConfig`

      2. 在打开的文件中加入如下内容：

         ```json
         "languageserver": {
                 "pyls": {
                     "command": "pyls",
                     "filetypes": [
                         "py",
                         "python"
                     ],
                     "rootPatterns": [
                         ".vim/",
                         ".git/",
                         ".venv/"
                     ]
                 }
         }
         ```

      或者嫌麻烦直接安装coc-pyls即可，这样就不需要安装python-language-server了。
#### 展示

##### lsp基本功能

[![asciicast](assets/245798.svg)](https://asciinema.org/a/245798)

自动补全(快捷键ctrl space强制补全)

![pytishi](assets/pytishi.gif)

跳转到定义(快捷键gd)，跳转到引用(快捷键gr)

![Peek 2019-05-13 21-21](assets/Peek2019-05-1321-21.gif)

格式化(:Format)

![Peek 2019-05-13 21-22](assets/Peek2019-05-1321-22.gif)

hover(快捷键 shift k, space k)

![Peek 2019-05-13 21-24](assets/Peek2019-05-1321-24.gif)

diagnostics(快捷键 space d)

![Peek 2019-05-13 23-30](assets/Peek2019-05-1323-30.gif)

rename(快捷键 space r n)

![Peek 2019-05-13 23-31](assets/Peek2019-05-1323-31.gif)

##### 编译运行

##### debug   

### js/ts

#### 准备

对于js和ts，直接使用tsserver作为服务后端，这个直接安装coc-tsserver即可。

对于js和ts工程，一般需要做以下准备：

1. 配置`jsconfig.json`(for js)或`tsconfig.json`(for ts)

   1. 在工程目录下建立一个jsconfig.json的文件，或者tsconfig.json的文件，一个是对应js项目，一个对应ts项目。

   2. 在该文件中加入以下内容，关于该文件的详细配置可以参考[jsconfig.json](https://code.visualstudio.com/docs/languages/jsconfig)：

      ```json
      {
          "compilerOptions": {
              "checkJs": true		// 可以诊断js
          }
          "compilerOptions": {
              "target": "es6"
          },
      	// exclude, 排除
      	// 如果觉得速度慢了，建议写排除，尤其node_modules
          "exclude": [
              "node_modules"
          ],
      	// include, 包含
      	// 默认包含当前目录下的所有文件包括子文件夹的文件
      	// 写上include之后只包含include中的文件
      	"include": [
              "src/**/*"
          ]
      }
      // include 和 exclude的路径配置都是相对于jsconfig.json文件的
      ```

      一些编译选项：

      | 选项                         | 描述                                                         |
      | ---------------------------- | ------------------------------------------------------------ |
      | noLib                        | 不包含默认库文件                                             |
      | target                       | 明确使用哪一个库文件，可选："es3", "es5", "es6", "es2015", "es2016", "es2017", "es2018", "esnext". |
      | checkjs                      | 开启js的类型检查                                             |
      | experimentalDecorators       | Enables experimental support for proposed ES decorators.     |
      | allowSyntheticDefaultImports | Allow default imports from modules with no default export. This does not affect code emit, just type checking. |
      | baseUrl                      | Base directory to resolve non-relative module names.         |
      | paths                        | Specify path mapping to be computed relative to baseUrl option. |

         可以使用webpack别名：

      ```json
         {
           "compilerOptions": {
             "baseUrl": ".",
             "paths": {
                 // 别名：路径，使用的时候可以直接import 一些东西 from 别名/xxx
               "ClientApp/*": ["./ClientApp/*"]
             }
           }
         }
         
         // 然后在文件中
         import Something from 'ClientApp/foo'
      ```

2. 使用命令`npm init`初始化工程，该命令会生成package.json文件用于描述该工程所安装的插件。可以通过命令` npm install pkg--save`来安装所需要的包，该命令会自动将包以及依赖写入package.json文件。

3. 完成上述两步就可以编程了。

[![asciicast](assets/245945.svg)](https://asciinema.org/a/245945)

#### 展示

##### lsp基本功能

autocompletion

![Peek 2019-05-14 00-22](assets/Peek2019-05-1400-22.gif)

hover

![Peek 2019-05-14 00-27](assets/Peek2019-05-1400-27.gif)

jump to def

![Peek 2019-05-14 00-28](assets/Peek2019-05-1400-28.gif)

go to ref

![Peek 2019-05-14 00-30](assets/Peek2019-05-1400-30.gif)

Diagnostics

![Peek 2019-05-14 00-31](assets/Peek2019-05-1400-31.gif)

##### 编译运行

##### debug

### java

#### 准备

#### 展示

##### lsp 基本功能

##### 编译运行

##### debug

### html css

#### 准备

对于html和css，只需要安装coc-html和coc-css就可以了，自带了lsp，什么也不用管了。其实对于怎么跳转到引入的文件我不知道怎么做，需要在工程下面添加什么文件么？

#### 展示

##### lsp 基本功能

format

![Peek 2019-05-14 09-44](assets/Peek2019-05-1409-44.gif)

outline

![Peek 2019-05-14 09-50](assets/Peek2019-05-1409-50.gif)

##### 编译运行

##### debug

### bash

#### 准备

bash的lsp是bash-language-server，需要单独安装，然后需要进行如下配置：

1. 打开vim，输入`:CocConfig`，打开`coc-settings.json`文件

2. 在`coc-settings.json`文件中加入如下内容：

   ```json
   "languageserver": {
       "bash": {
               "command": "bash-language-server",
               "args": [
                   "start"
               ],
               "filetypes": [
                   "sh"
               ],
               "ignoredRootPaths": [
                   "~"
               ]
           },
   }
   ```

#### 展示

##### lsp 基本功能

autocomplete

![Peek 2019-05-14 10-41](assets/Peek2019-05-1410-41.gif)

goto def goto ref hover

![Peek 2019-05-14 10-45](assets/Peek2019-05-1410-45.gif)

##### 编译运行

##### debug

## 插件快捷键

### coc

| 快捷键     | 模式 | 描述                                           |
| ---------- | ---- | ---------------------------------------------- |
| ctrl space |      | 强制触发补全                                   |
| space l    |      | CocList                                        |
| space d    |      | cocList diagnostics                            |
| space e    |      | CocList extensions                             |
| space c    |      | CocList commands                               |
| space t    |      | CocList outline                                |
| space s    |      | CocList -I symbols                             |
| space [    |      | 上一个diagnostics条目                          |
| space ]    |      | 下一个diagnostics条目                          |
| space f    |      | 对选中的区域进行格式化                         |
| :Format    |      | 使用lsp格式化代码                              |
| space rn   |      | 重命名变量，可以将本buffer的所有变量进行重命名 |
| gd         |      | 跳转到定义                                     |
| gy         |      | 跳转到类型定义                                 |
| gi         |      | 跳转到实现                                     |
| gr         |      | 跳转到引用                                     |
| shift k    |      | 悬浮窗口查看定义 hover                         |
| space k    |      | 悬浮窗口查看函数参数 hover                     |
| space qf   |      | quick fix 快速修复                             |

### ale

其实lsp已经包含代码检查了，但是有点lsp代码检查不是很强大，比如c类lsp使用ccls，那么我们还需要使用cppcheck进行静态代码检查，pyhton使用微软的lsp，那么还需要pylint或者flake8进行代码检查。当然如果对代码没有那么严格要求可以直接把ale这个插件注释掉

| 快捷键 | 模式 | 描述                 |
| ------ | ---- | -------------------- |
| ctrl ] |      | 下一个错误或者警告处 |
| ctrl [ |      | 上一个错误或者警告处 |
|        |      |                      |

### 多光标

可以使用鼠标，ctrl+鼠标左键，前提`set mouse=a`

| 快捷键              | 模式    | 描述                                                         |
| ------------------- | ------- | ------------------------------------------------------------ |
| tab                 | virsual | 模式转变，插入模式或者选择扩展模式                           |
| ctrl n(ext)         | normal  | 选中一个单词并进入多光标模式，或者一直选中下一个单词等同于 ] |
| ctrl c(ursor)       | normal  | 在当前位置插入光标，再按取消                                 |
| crtl s(kip)         | visual  | 跳过当前单词或者符号（ctrl up or down）                      |
| ctrl a(ll)          | normal  | 选中所有单词                                                 |
| ctrl down(方向下键) | normal  | 快速垂直插入                                                 |
| ctrl up(方向上键)   | normal  | 快速垂直插入                                                 |
| n                   | virsual | 向下移动光标，不选中单词，单纯移动光标                       |
| N                   | virsual | 向上移动光标                                                 |
| ]                   | visual  | ctrl n之后执行，选中下一个单词，等同于ctrl n                 |
| [                   | visual  | ctrl n之后执行，选中上一个单词                               |
| {                   | visual  | 选中的光标之间进行跳转，跳到上一个光标处                     |
| }                   | visual  | 选中的光标之间进行跳转，跳到下一个光标处                     |
| q                   | visual  | 取消当前光标                                                 |
| Q                   | visual  | 取消当前区域                                                 |
| o                   | virsual | 光标反方向                                                   |
| m                   | virsual | 选择模式，8mj，向下8行，选中mip当前段落里的该单词，mas当前行该单词 |

### leaderf

似乎可以代替tagbar了，进入之后按下tab，按下F1可以查看帮助

| 快捷键       | 模式   | 描述                         |
| ------------ | ------ | ---------------------------- |
| alt f(ile)   | normal | 搜索当前工作目录下的所有文件 |
| alt t(ag)    | normal | 搜索当前文件的tag            |
| alt T(ag)    | normal | 搜索所有buffer的tag          |
| alt o(pen)   | normal | 搜索所有打开的buffer         |
| alt s(earch) | normal | 搜索当前buffer的line         |
| alt S(earch) | normal | 搜索所有buffer的line         |
| alr r(ecent) | normal | 搜索最近文件                 |

### always match tag

| 快捷键  | 模式   | 描述                |
| ------- | ------ | ------------------- |
| space 5 | normal | 在<tag>之间进行跳转 |

### easymotion

| 快捷键     | 模式   | 描述                 |
| ---------- | ------ | -------------------- |
| alt j(ump) |        | 多窗口行跳转         |
| alt k(ey)  |        | 多窗口符号跳转       |
| f (char)   | normal | 快速跳转到某个字符处 |

### 

## vime插件介绍与配置

所有插件均可以在[这里](config/plugins.vim)查看

## TODO

- [ ] defx悬浮窗口显示
- [ ] defx增加buffer支持
- [ ] 一键安装
- [ ] 分离式设计，只要在插件配置文件中关闭，那么关于该插件的所有配置均不载入
