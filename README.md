# snake-game
PIC24 

## 📄 **Operating Instructions – Snake Game**

### 🕹️ Game Controls:
- The snake's direction is controlled by **tilting the development board**, using the built-in **accelerometer sensor**.  
- Movement is **continuous**: when the snake reaches one edge of the screen, it **reappears** from the opposite side (wrap-around behavior).  
- The snake consumes **charms** that appear on the screen. Upon eating a charm:
  - The snake’s **length increases** or **decreases** based on the **color** of the charm.

---

## 🔧 **Key Embedded Concepts Used**

### 1. **Accelerometer Sensor Input**
- The game uses an **accelerometer** to detect board tilt on the X/Y axes.
- Tilt direction determines the snake's heading (left/right/up/down).
- Data is read via **I2C protocol** and translated into directional input.

### 2. **OLED Display Handling**
- The graphical interface is drawn on a **96x96 OLED screen**.
- Snake body, charms, and background are rendered using **custom pixel mapping**.
- The display is controlled via a **graphics library** and updated periodically for animation.

### 3. **Timer Interrupts**
- Snake movement and display updates are synchronized using **Timer-based interrupts**.
- This allows the game to run at a **fixed refresh rate**, independent of user input.

### 4. **Dynamic Memory Representation**
- The snake's body is stored in a **linked list** or circular buffer (depending on implementation).
- On collision with a charm, the list expands or shrinks accordingly.

### 5. **Peripheral Pin Select (PPS) & Digital I/O**
- IO pins are configured using **PPS** to assign communication interfaces like I2C.
- Buttons (if used) or sensors are mapped to specific pins for input.

---

## 🎯 **Goal of the Project**
To demonstrate real-time embedded programming through interaction between input (accelerometer), processing (direction logic, collision detection), and output (OLED graphics, score/length).

---
