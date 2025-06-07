# Waveshare DSI LCD Driver Installation Guide
* [中文版](./README_CN.md)
## Important Notes
> 📌 These instructions **only apply to older Raspberry Pi OS versions** (like Bullseye/Buster) that require manual driver installation.  
> ✅ **New Raspberry Pi OS (Bookworm)** now natively supports Waveshare DSI displays:
> - Driver has been open-sourced and merged into the official Raspberry Pi kernel
> - Simply add one configuration line to `config.txt` to enable display and touch
> - **No manual driver installation required**
> - Official kernel support is more stable and convenient. We no longer maintain GitHub installation scripts.

---

## Configuration Guide for New Systems (Bookworm)
Refer to our official Wiki for model-specific setup instructions:  

| Display Model              | Wiki Link                                                                 |
|----------------------------|---------------------------------------------------------------------------|
| 2.8inch DSI LCD            | [Link](https://www.waveshare.com/wiki/2.8inch_DSI_LCD_)                   |
| 3.4inch DSI LCD (C)        | [Link](https://www.waveshare.com/wiki/3.4inch_DSI_LCD_(C)_)               |
| 4inch DSI LCD              | [Link](https://www.waveshare.com/wiki/4inch_DSI_LCD_)                     |
| 4inch DSI LCD (C)          | [Link](https://www.waveshare.com/wiki/4inch_DSI_LCD_(C))                  |
| 5inch DSI LCD (C)          | [Link](https://www.waveshare.com/wiki/5inch_DSI_LCD_(C)_)                 |
| 5inch DSI LCD (D)          | [Link](https://www.waveshare.com/wiki/5inch_DSI_LCD_(D)_)                 |
| 6.25inch DSI LCD           | [Link](https://www.waveshare.com/wiki/6.25inch_DSI_LCD_)                  |
| 7inch DSI LCD (C)          | [Link](https://www.waveshare.com/wiki/7inch_DSI_LCD_(C)_)                 |
| 7inch DSI LCD (E)          | [Link](https://www.waveshare.com/wiki/7inch_DSI_LCD_(E)_)                 |
| 7inch DSI LCD (H)          | [Link](https://www.waveshare.com/wiki/7inch_DSI_LCD_(H)_)                 |
| 7-DSI-TOUCH-A              | [Link](https://www.waveshare.com/wiki/7-DSI-TOUCH-A_)                     |
| 7.9inch DSI LCD            | [Link](https://www.waveshare.com/wiki/7.9inch_DSI_LCD_)                   |
| 8inch DSI LCD (C)          | [Link](https://www.waveshare.com/wiki/8inch_DSI_LCD_(C)_)                 |
| 8-DSI-TOUCH-A              | [Link](https://www.waveshare.com/wiki/8-DSI-TOUCH-A_)                     |
| 8.8inch DSI LCD            | [Link](https://www.waveshare.com/wiki/8.8inch_DSI_LCD_)                   |
| 10.1inch DSI LCD (C)       | [Link](https://www.waveshare.com/wiki/10.1inch_DSI_LCD_(C)_)              |
| 10.1-DSI-TOUCH-A           | [Link](https://www.waveshare.com/wiki/10.1-DSI-TOUCH-A_)                  |
| 11.9inch DSI LCD           | [Link](https://www.waveshare.com/wiki/11.9inch_DSI_LCD_)                  |
| 13.3inch DSI LCD           | [Link](https://www.waveshare.com/wiki/13.3inch_DSI_LCD_)   

---

## Manual Driver Installation for Older OS (Bullseye/Buster)

### Prerequisites
- Ensure Raspberry Pi has internet connection
- Confirm kernel version using `uname -a` in terminal

### Installation Steps

1. **Download driver and enter directory**
    ```bash
    git clone https://github.com/waveshare/Waveshare-DSI-LCD
    cd Waveshare-DSI-LCD
    ```

2. **Navigate to matching kernel version directory**
    ```bash
    cd 5.15.61   # Example version - replace with your actual version
    # cd 5.15.76 # Alternative version example
    ```

3. **Select architecture directory**
    ```bash
    cd 32        # For 32-bit systems
    # cd 64      # For 64-bit systems
    ```

4. **Execute model-specific installation command**  
   *Verify I2C DIP switch configuration before running*
    ```bash
    # 2.8inch DSI LCD 480×640:
    sudo bash ./WS_xinchDSI_MAIN.sh 28 I2C0
    
    # 3.4inch DSI LCD (C) 800×800:
    sudo bash ./WS_xinchDSI_MAIN.sh 34C I2C0
    
    # 4inch DSI LCD 480×800:
    sudo bash ./WS_xinchDSI_MAIN.sh 40 I2C0
    
    # 4inch DSI LCD (C) 720×720:
    sudo bash ./WS_xinchDSI_MAIN.sh 40C I2C0
    
    # 7inch DSI LCD (C) 1024×600:
    sudo bash ./WS_xinchDSI_MAIN.sh 70C I2C1
    
    # 7.9inch DSI LCD 400×1280:
    sudo bash ./WS_xinchDSI_MAIN.sh 79 I2C0
    
    # 11.9inch DSI LCD 320×1480:
    sudo bash ./WS_xinchDSI_MAIN.sh 119 I2C0
    
    # 8inch DSI LCD (C) 1280×800:
    sudo bash ./WS_xinchDSI_MAIN.sh 80C I2C0
    
    # 10.1inch DSI LCD (C) 1280×800:
    sudo bash ./WS_xinchDSI_MAIN.sh 101C I2C0
    ```

> ⚠️ **Important Notes:**
> - Verify model codes before execution (e.g., `34C` = 3.4-inch Type C)
> - I2C interface selection must match physical hardware switches
> - Requires stable internet connection

5. **Reboot after installation**
    ```bash
    sudo reboot

