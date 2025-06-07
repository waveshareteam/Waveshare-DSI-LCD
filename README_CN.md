# Waveshare DSI LCD 驱动安装说明
* [English Version](./README.md)
## 重要提示
> 📌 本页面说明**仅适用于旧版树莓派系统**（如 Bullseye/Buster），这些系统需要手动安装驱动。
> ✅ **新版树莓派系统 (Bookworm)** 已原生支持 Waveshare DSI 显示屏：
> - 驱动程序已开源并合并至树莓派官方内核
> - 只需在 `config.txt` 末尾添加一行配置即可启用显示和触摸功能
> - **无需手动安装驱动**
> - 官方内核支持更稳定便捷，我们不再维护 GitHub 安装脚本

---

## 最新系统配置指南 (Bookworm)
访问官方 Wiki 获取对应型号的配置说明：
| 显示屏型号                 | Wiki 链接                                                                 |
|----------------------------|---------------------------------------------------------------------------|
| 2.8inch DSI LCD            | [链接](https://www.waveshare.net/wiki/2.8inch_DSI_LCD_)                   |
| 3.4inch DSI LCD (C)        | [链接](https://www.waveshare.net/wiki/3.4inch_DSI_LCD_(C)_)               |
| 4inch DSI LCD              | [链接](https://www.waveshare.net/wiki/4inch_DSI_LCD_)                     |
| 4inch DSI LCD (C)          | [链接](https://www.waveshare.net/wiki/3.4inch_DSI_LCD_(C)_)               |
| 5inch DSI LCD (C)          | [链接](https://www.waveshare.net/wiki/5inch_DSI_LCD_(C)_)                 |
| 5inch DSI LCD (D)          | [链接](https://www.waveshare.net/wiki/5inch_DSI_LCD_(D)_)                 |
| 6.25inch DSI LCD           | [链接](https://www.waveshare.net/wiki/6.25inch_DSI_LCD_)                  |
| 7inch DSI LCD (C)          | [链接](https://www.waveshare.net/wiki/7inch_DSI_LCD_(C)_)                 |
| 7inch DSI LCD (E)          | [链接](https://www.waveshare.net/wiki/7inch_DSI_LCD_(E)_)                 |
| 7inch DSI LCD (H)          | [链接](https://www.waveshare.net/wiki/7inch_DSI_LCD_(H)_)                 |
| 7-DSI-TOUCH-A              | [链接](https://www.waveshare.net/wiki/7-DSI-TOUCH-A_)                     |
| 7.9inch DSI LCD            | [链接](https://www.waveshare.net/wiki/7.9inch_DSI_LCD_)                   |
| 8inch DSI LCD (C)          | [链接](https://www.waveshare.net/wiki/8inch_DSI_LCD_(C)_)                 |
| 8-DSI-TOUCH-A              | [链接](https://www.waveshare.net/wiki/8-DSI-TOUCH-A_)                     |
| 8.8inch DSI LCD            | [链接](https://www.waveshare.net/wiki/8.8inch_DSI_LCD_)                   |
| 10.1inch DSI LCD (C)       | [链接](https://www.waveshare.net/wiki/10.1inch_DSI_LCD_(C)_)              |
| 10.1-DSI-TOUCH-A           | [链接](https://www.waveshare.net/wiki/10.1-DSI-TOUCH-A_)                  |
| 11.9inch DSI LCD           | [链接](https://www.waveshare.net/wiki/11.9inch_DSI_LCD_)                  |
| 13.3inch DSI LCD           | [链接](https://www.waveshare.net/wiki/13.3inch_DSI_LCD_)

---

## 旧版系统手动安装指南 (Bullseye/Buster)

### 前置条件
- 确保树莓派可正常联网
- 终端执行 `uname -a` 确认内核版本

### 安装步骤

1. **下载驱动并进入目录**
    ```bash
    git clone https://github.com/waveshare/Waveshare-DSI-LCD
    cd Waveshare-DSI-LCD
    ```
2. **进入对应内核版本目录（根据 uname -a 结果选择）**
    ```bash
    cd 5.15.61   # 示例版本，请替换为实际版本
    # cd 5.15.76 # 其他版本示例
    ```
3. **根据系统位数选择目录**
    ```bash
    cd 32        # 32位系统
    # cd 64      # 64位系统
    ```
4. **执行对应型号的安装命令（注意 I2C DIP 开关配置）**
    ```bash
    #2.8inch DSI LCD 480×640：
    sudo bash ./WS_xinchDSI_MAIN.sh 28 I2C0
    
    #3.4inch DSI LCD (C) 800×800
    sudo bash ./WS_xinchDSI_MAIN.sh 34C I2C0
    
    #4inch DSI LCD 480×800：
    sudo bash ./WS_xinchDSI_MAIN.sh 40 I2C0
    
    #4inch DSI LCD (C) 720×720
    sudo bash ./WS_xinchDSI_MAIN.sh 40C I2C0
    
    #7inch DSI LCD (C) 1024×600：
    sudo bash ./WS_xinchDSI_MAIN.sh 70C I2C1
    
    #7.9ich DSI LCD 400×1280：
    sudo bash ./WS_xinchDSI_MAIN.sh 79 I2C0
    
    #11.9inch DSI LCD 320×1480：
    sudo bash ./WS_xinchDSI_MAIN.sh 119 I2C0
    
    #8inch DSI LCD (C) 1280×800：
    sudo bash ./WS_xinchDSI_MAIN.sh 80C I2C0
    
    #10.1inch DSI LCD (C) 1280×800：
    sudo bash ./WS_xinchDSI_MAIN.sh 101C I2C0
    ```
> ⚠️ 注意：
> * 执行命令前请仔细核对型号代码（如 34C 代表 3.4英寸 C 型）
> * I2C 接口选择需与实际硬件开关一致

5. **安装完成后重启系统**
    ```bash
    sudo reboot
    ```
