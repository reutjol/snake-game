/*
 * File:   LabC5.c
 * Author: Reut uzan
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>


#include "System/system.h"
#include "System/delay.h"
#include "oledDriver/oledC.h"
#include "oledDriver/oledC_colors.h"
#include "oledDriver/oledC_shapes.h"

#include "i2cDriver/i2c1_driver.h"
#include "Accel_i2c.h"

int colors[] = {0x1f, 0x400, 0xffe0}; // {blue, green, yellow}
static int timer = 60;
int offset = 0;


typedef enum dir
{
    up,
    left,
    down,
    right
} Direction;

typedef struct snake
{
    int x;
    int y;
    Direction nextdir;
    uint16_t color;
} snake;

typedef struct charm
{
    uint8_t x;
    uint8_t y;
    uint16_t type;
} charm;

void User_Initialize(void)
{
    ANSBbits.ANSB12 = 1;
    TRISBbits.TRISB12 = 1;

    AD1CON1 = 0x8000;
    AD1CON2 = 0;
    AD1CON3 = 0x10FF;

    AD1CON1bits.ADON = 1;
    AD1CON3bits.SAMC = 1;
    AD1CON3bits.ADCS = 0xFF;
    AD1CHS = 8;
    PR1 = 16400;
    TMR1 = 0;

    T1CONbits.TSIDL = 1;
    T1CONbits.TGATE = 0;
    T1CONbits.TCS = 0;
    T1CONbits.TON = 1;
    IEC0bits.T1IE = 1;
    IFS0bits.T1IF = 0;
    INTCON2bits.GIE = 1;
    IPC0bits.T1IP = 7;
    T1CONbits.TCKPS = 0b11;
}

void updateTimerDisplay(void) {
   
    
    char strTimer[]="     ";
    sprintf(strTimer, "%d", timer);   //Make it a string
    oledC_DrawRectangle(0, 0, 15, 8, OLEDC_COLOR_BLACK);
    oledC_DrawString(0, 0, 1, 1, strTimer, OLEDC_COLOR_WHITE);
    
}

void __attribute__((interrupt, auto_psv)) _T1Interrupt(void) {
    IFS0bits.T1IF = 0;

    if (timer > 0) {
        timer--;
        updateTimerDisplay();
    } else {
        IEC0bits.T1IE = 0;
        oledC_sendCommand(OLEDC_CMD_SET_DISPLAY_MODE_ON, NULL, 0);
    }
}

void errorStop(char *msg)
{
    oledC_DrawString(0, 20, 2, 2, msg, OLEDC_COLOR_DARKRED);

    for (;;)
        ;
}

void turn(struct snake *rec, Direction new_direction)
{
    int x_change = 0;
    int y_change = 0;

    switch (new_direction)
    {
    case right:
        x_change = -4;
        break;
    case left:
        x_change = 4;
        break;
    case up:
        y_change = -4;
        break;
    case down:
        y_change = 4;
        break;
    }

    // Calculate the new position and wrap around if necessary
    int new_x = (rec->x + x_change + 96) % 96;
    int new_y = (rec->y + y_change + 192) % 192;

    // Update the snake's position and direction
    rec->x = new_x;
    rec->y = new_y;
    rec->nextdir = new_direction;
}

void move(snake *snk, int size, Direction dir) { 
    
    // copy the last segment of the snake
    snake tmpsnake = snk[size]; 
    
    // Shift each segment to the position of the previous segment
    for (int i = size; i > 0; i--)
    {
        snk[i] = snk[i - 1];
    }

    // Turn the head of the snake in the desired direction
    turn(&snk[0], dir);
    snk[0].color = OLEDC_COLOR_RED; // set the color of the head to red

    // Draw the moved segment
    int width = (tmpsnake.nextdir == left || tmpsnake.nextdir == right) ? 4 : 2;
    int height = (tmpsnake.nextdir == up || tmpsnake.nextdir == down) ? 4 : 2;
    oledC_DrawRectangle(tmpsnake.x, tmpsnake.y - offset , tmpsnake.x + width, tmpsnake.y + height - offset , OLEDC_COLOR_BLACK); // erase the last segment

    // Draw the new head of the snake
    width = (snk[0].nextdir == left || snk[0].nextdir == right) ? 4 : 2;
    height = (snk[0].nextdir == up || snk[0].nextdir == down) ? 4 : 2;

    // Draw the new body of the snake
    for(int i=1; i<size+1 ; i++){
        snk[i].color = colors[i % 3];
        if (snk[i].y - offset >= 0) {
            oledC_DrawRectangle(snk[0].x, snk[0].y - offset, snk[0].x + width , snk[0].y + height - offset, snk[0].color); 

            if (snk[i].nextdir== up || snk[i].nextdir == down){
                oledC_DrawRectangle(snk[i].x, snk[i].y - offset, snk[i].x+2, snk[i].y+4 - offset, snk[i].color);
            }
        
            if (snk[i].nextdir == left || snk[i].nextdir == right){
                oledC_DrawRectangle(snk[i].x, snk[i].y - offset, snk[i].x+4, snk[i].y+2 - offset, snk[i].color);
            }
        }  
    }
}


void eatCharms(snake *snk, charm *c, int *size)
{
    if (*size > 0){
        if (snk[0].x >= c->x && snk[0].x <= (c->x + 8) && snk[0].y >= c->y && snk[0].y <= (c->y + 8))
        {
            DELAY_milliseconds(100);
            if (c->type == OLEDC_COLOR_GREEN)
            {
                snake newsnk;
                // Add a new segment to the snake
                newsnk.color = snk[(*size) -3 ].color; // Cycle through blue, green, yellow based on the new size of the snake
                newsnk.x = snk[(*size) - 1].x; // Set the x position of the new segment
                newsnk.y = snk[(*size) - 1].y; // Set the y position of the new segment
                newsnk.nextdir = snk[(*size) - 1].nextdir; // Set the direction of the new segment
                snk[*size-1] = newsnk;
                (*size)++;


                // Update the charm
                if (c->y - offset >= 0) {
                oledC_DrawCharacter(c->x, c->y- offset, 1, 1, '#', OLEDC_COLOR_BLACK);
                }
                c->x = rand() % 95;
                c->y = rand() % 190;
                c->type = OLEDC_COLOR_GREEN;
                oledC_DrawCharacter(c->x, c->y, 1, 1, '#', c->type);
            }

            else if (c->type == OLEDC_COLOR_RED)
            {
                // copy the last segment of the snake
                snake tmpsnake = snk[*size]; 
                // Remove the last segment of the snake
                int width = (tmpsnake.nextdir == left || tmpsnake.nextdir == right) ? 4 : 2;
                int height = (tmpsnake.nextdir == up || tmpsnake.nextdir == down) ? 4 : 2;
                oledC_DrawRectangle(tmpsnake.x, tmpsnake.y - offset, tmpsnake.x + width, tmpsnake.y + height - offset, OLEDC_COLOR_BLACK); // erase the last segment
                (*size)--;
                // Update the charm
                 if (c->y - offset >= 0) {
                oledC_DrawCharacter(c->x, c->y- offset, 1, 1, '#', OLEDC_COLOR_BLACK);
                }
                c->x = rand() % 95;
                c->y = rand() % 190;
                c->type = OLEDC_COLOR_RED;
                oledC_DrawCharacter(c->x, c->y, 1, 1, '#', c->type);
            }
        }
    }
    else {
            // game over when the size = 0
            oledC_clearScreen();
            oledC_DrawString(2, 30,1,1, "GAME OVER" ,OLEDC_COLOR_RED);         
            DELAY_milliseconds(500);         
         }
}

/*
                         Main application
 */
int main(void)
{
    unsigned char id = 0;
    I2Cerror rc;

    SYSTEM_Initialize();
    User_Initialize();

    oledC_setBackground(OLEDC_COLOR_BLACK);
    oledC_clearScreen();
    

    i2c1_driver_driver_close();
    i2c1_open();

    rc = i2cReadSlaveRegister(0x3A, 0, &id);

    if (rc == OK)
        if (id == 0xE5)
            oledC_DrawString(10, 10, 2, 2, "ADXL345", OLEDC_COLOR_BLACK);
        else
            errorStop("Acc!Found");
    else
        errorStop("I2C Error");

    rc = i2cWriteSlave(0x3A, 0x2D, 8);

    snake snakestart[20];

    //initializ the snake head
    snakestart[0].x = 48;
    snakestart[0].y = 96;
    snakestart[0].color = OLEDC_COLOR_RED;
    snakestart[0].nextdir = up;

    //initializ the snake body
    for (int i = 1; i < 5; i++)
    {
        snakestart[i].x = 48;
        snakestart[i].y = 96 + i * 4;
        snakestart[i].color = colors[(i - 1) % 3];
        snakestart[i].nextdir = up;
    }

    charm charms[8];
    
    //initializ the charms
    for (int i = 0; i < 8; i++)
    {
        charms[i].x = rand() % 90;
        charms[i].y = rand() % 180;
        charms[i].type = (i % 2 == 0) ? OLEDC_COLOR_GREEN : OLEDC_COLOR_RED;
    }
    
    int x, y, z;
    unsigned char xyz[6] = {0};
    int size = 4;

    //run game
    while (timer)
    {
        AD1CON1bits.SAMP = 1;
        DELAY_milliseconds(50);
        AD1CON1bits.SAMP = 0;
        
        while (AD1CON1bits.DONE == 1) {
        }
            int pot = (ADC1BUF0 / 1023.0)*96;

            if (pot > offset + 10 || pot < offset - 10) {
            offset = pot;
            oledC_clearScreen();

            // Redraw the charms at their new positions
            for (int i = 0; i < 8; i++) {
                if (charms[i].y - offset >= 0) {
                    oledC_DrawCharacter(charms[i].x, charms[i].y - offset , 1, 1, '#', charms[i].type);
                }
            }

            for (int i = 0; i < 5; i++)
            {
                oledC_DrawRectangle(snakestart[i].x, snakestart[i].y - offset, snakestart[i].x + 2, snakestart[i].y + 4 - offset , snakestart[i].color);
            }
        }
        
        i2cReadSlaveMultRegister(0x3A, 0x32, 6, xyz);
        
        // 2xbytes ==> word
        x = xyz[0] + xyz[1] * 256; 
        y = xyz[2] + xyz[3] * 256;
        z = xyz[4] + xyz[5] * 256;

        int absX = abs(x);
        int absY = abs(y);

        if (absX > 30 && absX > absY)
        {
            move(snakestart, size, x < 0 ? left : right);
            DELAY_milliseconds(100);
        }
        if (absY > 30 && absY > absX)
        {
            move(snakestart, size, y < 0 ? up : down);
            DELAY_milliseconds(100);
        }
        
        for (int i = 0; i < 8; i++)
        {
            eatCharms(snakestart, &charms[i], &size);
        }
        
        DELAY_milliseconds(500);

    }
    
    //oledC_setBackground(uint16_t color)
    oledC_clearScreen();
    oledC_DrawString(2, 30, 1, 1, "Game over", OLEDC_COLOR_RED);

    char str[]="     ";
    
    //Make it a string
    sprintf(str, "%d", size -4);   
    oledC_DrawString(2, 50, 1, 1, "score:", OLEDC_COLOR_WHITE);

    oledC_DrawString(2, 70, 1, 1, str, OLEDC_COLOR_WHITE);
    

    DELAY_milliseconds(2000);    
}

/**
 End of File
*/


