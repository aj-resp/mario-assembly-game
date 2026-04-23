INCLUDE Irvine32.inc
INCLUDELIB winmm.lib
.data
; ========== SCREEN TITLES ==========
titleLine1 BYTE "   _____ _    _ _____  ______ _____    __  __          _____  _____ ____  ",0
titleLine2 BYTE "  / ____| |  | |  __ \|  ____|  __ \  |  \/  |   /\   |  __ \|_   _/ __ \ ",0
titleLine3 BYTE " | (___ | |  | | |__) | |__  | |__) | | \  / |  /  \  | |__) | | || |  | |",0
titleLine4 BYTE "  \___ \| |  | |  ___/|  __| |  _  /  | |\/| | / /\ \ |  _  /  | || |  | |",0
titleLine5 BYTE "  ____) | |__| | |    | |____| | \ \  | |  | |/ ____ \| | \ \ _| || |__| |",0
titleLine6 BYTE " |_____/ \____/|_|    |______|_|  \_\ |_|  |_/_/    \_\_|  \_\_____\____/ ",0
titleLine7 SBYTE "                                AJ Daddy                                  ",0

filename_scores BYTE "mario_scores.txt", 0
filename_names BYTE "mario_names.txt", 0
temp_score BYTE ?

hiddenRoomCoins BYTE 25
hiddenRoomCoinX BYTE 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 10, 20, 30, 40, 50, 60, 70, 15, 35, 45, 55, 65
hiddenRoomCoinY BYTE 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 15, 15, 15, 15, 15, 15, 15, 12, 12, 12, 12, 12
hiddenRoomCoinCollected BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

bossIndex BYTE ?
inHiddenRoom BYTE 0



; Hidden room messages
hiddenRoomMsg BYTE "*** SECRET COIN ROOM! ***", 0
hiddenRoomExit BYTE "Press DOWN on pipe to exit", 0
; ========== MAGNET SYSTEM ==========
hudMagnet BYTE "MAGNETS: ",0
magnetCharges BYTE 5
magnetRadius BYTE 3
coinsCollectedThisTime BYTE 0  ; Add this counter

; Magnet messages
magnetSuccess BYTE "Magnet collected ",0
magnetNoCharges BYTE "No magnet charges left!",0

; Update instructions
instr16 BYTE "  M - Coin Magnet (collects coins in large radius)",0
; ========================================
; DEBUG MESSAGE SYSTEM
; ========================================
debugMsg BYTE "DEBUG: Sound called",0

coinSound    BYTE "sounds\coin.wav", 0
jumpSound    BYTE "sounds\jump.wav", 0
stompSound   BYTE "sounds\stomp.wav", 0
deathSound   BYTE "sounds\death.wav", 0
powerupSound BYTE "sounds\powerup.wav", 0


; Windows API function prototypes
PlaySoundA PROTO,
    pszSound:PTR BYTE,
    hmod:DWORD,
    fdwSound:DWORD

; PlaySound flags
SND_ASYNC       EQU 0001h    ; Play asynchronously (non-blocking)
SND_FILENAME    EQU 20000h   ; pszSound is a filename
SND_LOOP        EQU 0008h    ; Loop the sound
SND_NODEFAULT   EQU 0002h    ; Don't play default sound
SND_NOSTOP      EQU 0010h    ; Don't stop current sound
SND_ALIAS       EQU 10000h   ; Name is registry alias
SND_MEMORY      EQU 0004h    ; Sound is in memory

; Sound alias names (built-in Windows sounds)
sndCoin         BYTE "SystemAsterisk", 0
sndJump         BYTE "SystemExclamation", 0
sndPowerUp      BYTE "SystemNotification", 0
sndDeath        BYTE "SystemHand", 0
sndStomp        BYTE "SystemQuestion", 0
sndComplete     BYTE "SystemAsterisk", 0
sndGameOver     BYTE "SystemExit", 0

; External Windows API
Beep PROTO,
    dwFreq:DWORD,
    dwDuration:DWORD


hudHighScore BYTE "HI-SCORE: ",0  ; Add this line

allScoresHeader BYTE "=== ALL SCORES ===",0
noScoresMsg BYTE "No high scores yet!",0

; ========== HIGH SCORE SYSTEM ==========
highScore DWORD 0
highScoreName BYTE 30 DUP(0)
highScoreMsg BYTE "*** NEW HIGH SCORE! ***",0
highScoreCongrats BYTE "Congratulations, ",0
highScoreAchieved BYTE "You achieved the highest score: ",0



instr15 BYTE "  F - Fireball (Fire Mario only)",0
instr17 BYTE "Objective:",0

loadSuccess BYTE "Game loaded successfully!",0
loadFailed BYTE "No saved game found!",0

; File reading buffer
readBuffer BYTE 256 DUP(0)
bytesRead DWORD ?

; Update these values to match your existing bridge in Level 3
movPlatL3X BYTE 30    ; Starting X position (matches your bridge at x=30-40)
movPlatL3Y BYTE 24    ; Y position (matches your bridge at y=24)
movPlatL3Dir BYTE 1   ; 1=right, 0=left
movPlatL3Len BYTE 11  ; Length (matches your 11-character bridge)


entertocontinue BYTE "Press ANY KEY to continue...",0

; ========== VICTORY (ALL LEVELS COMPLETE) ==========
victoryTitle BYTE "*** YOU WIN! ALL LEVELS COMPLETE! ***",0
victoryMsg1 BYTE "You defeated Bowser and saved the kingdom!",0


bgAttr      DWORD ?    ; holds (background * 16) for game world

; ========== MENU ==========
menuTitle BYTE "=== MAIN MENU ===",0
menuOpt1 BYTE "1. Start Game",0
menuOpt2 BYTE "2. Instructions",0
menuOpt3 BYTE "3. View High Scores",0
menuOpt4 BYTE "4. Load Game",0
menuOpt5 BYTE "5. Exit",0  ; Add this definition
menuPrompt BYTE "Select option: ",0

brickColor DWORD ?
bgEmptyColor DWORD ?


; ========== INSTRUCTIONS ==========
instrTitle BYTE "=== INSTRUCTIONS ===",0
instr1 BYTE "Controls:",0
instr2 BYTE "  A - Move Left",0
instr3 BYTE "  D - Move Right",0
instr4 BYTE "  W - Jump",0
instr5 BYTE "  P - Pause Game",0
instr6 BYTE "  X - Exit Game",0
instr7 BYTE "  F - Fireball (Fire Mario only)",0
instr8 BYTE "Objective:",0
instr9 BYTE "  Collect all coins and defeat enemies!",0
instr10 BYTE "  Reach the flagpole to complete the level!",0
instr11 BYTE "  Jump on enemies to defeat them!",0
instrBack BYTE "Press ANY KEY to return to menu...",0


; ===== LEVEL 2 KOOPA DATA =====
; 0 = walking, 1 = shell, 2 = sliding

lvl2KoopaCount      dword 2

lvl2KoopaX          BYTE 22, 60
lvl2KoopaY          BYTE 26, 26
lvl2KoopaActive     BYTE 1,  1
lvl2KoopaDir        BYTE 1,  0       ; 1 = right, 0 = left
lvl2KoopaState      BYTE 0,  0       ; start walking

; ========== PAUSE SCREEN ==========
pauseTitle BYTE "=== GAME PAUSED ===",0
pauseOpt1 BYTE "R - Resume Game",0
pauseOpt2 BYTE "X - Exit to Menu",0

; ========== LEVEL COMPLETION ==========
completeTitle BYTE "*** LEVEL COMPLETE! ***",0
completeMsg1 BYTE "Coins Collected: ",0
completeMsg2 BYTE "Enemies Defeated: ",0
completeMsg3 BYTE "Time Remaining: ",0
completeMsg4 BYTE "Time Bonus (x50): ",0
completeFinal BYTE "FINAL SCORE: ",0
completeFireworks BYTE "     *   .   *   .   *   .   *     ",0
completeContinue BYTE "Press ANY KEY to return to menu...",0

; ========== GAME OVER ==========
gameOverTitle BYTE "=== GAME OVER ===",0
gameOverScore BYTE "Final Score: ",0
gameOverMsg BYTE "Better luck next time!",0

; ========== GAME ELEMENTS ==========
ground BYTE "================================================================================",0
block BYTE "[?]",0
cloudSmall BYTE "  .--.  ",0
cloudSmall2 BYTE " (    ) ",0
cloudSmall3 BYTE "  `--'  ",0
cloudBig BYTE "   .---.   ",0
cloudBig2 BYTE " .(     ). ",0
cloudBig3 BYTE "(         )",0
cloudBig4 BYTE " `-------' ",0
bushSmall BYTE "  vVv  ",0
bushBig BYTE " vVvVvVv ",0

; ========== HUD ==========
hudWorld BYTE "WORLD: 1-",0
hudScore BYTE "SCORE: ",0
hudCoins BYTE "COINS: ",0
hudTimer BYTE "TIME: ",0
hudLives BYTE "LIVES: ",0

; ========== FILE HANDLING ==========
playerName BYTE 50 DUP(0)
namePrompt BYTE "Enter your name (max 30 chars): ",0
scoresFile BYTE "mario_scores.txt",0
progressFile BYTE "mario_progress.txt",0
fileHandle DWORD ?
buffer BYTE 256 DUP(0)
newline BYTE 13,10,0
separator BYTE " | Score: ",0
progressSep BYTE " | Level: ",0
coinSep BYTE " | Coins: ",0
liveSep BYTE " | Lives: ",0

; ========== GAME VARIABLES ==========
score DWORD 0
coins BYTE 0
totalCoins BYTE 15          ; Total coins across all 3 sections
lives BYTE 3
gameTime DWORD 400
lastTime DWORD 0
enemiesDefeated BYTE 0
levelComplete BYTE 0

; ========== SECTION SYSTEM ==========
currentSection BYTE 1       ; 1, 2, or 3

; ========== PLAYER VARIABLES ==========
xPos BYTE 5
yPos BYTE 26
playerDir BYTE 0            ; 0 = right, 1 = left
isJumping BYTE 0
jumpCounter BYTE 0
playerSpeed BYTE 0
maxSpeed BYTE 4
jumpKeyHeld BYTE 0
marioForm BYTE 0            ; 0 = Small, 1 = Super, 2 = Fire

; ========== POWER-UP ==========
powerupActive BYTE 0
powerupX BYTE 0
powerupY BYTE 0
powerupType BYTE 0          ; 1 = Mushroom, 2 = Fire Flower

; ========== FLAGPOLE (only in section 3) ==========
flagX BYTE 75
flagY BYTE 15

; ========== SECTION 1 DATA ==========
; Coins for section 1 (5 coins)
sec1CoinX BYTE 15, 25, 35, 45, 55
sec1CoinY BYTE 25, 25, 22, 22, 25
sec1CoinCollected BYTE 0, 0, 0, 0, 0

; Enemies for section 1 (2 goombas)
sec1EnemyX BYTE 30, 60
sec1EnemyY BYTE 26, 26
sec1EnemyActive BYTE 1, 1
sec1EnemyDir BYTE 1, 0

; Platforms section 1
; Platform at y=23, x=20-35
; Platform at y=20, x=40-50
; ? blocks at y=20, x=22,26,30

; ========== SECTION 2 DATA ==========
; Coins for section 2 (5 coins)
sec2CoinX BYTE 10, 20, 40, 50, 70
sec2CoinY BYTE 25, 16, 22, 22, 25
sec2CoinCollected BYTE 0, 0, 0, 0, 0

; Enemies for section 2 (3 goombas)
sec2EnemyX BYTE 25, 45, 65
sec2EnemyY BYTE 26, 26, 26
sec2EnemyActive BYTE 1, 1, 1
sec2EnemyDir BYTE 1, 0, 1

; Platforms section 2
; Platform at y=23, x=10-25
; Platform at y=17, x=15-30
; Platform at y=23, x=55-70
; ? blocks at y=17, x=20,25

; ========== SECTION 3 DATA ==========
; Coins for section 3 (5 coins)
sec3CoinX BYTE 15, 30, 45, 55, 65
sec3CoinY BYTE 22, 16, 25, 22, 25
sec3CoinCollected BYTE 0, 0, 0, 0, 0

; Enemies for section 3 (2 goombas)
sec3EnemyX BYTE 35, 55
sec3EnemyY BYTE 26, 26
sec3EnemyActive BYTE 1, 1
sec3EnemyDir BYTE 0, 1

; Platforms section 3
; Staircase to flagpole
; ? blocks at y=20, x=40,45

; ========== CURRENT SECTION POINTERS ==========
coinXPtr DWORD ?
coinYPtr DWORD ?
coinCollectedPtr DWORD ?
coinCount BYTE 5

enemyXPtr DWORD ?
enemyYPtr DWORD ?
enemyActivePtr DWORD ?
enemyDirPtr DWORD ?
enemyCount BYTE 2

inputChar BYTE ?

; ========== FIREBALL SYSTEM ==========
fireball1Active BYTE 0
fireball1X BYTE 0
fireball1Y BYTE 0
fireball1Dir BYTE 1

fireball2Active BYTE 0
fireball2X BYTE 0
fireball2Y BYTE 0
fireball2Dir BYTE 1



; ===== LEVEL 2 (UNDERGROUND) DATA =====
lvl2CoinX BYTE 10, 20, 30, 40, 50
lvl2CoinY BYTE 20, 22, 24, 18, 16
lvl2CoinCollected BYTE 0,0,0,0,0

lvl2EnemyX BYTE 25, 45, 65        ; normal goombas or plants
lvl2EnemyY BYTE 26, 26, 26
lvl2EnemyActive BYTE 1, 1, 1
lvl2EnemyDir BYTE 1, 0, 1

; ===== LEVEL 3 (SKY) DATA =====
lvl3CoinX BYTE 15, 25, 35, 45, 55
lvl3CoinY BYTE 15, 17, 13, 19, 21
lvl3CoinCollected BYTE 0,0,0,0,0

lvl3EnemyX BYTE 20, 30, 50, 60    ; flying enemies
lvl3EnemyY BYTE 12, 14, 13, 15
lvl3EnemyActive BYTE 1,1,1,1
lvl3EnemyDir BYTE 1,0,1,0         ; you can treat them like goombas for now

; ===== LEVEL 4 (CASTLE) DATA =====
lvl4CoinX BYTE 10, 20, 35, 45, 60
lvl4CoinY BYTE 22, 22, 18, 18, 16
lvl4CoinCollected BYTE 0,0,0,0,0

; Normal enemies + BOSS (5 total)
lvl4EnemyX BYTE 30, 50, 60, 70, 68        ; Last one is BOSS at x=68
lvl4EnemyY BYTE 24, 24, 18, 18, 26       ; Last one is BOSS at y=18
lvl4EnemyActive BYTE 1,1,1,1,1            ; All active
lvl4EnemyDir BYTE 1,0,1,0,0               ; Boss starts left

; Boss-specific data
bossHealth BYTE 5
;bossMinX BYTE 58        ; Boss left boundary (68-10)
;bossMaxX BYTE 78        ; Boss right boundary (68+10)
bossJumpTimer DWORD 0
bossShootTimer DWORD 0
bossIsJumping BYTE 0
bossJumpHeight BYTE 0
bossSpeed BYTE 1                ; How fast boss moves (1 = normal, 2 = fast)
bossChaseRange BYTE 15         ; How close player needs to be for boss to chase

bossMinX    BYTE 25
bossMaxX    BYTE 255

bossMinY    BYTE 5
bossMaxY    BYTE 35

bossGroundY BYTE 18
bossJumpVel BYTE 0

; Boss fireball
bossFireballActive BYTE 0
bossFireballX BYTE 0
bossFireballY BYTE 0
bossFireballDX SBYTE 0      ; -1, 0, or 1
bossFireballDY SBYTE 0      ; -1, 0, or 1

; Level thingy 
currentLevel BYTE 1   ; 1 = overworld, 2 = underground, 3 = sky, 4 = castle
maxLevel     BYTE 3



; Moving Platform Data for Level 2
movPlatX BYTE 25
movPlatY BYTE 20
movPlatDir BYTE 1    ; 1=right, 0=left
movPlatLen BYTE 8





.code 
; ========================================
; CHECK KOOPA COLLISION (LEVEL 2 ONLY)
; ========================================
DrawLevel PROC
    cmp currentLevel, 1
    je callDrawLevel1
    cmp currentLevel, 2
    je callDrawLevel2
    cmp currentLevel, 3
    je callDrawLevel3

    ret
callDrawLevel1:
    call DrawLevel1
    ret
callDrawLevel2:
    call DrawLevel2
    ret
callDrawLevel3:
    call DrawLevel3
    ret
DrawLevel ENDP

; ========================================
; DRAW LEVEL 1 - OVERWORLD 
; ========================================
DrawLevel1 PROC
    push eax
    push edx
    push ecx
    
    ; Ground
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov dh, 27
    mov dl, 0  
    mov ecx, 80
gL1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop gL1
    
    cmp currentSection, 1
    je drawS1L1
    cmp currentSection, 2
    je drawS2L1
    jmp drawS3L1

drawS1L1:
    ; Platform y=23, x=20-35
    mov dh, 23
    mov dl, 20
    mov ecx, 16
s1p1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s1p1
    
    ; Platform y=20, x=40-55
    mov dh, 20
    mov dl, 40
    mov ecx, 16
s1p2:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s1p2
    
    ; ? blocks
    mov eax, white + (yellow * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 22
    call Gotoxy
    mov al, '?'
    call WriteChar
    mov dl, 26
    call Gotoxy
    call WriteChar
    mov dl, 30
    call Gotoxy
    call WriteChar
    
    call DrawPipe1
    jmp doneL1

drawS2L1:
    mov eax, yellow + (brown * 16)
    call SetTextColor
    ; Platform y=23, x=10-25
    mov dh, 23
    mov dl, 10
    mov ecx, 16
s2p1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s2p1
    
    ; Platform y=17, x=15-35
    mov dh, 17
    mov dl, 15
    mov ecx, 21
s2p2:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s2p2
    
    ; Platform y=23, x=55-70
    mov dh, 23
    mov dl, 55
    mov ecx, 16
s2p3:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s2p3
    
    ; ? blocks
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 14
    mov dl, 20
    call Gotoxy
    mov al, '?'
    call WriteChar
    mov dl, 25
    call Gotoxy
    call WriteChar
    mov dl, 30
    call Gotoxy
    call WriteChar
    
    call DrawPipe2
    jmp doneL1

drawS3L1:
    mov eax, yellow + (brown * 16)
    call SetTextColor
    
    ; Staircase (keeping your existing one)
    mov dh, 26
    mov dl, 55
    mov ecx, 4
st1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st1
    
    mov dh, 25
    mov dl, 59
    mov ecx, 4
st2a:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st2a
    mov dh, 26
    mov dl, 59
    mov ecx, 4
st2b:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st2b
    
    mov dh, 24
    mov dl, 63
    mov ecx, 4
st3a:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st3a
    mov dh, 25
    mov dl, 63
    mov ecx, 4
st3b:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st3b
    mov dh, 26
    mov dl, 63
    mov ecx, 4
st3c:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st3c
    
    mov dh, 23
    mov dl, 67
    mov ecx, 4
st4a:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st4a
    mov dh, 24
    mov dl, 67
    mov ecx, 4
st4b:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st4b
    mov dh, 25
    mov dl, 67
    mov ecx, 4
st4c:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st4c
    mov dh, 26
    mov dl, 67
    mov ecx, 4
st4d:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop st4d
    
    ; Platform y=23, x=10-30
    mov dh, 23
    mov dl, 10
    mov ecx, 21
s3p1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s3p1
    
    ; ? blocks
    mov eax, white + (yellow * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 15
    call Gotoxy
    mov al, '?'
    call WriteChar
    mov dl, 20
    call Gotoxy
    call WriteChar

doneL1:
    pop ecx
    pop edx
    pop eax
    ret
DrawLevel1 ENDP


; DRAW LEVEL 2 - UNDERGROUND WITH PITS (3 sections)
; ========================================
DrawLevel2 PROC
    push eax
    push edx
    push ecx
    
    ; Draw ground with GAPS
    mov eax, yellow + (cyan * 16)  ; Yellow text on cyan background
    call SetTextColor
    mov dh, 27
    mov dl, 0
    
gL2Loop:
    cmp dl, 80
    jge doneGroundL2
    
    ; Check which section for pit locations
    cmp currentSection, 1
    je pitCheckS1L2
    cmp currentSection, 2
    je pitCheckS2L2
    jmp pitCheckS3L2

pitCheckS1L2:
    ; Section 1: Pit at x=30-40
    cmp dl, 30
    jb drawGroundL2
    cmp dl, 40
    jbe skipGroundL2  ; DON'T draw if in pit
    jmp drawGroundL2

pitCheckS2L2:
    ; Section 2: Pit at x=35-48
    cmp dl, 35
    jb drawGroundL2
    cmp dl, 48
    jbe skipGroundL2
    jmp drawGroundL2

pitCheckS3L2:
    ; Section 3: Two pits at x=25-33 and x=55-63
    cmp dl, 25
    jb drawGroundL2
    cmp dl, 33
    jbe skipGroundL2
    cmp dl, 55
    jb drawGroundL2
    cmp dl, 63
    jbe skipGroundL2
    jmp drawGroundL2

drawGroundL2:
    call Gotoxy
    mov al, '#'
    call WriteChar

skipGroundL2:
    inc dl
    jmp gL2Loop

doneGroundL2:
    ; Section-specific platforms
    cmp currentSection, 1
    je drawS1L2
    cmp currentSection, 2
    je drawS2L2
    jmp drawS3L2

drawS1L2:
    mov eax, yellow + (cyan * 16)
    call SetTextColor
    
    ; Platform y=22, x=10-20
    mov dh, 22
    mov dl, 10
    mov ecx, 11
s1l2p1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s1l2p1
    
    ; Platform y=18, x=50-65
    mov dh, 18
    mov dl, 50
    mov ecx, 16
s1l2p2:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s1l2p2
    
    ; Moving platform
    call DrawMovingPlatform
    
    ; ? blocks
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 19
    mov dl, 15
    call Gotoxy
    mov al, '?'
    call WriteChar
    mov dl, 56
    call Gotoxy
    mov al, '?'
    call WriteChar
    
    ; PIPE at x=62-67, y=25-26
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    mov dh, 25
    mov dl, 62
    mov ecx, 6
s1l2pipeTop:
    call Gotoxy
    mov al, 220
    call WriteChar
    inc dl
    loop s1l2pipeTop
    
    mov dh, 26
    mov dl, 62
    mov ecx, 6
s1l2pipeBody:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop s1l2pipeBody
    jmp doneL2

drawS2L2:
    mov eax, yellow + (cyan * 16)
    call SetTextColor
    
    ; Platform y=23, x=10-23
    mov dh, 23
    mov dl, 10
    mov ecx, 14
s2l2p1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s2l2p1
    
    ; Platform y=19, x=52-70
    mov dh, 19
    mov dl, 52
    mov ecx, 19
s2l2p2:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s2l2p2
    
    ; ? blocks
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 16
    mov dl, 60
    call Gotoxy
    mov al, '?'
    call WriteChar
    
    ; ===== HIDDEN ENTRANCE PIPE (GOLDEN!) at x=28-33 =====
    mov eax, yellow + (brown * 16)       ; GOLDEN pipe!
    call SetTextColor
    mov dh, 24
    mov dl, 28
    mov ecx, 6
s2l2hiddenPipeTop:
    call Gotoxy
    mov al, 220
    call WriteChar
    inc dl
    loop s2l2hiddenPipeTop
    
    mov dh, 25
s2l2hiddenPipeLoop:
    cmp dh, 27
    jge doneL2
    mov dl, 28
    mov ecx, 6
s2l2hiddenPipeInner:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop s2l2hiddenPipeInner
    inc dh
    jmp s2l2hiddenPipeLoop

drawS3L2:
    mov eax, yellow + (cyan * 16)
    call SetTextColor
    
    ; Platform y=22, x=5-20
    mov dh, 22
    mov dl, 5
    mov ecx, 16
s3l2p1:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s3l2p1
    
    ; Platform y=20, x=68-76
    mov dh, 20
    mov dl, 68
    mov ecx, 9
s3l2p2:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop s3l2p2
    
    ; Bridge over pit y=24, x=35-47
    mov dh, 24
    mov dl, 35
    mov ecx, 13
s3l2bridge:
    call Gotoxy
    mov al, '='
    call WriteChar
    inc dl
    loop s3l2bridge
    
    ; ? blocks
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 17
    mov dl, 10
    call Gotoxy
    mov al, '?'
    call WriteChar
    mov dl, 15
    call Gotoxy
    mov al, '?'
    call WriteChar

doneL2:
    pop ecx
    pop edx
    pop eax
    ret
DrawLevel2 ENDP
; ========================================
; DRAW HIDDEN COIN ROOM
; ========================================
DrawHiddenRoom PROC
    push eax
    push edx
    push ecx
    
    ; Dark background
    mov eax, yellow + (black * 16)
    call SetTextColor
    
    ; Draw floor
    mov dh, 27
    mov dl, 0
    mov ecx, 80
hiddenFloor:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop hiddenFloor
    
    ; Draw LEFT platform (y=20, x=5-35)
    mov dh, 20
    mov dl, 5
    mov ecx, 31
hiddenPlatformLeft:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop hiddenPlatformLeft
    
    ; Draw RIGHT platform (y=20, x=45-75)
    mov dh, 20
    mov dl, 45
    mov ecx, 31
hiddenPlatformRight:
    call Gotoxy
    mov al, '#'
    call WriteChar
    inc dl
    loop hiddenPlatformRight
    
    ; Exit pipe (green) at x=70-75
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    mov dh, 25
    mov dl, 70
    mov ecx, 6
exitPipeTop:
    call Gotoxy
    mov al, 220
    call WriteChar
    inc dl
    loop exitPipeTop
    
    mov dh, 26
    mov dl, 70
    mov ecx, 6
exitPipeBody:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop exitPipeBody
    
    ; Draw title
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov dh, 5
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET hiddenRoomMsg
    call WriteString
    
    ; Draw exit message
    mov eax, white + (black * 16)
    call SetTextColor
    mov dh, 22
    mov dl, 22
    call Gotoxy
    mov edx, OFFSET hiddenRoomExit
    call WriteString
    
    pop ecx
    pop edx
    pop eax
    ret
DrawHiddenRoom ENDP


; ========================================
; CHECK HIDDEN PIPE ENTRY - FIXED
; ========================================
CheckHiddenPipe PROC
    push eax
    push edx
    
    ; Only in Level 2, Section 2
    cmp currentLevel, 2
    jne noHiddenPipe
    cmp currentSection, 2
    jne noHiddenPipe
    
    ; Check if we're in hidden room
    cmp inHiddenRoom, 1
    je checkExitPipe
    
    ; ===== CHECK ENTRANCE PIPE =====
    ; Check if player is NEAR the golden pipe (x=28-33, y=23-26)
    mov dl, xPos
    cmp dl, 28
    jb noHiddenPipe
    cmp dl, 33
    ja noHiddenPipe
    
    mov dh, yPos
    cmp dh, 23          ; Changed from 24 to 23 (standing ON TOP)
    jb noHiddenPipe
    cmp dh, 26
    ja noHiddenPipe
    
    ; DEBUG: Show message that we're on the pipe
    push eax
    push edx
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov dh, 1
    mov dl, 45
    call Gotoxy
    mov al, 'P'
    call WriteChar
    mov al, 'R'
    call WriteChar
    mov al, 'E'
    call WriteChar
    mov al, 'S'
    call WriteChar
    mov al, 'S'
    call WriteChar
    mov al, ' '
    call WriteChar
    mov al, 'S'
    call WriteChar
    mov al, '!'
    call WriteChar
    pop edx
    pop eax
    
    ; Check if 'S' key is being pressed
    mov al, inputChar
    cmp al, 's'
    je enterHiddenRoom
    cmp al, 'S'
    je enterHiddenRoom
    jmp noHiddenPipe

enterHiddenRoom:
    ; Clear the "PRESS S!" message
    push eax
    push edx
    mov eax, black + (black * 16)
    call SetTextColor
    mov dh, 1
    mov dl, 45
    call Gotoxy
    mov ecx, 20
clearMsg:
    mov al, ' '
    call WriteChar
    loop clearMsg
    pop edx
    pop eax
    
    ; Enter hidden room!
    mov inHiddenRoom, 1
    mov xPos, 40           ; Spawn in middle
    mov yPos, 19           ; On platform
    
    ; Set up hidden room coin pointers
    mov coinXPtr, OFFSET hiddenRoomCoinX
    mov coinYPtr, OFFSET hiddenRoomCoinY
    mov coinCollectedPtr, OFFSET hiddenRoomCoinCollected
    mov coinCount, 10
    
    ; Clear enemies in hidden room
    mov enemyCount, 0
    
    ; Play powerup sound
    call PlayPowerUpSound
    
    ; Redraw everything
    call Clrscr
    call DrawSkyBackground
    call DrawHiddenRoom
    call DrawCoins
    call DrawPlayer
    call DrawHUD
    
    jmp noHiddenPipe

checkExitPipe:
    ; ===== CHECK EXIT PIPE =====
    ; Exit pipe at x=70-75, y=24-26
    mov dl, xPos
    cmp dl, 70
    jb noHiddenPipe
    cmp dl, 75
    ja noHiddenPipe
    
    mov dh, yPos
    cmp dh, 24
    jb noHiddenPipe
    cmp dh, 26
    ja noHiddenPipe
    
    ; Show exit message
    push eax
    push edx
    mov eax, white + (black * 16)
    call SetTextColor
    mov dh, 22
    mov dl, 22
    call Gotoxy
    mov edx, OFFSET hiddenRoomExit
    call WriteString
    pop edx
    pop eax
    
    ; Check for 'S' key
    mov al, inputChar
    cmp al, 's'
    je exitHiddenRoom
    cmp al, 'S'
    je exitHiddenRoom
    jmp noHiddenPipe

exitHiddenRoom:
    ; Exit hidden room!
    mov inHiddenRoom, 0
    mov xPos, 30           ; Spawn back at entrance
    mov yPos, 23           ; On platform
    
    ; Restore Level 2 coin pointers
    mov coinXPtr, OFFSET lvl2CoinX
    mov coinYPtr, OFFSET lvl2CoinY
    mov coinCollectedPtr, OFFSET lvl2CoinCollected
    mov coinCount, 5
    
    ; Restore normal enemies
    mov enemyXPtr, OFFSET lvl2EnemyX
    mov enemyYPtr, OFFSET lvl2EnemyY
    mov enemyActivePtr, OFFSET lvl2EnemyActive
    mov enemyDirPtr, OFFSET lvl2EnemyDir
    mov enemyCount, 3
    
    ; Redraw everything
    call Clrscr
    call DrawSkyBackground
    call DrawClouds
    call DrawHUD
    call DrawLevel
    call DrawCoins
    call DrawEnemies
    call DrawPlayer

noHiddenPipe:
    pop edx
    pop eax
    ret
CheckHiddenPipe ENDP
; ========================================
; level 3 is lava 
; ========================================
DrawLevel3 PROC
    push eax
    push edx
    push ecx
    
    ; Draw ground with LAVA
    mov eax, lightGray + (gray * 16)
    call SetTextColor
    mov dh, 27
    mov dl, 0
    
gL3Loop:
    cmp dl, 80
    jge doneGroundL3
    
    ; Check which section for lava locations
    cmp currentSection, 1
    je lavaCheckS1L3
    jmp lavaCheckS2L3  ; Only 2 sections!

lavaCheckS1L3:
    ; Section 1: Lava at x=28-42
    cmp dl, 28
    jb drawGroundL3
    cmp dl, 42
    jbe drawLavaL3
    jmp drawGroundL3

lavaCheckS2L3:
    ; Section 2: Lava at x=38-54
    cmp dl, 38
    jb drawGroundL3
    cmp dl, 54
    jbe drawLavaL3
    jmp drawGroundL3

drawGroundL3:
    call Gotoxy
    mov al, 219  ; Solid block for castle floor
    call WriteChar
    jmp nextTileL3

drawLavaL3:
    mov eax, lightRed + (red * 16)
    call SetTextColor
    call Gotoxy
    mov al, '~'
    call WriteChar
    mov eax, lightGray + (gray * 16)
    call SetTextColor

nextTileL3:
    inc dl
    jmp gL3Loop

doneGroundL3:
    ; Section-specific platforms
    cmp currentSection, 1
    je drawS1L3
    jmp drawS2L3  ; Only 2 sections!

drawS1L3:
    ; Stone platforms
    mov eax, white + (gray * 16)
    call SetTextColor
    
    ; Platform y=23, x=8-22
    mov dh, 23
    mov dl, 8
    mov ecx, 15
s1l3p1:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop s1l3p1
    
    ; Platform y=20, x=48-65
    mov dh, 20
    mov dl, 48
    mov ecx, 18
s1l3p2:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop s1l3p2
    
    ; Bridge over lava y=24, x=30-40
    mov eax, yellow + (gray * 16)
    call SetTextColor
    mov dh, 24
    mov dl, 30
    mov ecx, 11
s1l3bridge:
    call Gotoxy
    mov al, '='
    call WriteChar
    inc dl
    loop s1l3bridge
    
    ; ? blocks
    mov eax, white + (yellow * 16)
    call SetTextColor
    mov dh, 17
    mov dl, 54
    call Gotoxy
    mov al, '?'
    call WriteChar
    mov dl, 59
    call Gotoxy
    call WriteChar
    
    ; Add castle walls decoration
    mov eax, brown + (gray * 16)
    call SetTextColor
    mov dh, 10
    mov dl, 5
    mov ecx, 4
castleWall1:
    call Gotoxy
    mov al, 186  ; Wall character
    call WriteChar
    inc dh
    loop castleWall1
    
    jmp doneL3

drawS2L3:
    ; Final boss area platforms
    mov eax, white + (gray * 16)
    call SetTextColor
    
    ; Platform y=23, x=5-30
    mov dh, 23
    mov dl, 5
    mov ecx, 26
s2l3p1:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop s2l3p1
    
    ; Boss platform y=19, x=60-76
    mov dh, 19
    mov dl, 60
    mov ecx, 17
s2l3p2:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop s2l3p2
    
    ; Bridge over lava y=24, x=40-52
    mov eax, yellow + (gray * 16)
    call SetTextColor
    mov dh, 24
    mov dl, 40
    mov ecx, 13
s2l3bridge:
    call Gotoxy
    mov al, '='
    call WriteChar
    inc dl
    loop s2l3bridge
    
    ; ? blocks
    mov eax, white + (yellow * 16)
    call SetTextColor
    mov dh, 16
    mov dl, 15
    call Gotoxy
    mov al, '?'
    call WriteChar
    mov dl, 20
    call Gotoxy
    call WriteChar
    
    ; Bowser marker
    mov eax, lightRed + (gray * 16)
    call SetTextColor
    mov dh, 18
    mov dl, 68
    call Gotoxy
    mov al, 'B'
    call WriteChar
    
    ; Castle towers
    mov eax, brown + (gray * 16)
    call SetTextColor
    mov dh, 5
    mov dl, 70
    mov ecx, 5
tower1:
    call Gotoxy
    mov al, 186
    call WriteChar
    inc dh
    loop tower1
    
    ; Tower top
    mov eax, yellow + (gray * 16)
    call SetTextColor
    mov dh, 4
    mov dl, 70
    call Gotoxy
    mov al, 254
    call WriteChar

doneL3:
    pop ecx
    pop edx
    pop eax
    ret
DrawLevel3 ENDP

DrawMovingPlatform PROC
    cmp currentLevel, 2
    jne noMovPlat
    cmp currentSection, 1
    jne noMovPlat
    
    push eax
    push edx
    push ecx
    
    mov eax, cyan + (blue * 16)
    call SetTextColor
    mov dh, movPlatY
    mov dl, movPlatX
    movzx ecx, movPlatLen
drawMP:
    call Gotoxy
    mov al, '='
    call WriteChar
    inc dl
    loop drawMP
    
    pop ecx
    pop edx
    pop eax

noMovPlat:
    ret
DrawMovingPlatform ENDP
UpdateMovingPlatforms PROC
    cmp currentLevel, 2
    je updateLevel2Platforms
    cmp currentLevel, 3
    je updateLevel3Platforms
    jmp noUpdate

updateLevel2Platforms:
    cmp currentSection, 1
    jne noUpdate
    
    push eax
    push edx
    push ecx
    
    ; Erase old position
    mov eax, bgEmptyColor
    call SetTextColor
    mov dh, movPlatY
    mov dl, movPlatX
    movzx ecx, movPlatLen
eraseMP:
    call Gotoxy
    mov al, ' '
    call WriteChar
    inc dl
    loop eraseMP
    
    ; Move platform
    cmp movPlatDir, 1
    je moveMPRight
    
    ; Move left
    dec movPlatX
    cmp movPlatX, 22
    jg redrawMP
    mov movPlatDir, 1
    jmp redrawMP

moveMPRight:
    inc movPlatX
    mov al, movPlatX
    add al, movPlatLen
    cmp al, 48
    jl redrawMP
    mov movPlatDir, 0

redrawMP:
    call DrawMovingPlatform
    jmp doneUpdate

updateLevel3Platforms:
    cmp currentSection, 1
    jne noUpdate
    
    push eax
    push edx
    push ecx
    
    ; Erase old bridge position by drawing background (NOT lava)
    mov eax, bgEmptyColor  ; Use the background color, not lava
    call SetTextColor
    mov dh, movPlatL3Y
    mov dl, movPlatL3X
    movzx ecx, movPlatL3Len
eraseMP_L3:
    call Gotoxy
    mov al, ' '           ; Draw empty space, not lava
    call WriteChar
    inc dl
    loop eraseMP_L3
    
    ; Move bridge
    cmp movPlatL3Dir, 1
    je moveMPRight_L3
    
    ; Move left
    dec movPlatL3X
    cmp movPlatL3X, 25        ; Left boundary
    jg redrawMP_L3
    mov movPlatL3Dir, 1
    jmp redrawMP_L3

moveMPRight_L3:
    inc movPlatL3X
    mov al, movPlatL3X
    add al, movPlatL3Len
    cmp al, 55                ; Right boundary
    jl redrawMP_L3
    mov movPlatL3Dir, 0

redrawMP_L3:
    ; Draw the moving bridge
    mov eax, yellow + (gray * 16)
    call SetTextColor
    mov dh, movPlatL3Y
    mov dl, movPlatL3X
    movzx ecx, movPlatL3Len
drawMP_L3:
    call Gotoxy
    mov al, '='
    call WriteChar
    inc dl
    loop drawMP_L3

doneUpdate:
    pop ecx
    pop edx
    pop eax

noUpdate:
    ret
UpdateMovingPlatforms ENDP
; ========================================
; CHECK FALL DEATH (Pits/Lava/Sky)
; ========================================
CheckFallDeath PROC
    push eax
    push edx
    
    ; LEVEL 3 (Castle/Lava) - Check lava death FIRST
    cmp currentLevel, 3
    jne checkLevel2Pits
    
    ; Check if player is at ground level (y=27)
    cmp yPos, 27
    jne checkBelowScreen
    
    ; Check if player is in lava location
    mov dl, xPos
    
    cmp currentSection, 1
    je checkLavaS1L3
    jmp checkLavaS2L3

checkLavaS1L3:
    ; Lava at x=28-42
    cmp dl, 28
    jb checkBelowScreen
    cmp dl, 42
    jbe playerInLava
    jmp checkBelowScreen

checkLavaS2L3:
    ; Lava at x=38-54
    cmp dl, 38
    jb checkBelowScreen
    cmp dl, 54
    jbe playerInLava
    jmp checkBelowScreen

    ; LEVEL 2 (Underground) - Check pit death
checkLevel2Pits:
    cmp currentLevel, 2
    jne checkBelowScreen
    
    ; Only check if player is at ground level
    cmp yPos, 27
    jne checkBelowScreen
    
    ; Check if player is in a pit location
    mov dl, xPos
    
    cmp currentSection, 1
    je checkPitS1L2
    cmp currentSection, 2
    je checkPitS2L2
    jmp checkPitS3L2

checkPitS1L2:
    ; Pit at x=30-40
    cmp dl, 30
    jb checkBelowScreen
    cmp dl, 40
    jbe playerInPit
    jmp checkBelowScreen

checkPitS2L2:
    ; Pit at x=35-48
    cmp dl, 35
    jb checkBelowScreen
    cmp dl, 48
    jbe playerInPit
    jmp checkBelowScreen

checkPitS3L2:
    ; Pits at x=25-33 and x=55-63
    cmp dl, 25
    jb checkBelowScreen
    cmp dl, 33
    jbe playerInPit
    cmp dl, 55
    jb checkBelowScreen
    cmp dl, 63
    jbe playerInPit
    jmp checkBelowScreen

checkBelowScreen:
    ; Check if player fell below screen (y >= 28)
    cmp yPos, 28
    jl noFall
    jmp playerInPit

playerInLava:
    ; LAVA DEATH - Instant kill, lose a life


    mov marioForm, 0
    
    ; Respawn based on level
    cmp currentLevel, 3
    je respawnLevel3
    jmp resetFall

playerInPit:
    ; PIT DEATH - Player fell into pit
    dec lives

    call PlayDeathSound
    mov marioForm, 0
    
    ; Respawn at safe position based on current level
    cmp currentLevel, 1
    je respawnLevel1
    cmp currentLevel, 2
    je respawnLevel2
    cmp currentLevel, 3
    je respawnLevel3
    jmp resetFall

respawnLevel1:
    mov xPos, 5
    mov yPos, 26
    jmp resetFall

respawnLevel2:
    ; Respawn on first safe platform
    mov xPos, 15
    mov yPos, 21
    jmp resetFall

respawnLevel3:
    ; Respawn on first safe platform (castle/lava level)
    mov xPos, 15
    mov yPos, 22
    jmp resetFall

resetFall:
    mov isJumping, 0
    mov jumpCounter, 0
    mov playerSpeed, 0

noFall:
    pop edx
    pop eax
    ret
CheckFallDeath ENDP


IsSolid PROC
    cmp currentLevel, 1
    je isSolidLevel1
    cmp currentLevel, 2
    je isSolidLevel2
    cmp currentLevel, 3
    je isSolidLevel3
      cmp inHiddenRoom, 1
    je checkHiddenRoomCollision



    checkHiddenRoomCollision:
    push edx
    mov al, 0
    
    ; Ground at y=27
    cmp yPos, 27
    jne checkHiddenPlatforms
    mov al, 1
    jmp doneHiddenRoom

checkHiddenPlatforms:
    ; Left platform: y=20, x=5-35
    cmp yPos, 20
    jne checkRightPlatform
    mov dl, xPos
    cmp dl, 5
    jb checkRightPlatform
    cmp dl, 35
    ja checkRightPlatform
    mov al, 1
    jmp doneHiddenRoom

checkRightPlatform:
    ; Right platform: y=20, x=45-75
    cmp yPos, 20
    jne checkExitPipe
    mov dl, xPos
    cmp dl, 45
    jb checkExitPipe
    cmp dl, 75
    ja checkExitPipe
    mov al, 1
    jmp doneHiddenRoom

checkExitPipe:
    ; Exit pipe: x=70-75, y=25-26
    mov dl, xPos
    cmp dl, 70
    jb doneHiddenRoom
    cmp dl, 75
    ja doneHiddenRoom
    cmp yPos, 25
    jb doneHiddenRoom
    cmp yPos, 26
    ja doneHiddenRoom
    mov al, 1

doneHiddenRoom:
    pop edx
    ret
; ========================================
; LEVEL 1
; ========================================
isSolidLevel1:
    push edx
    mov al, 0
    
    ; Ground at y=27
    cmp yPos, 27
    jne checkL1Platforms
    mov al, 1
    jmp doneL1

checkL1Platforms:
    cmp currentSection, 1
    je checkS1L1
    cmp currentSection, 2
    je checkS2L1
    jmp checkS3L1

; --- SECTION 1 ---
checkS1L1:
    ; Platform y=23, x=20-35
    cmp yPos, 23
    jne s1l1p2
    mov dl, xPos
    cmp dl, 20
    jb s1l1p2
    cmp dl, 35
    ja s1l1p2
    mov al, 1
    jmp doneL1

s1l1p2:
    ; Platform y=20, x=40-55
    cmp yPos, 20
    jne s1l1blocks
    mov dl, xPos
    cmp dl, 40
    jb s1l1blocks
    cmp dl, 55
    ja s1l1blocks
    mov al, 1
    jmp doneL1

s1l1blocks:
    ; ? blocks y=20, x=22,26,30
    cmp yPos, 20
    jne s1l1pipe
    mov dl, xPos
    cmp dl, 22
    je solidL1
    cmp dl, 26
    je solidL1
    cmp dl, 30
    je solidL1
    jmp s1l1pipe

s1l1pipe:
    ; Pipe x=60-65, y=25-26
    mov dl, xPos
    cmp dl, 60
    jb doneL1
    cmp dl, 65
    ja doneL1
    cmp yPos, 25
    jb doneL1
    cmp yPos, 26
    ja doneL1
    mov al, 1
    jmp doneL1

; --- SECTION 2 ---
checkS2L1:
    ; Platform y=23, x=10-25
    cmp yPos, 23
    jne s2l1p2
    mov dl, xPos
    cmp dl, 10
    jb s2l1p2
    cmp dl, 25
    ja s2l1p2
    mov al, 1
    jmp doneL1

s2l1p2:
    ; Platform y=17, x=15-35
    cmp yPos, 17
    jne s2l1p3
    mov dl, xPos
    cmp dl, 15
    jb s2l1p3
    cmp dl, 35
    ja s2l1p3
    mov al, 1
    jmp doneL1

s2l1p3:
    ; Platform y=23, x=55-70
    cmp yPos, 23
    jne s2l1blocks
    mov dl, xPos
    cmp dl, 55
    jb s2l1blocks
    cmp dl, 70
    ja s2l1blocks
    mov al, 1
    jmp doneL1

s2l1blocks:
    ; ? blocks y=14, x=20,25,30
    cmp yPos, 14
    jne s2l1pipe
    mov dl, xPos
    cmp dl, 20
    je solidL1
    cmp dl, 25
    je solidL1
    cmp dl, 30
    je solidL1
    jmp s2l1pipe

s2l1pipe:
    ; Pipe x=40-45, y=24-26
    mov dl, xPos
    cmp dl, 40
    jb doneL1
    cmp dl, 45
    ja doneL1
    cmp yPos, 24
    jb doneL1
    cmp yPos, 26
    ja doneL1
    mov al, 1
    jmp doneL1

; --- SECTION 3 ---
checkS3L1:
    ; Platform y=23, x=10-30
    cmp yPos, 23
    jne s3l1stairs
    mov dl, xPos
    cmp dl, 10
    jb s3l1stairs
    cmp dl, 30
    ja s3l1stairs
    mov al, 1
    jmp doneL1

s3l1stairs:
    ; Staircase y=26, x=55-58
    cmp yPos, 26
    jne s3l1st2
    mov dl, xPos
    cmp dl, 55
    jb s3l1st2
    cmp dl, 58
    ja s3l1st2
    mov al, 1
    jmp doneL1

s3l1st2:
    ; y=25, x=59-62
    cmp yPos, 25
    jne s3l1st3
    mov dl, xPos
    cmp dl, 59
    jb s3l1st3
    cmp dl, 62
    ja s3l1st3
    mov al, 1
    jmp doneL1

s3l1st3:
    ; y=24, x=63-66
    cmp yPos, 24
    jne s3l1st4
    mov dl, xPos
    cmp dl, 63
    jb s3l1st4
    cmp dl, 66
    ja s3l1st4
    mov al, 1
    jmp doneL1

s3l1st4:
    ; y=23, x=67-70
    cmp yPos, 23
    jne s3l1blocks
    mov dl, xPos
    cmp dl, 67
    jb s3l1blocks
    cmp dl, 70
    ja s3l1blocks
    mov al, 1
    jmp doneL1

s3l1blocks:
    ; ? blocks y=20, x=15,20
    cmp yPos, 20
    jne doneL1
    mov dl, xPos
    cmp dl, 15
    je solidL1
    cmp dl, 20
    je solidL1
    jmp doneL1

solidL1:
    mov al, 1

doneL1:
    pop edx
    ret
isSolidLevel2:
    push edx
    mov al, 0
    
    ; Ground with PITS
    cmp yPos, 27
    jne checkL2Platforms
    
    mov dl, xPos
    cmp currentSection, 1
    je pitS1L2
    cmp currentSection, 2
    je pitS2L2
    jmp pitS3L2

pitS1L2:
    cmp dl, 30
    jb solidL2
    cmp dl, 40
    jbe doneL2
    jmp solidL2

pitS2L2:
    cmp dl, 35
    jb solidL2
    cmp dl, 48
    jbe doneL2
    jmp solidL2

pitS3L2:
    cmp dl, 25
    jb solidL2
    cmp dl, 33
    jbe doneL2
    cmp dl, 55
    jb solidL2
    cmp dl, 63
    jbe doneL2
    jmp solidL2

checkL2Platforms:
    cmp currentSection, 1
    je checkS1L2
    cmp currentSection, 2
    je checkS2L2
    jmp checkS3L2

checkS1L2:
    ; Platform y=22, x=10-20
    cmp yPos, 22
    jne s1l2p2
    mov dl, xPos
    cmp dl, 10
    jb s1l2p2
    cmp dl, 20
    ja s1l2p2
    mov al, 1
    jmp doneL2

s1l2p2:
    ; Platform y=18, x=50-65
    cmp yPos, 18
    jne s1l2movplat
    mov dl, xPos
    cmp dl, 50
    jb s1l2movplat
    cmp dl, 65
    ja s1l2movplat
    mov al, 1
    jmp doneL2

s1l2movplat:
    ; Moving platform y=20
    cmp yPos, 20
    jne s1l2pipe
    mov dl, xPos
    cmp dl, movPlatX
    jb s1l2pipe
    mov al, movPlatX
    add al, movPlatLen
    cmp dl, al
    jae s1l2pipe
    mov al, 1
    jmp doneL2

s1l2pipe:
    ; Pipe x=62-67, y=25-26
    mov dl, xPos
    cmp dl, 62
    jb s1l2blocks
    cmp dl, 67
    ja s1l2blocks
    cmp yPos, 25
    jb s1l2blocks
    cmp yPos, 26
    ja s1l2blocks
    mov al, 1
    jmp doneL2

s1l2blocks:
    ; ? blocks y=19, x=15,56
    cmp yPos, 19
    jne doneL2
    mov dl, xPos
    cmp dl, 15
    je solidL2
    cmp dl, 56
    je solidL2
    jmp doneL2

checkS2L2:
    ; Platform y=23, x=10-23
    cmp yPos, 23
    jne s2l2p2
    mov dl, xPos
    cmp dl, 10
    jb s2l2p2
    cmp dl, 23
    ja s2l2p2
    mov al, 1
    jmp doneL2

s2l2p2:
    ; Platform y=19, x=52-70
    cmp yPos, 19
    jne s2l2pipe
    mov dl, xPos
    cmp dl, 52
    jb s2l2pipe
    cmp dl, 70
    ja s2l2pipe
    mov al, 1
    jmp doneL2

s2l2pipe:
    ; Pipe x=28-33, y=24-26
    mov dl, xPos
    cmp dl, 28
    jb s2l2blocks
    cmp dl, 33
    ja s2l2blocks
    cmp yPos, 24
    jb s2l2blocks
    cmp yPos, 26
    ja s2l2blocks
    mov al, 1
    jmp doneL2

s2l2blocks:
    ; ? block y=16, x=60
    cmp yPos, 16
    jne doneL2
    mov dl, xPos
    cmp dl, 60
    je solidL2
    jmp doneL2

checkS3L2:
    ; Platform y=22, x=5-20
    cmp yPos, 22
    jne s3l2p2
    mov dl, xPos
    cmp dl, 5
    jb s3l2p2
    cmp dl, 20
    ja s3l2p2
    mov al, 1
    jmp doneL2

s3l2p2:
    ; Platform y=20, x=68-76
    cmp yPos, 20
    jne s3l2bridge
    mov dl, xPos
    cmp dl, 68
    jb s3l2bridge
    cmp dl, 76
    ja s3l2bridge
    mov al, 1
    jmp doneL2

s3l2bridge:
    ; Bridge y=24, x=35-47
    cmp yPos, 24
    jne s3l2blocks
    mov dl, xPos
    cmp dl, 35
    jb s3l2blocks
    cmp dl, 47
    ja s3l2blocks
    mov al, 1
    jmp doneL2

s3l2blocks:
    ; ? blocks y=17, x=10,15
    cmp yPos, 17
    jne doneL2
    mov dl, xPos
    cmp dl, 10
    je solidL2
    cmp dl, 15
    je solidL2
    jmp doneL2

solidL2:
    mov al, 1

doneL2:
    pop edx
    ret

; ========================================
; LEVEL 3 - SKY (3 sections)
; ========================================
isSolidLevel3:
    push edx
    mov al, 0
    
    ; Ground with LAVA
    cmp yPos, 27
    jne checkL4Platforms
    
    mov dl, xPos
    cmp currentSection, 1
    je lavaS1L4
    jmp lavaS2L4

lavaS1L4:
    ; Lava at x=28-42
    cmp dl, 28
    jb solidL4
    cmp dl, 42
    jbe doneL4  ; In lava = NOT solid
    jmp solidL4

lavaS2L4:
    ; Lava at x=38-54
    cmp dl, 38
    jb solidL4
    cmp dl, 54
    jbe doneL4
    jmp solidL4

checkL4Platforms:
    cmp currentSection, 1
    je checkS1L4
    jmp checkS2L4

; --- SECTION 1 ---
checkS1L4:
    ; Platform y=23, x=8-22
    cmp yPos, 23
    jne s1l4p2
    mov dl, xPos
    cmp dl, 8
    jb s1l4p2
    cmp dl, 22
    ja s1l4p2
    mov al, 1
    jmp doneL4

s1l4p2:
    ; Platform y=20, x=48-65
    cmp yPos, 20
    jne s1l4bridge
    mov dl, xPos
    cmp dl, 48
    jb s1l4bridge
    cmp dl, 65
    ja s1l4bridge
    mov al, 1
    jmp doneL4

s1l4bridge:
    ; Bridge y=24, x=30-40
    cmp yPos, 24
    jne s1l4blocks
    mov dl, xPos
    cmp dl, 30
    jb s1l4blocks
    cmp dl, 40
    ja s1l4blocks
    mov al, 1
    jmp doneL4

s1l4blocks:
    ; ? blocks y=17, x=54,59
    cmp yPos, 17
    jne doneL4
    mov dl, xPos
    cmp dl, 54
    je solidL4
    cmp dl, 59
    je solidL4
    jmp doneL4

; --- SECTION 2 ---
checkS2L4:
    ; Platform y=23, x=5-30
    cmp yPos, 23
    jne s2l4p2
    mov dl, xPos
    cmp dl, 5
    jb s2l4p2
    cmp dl, 30
    ja s2l4p2
    mov al, 1
    jmp doneL4

s2l4p2:
    ; Platform y=20, x=60-76 (boss area)
    cmp yPos, 20
    jne s2l4bridge
    mov dl, xPos
    cmp dl, 60
    jb s2l4bridge
    cmp dl, 76
    ja s2l4bridge
    mov al, 1
    jmp doneL4

s2l4bridge:
    ; Bridge y=24, x=40-52
    cmp yPos, 24
    jne s2l4blocks
    mov dl, xPos
    cmp dl, 40
    jb s2l4blocks
    cmp dl, 52
    ja s2l4blocks
    mov al, 1
    jmp doneL4

s2l4blocks:
    ; ? blocks y=19, x=15,20
    cmp yPos, 19
    jne doneL4
    mov dl, xPos
    cmp dl, 15
    je solidL4
    cmp dl, 20
    je solidL4
    jmp doneL4

solidL4:
    mov al, 1

doneL4:
    pop edx
    ret

isSolidLevel4:

IsSolid ENDP


; ========================================
; INITIALIZE GAME
; ========================================
InitGame PROC

 mov inHiddenRoom, 0
mov magnetCharges, 5  

 mov highscore, 0
    mov score, 0
    mov coins, 0
    mov lives, 100
    mov gameTime, 400
    mov xPos, 5
    mov yPos, 26
    mov playerDir, 0
    mov isJumping, 0
    mov jumpCounter, 0
    mov playerSpeed, 0
    mov enemiesDefeated, 0
    mov levelComplete, 0
    mov marioForm, 0
    mov powerupActive, 0
    mov powerupType, 0
    mov currentSection, 1
    
    ; Reset fireballs
    mov fireball1Active, 0
    mov fireball2Active, 0
    
    call GetMseconds
    mov lastTime, eax
    

    call LoadLevelData
   
    
    ; Reset all section coins
    mov ecx, 5
    mov esi, OFFSET sec1CoinCollected
resetSec1Coins:
    mov BYTE PTR [esi], 0
    inc esi
    loop resetSec1Coins
    
    mov ecx, 5
    mov esi, OFFSET sec2CoinCollected
resetSec2Coins:
    mov BYTE PTR [esi], 0
    inc esi
    loop resetSec2Coins
    
    mov ecx, 5
    mov esi, OFFSET sec3CoinCollected
resetSec3Coins:
    mov BYTE PTR [esi], 0
    inc esi
    loop resetSec3Coins
    
    ; Reset section 1 enemies
    mov BYTE PTR sec1EnemyX[0], 30
    mov BYTE PTR sec1EnemyX[1], 60
    mov BYTE PTR sec1EnemyActive[0], 1
    mov BYTE PTR sec1EnemyActive[1], 1
    
    ; Reset section 2 enemies
    mov BYTE PTR sec2EnemyX[0], 25
    mov BYTE PTR sec2EnemyX[1], 45
    mov BYTE PTR sec2EnemyX[2], 65
    mov BYTE PTR sec2EnemyActive[0], 1
    mov BYTE PTR sec2EnemyActive[1], 1
    mov BYTE PTR sec2EnemyActive[2], 1
    
    ; Reset section 3 enemies
    mov BYTE PTR sec3EnemyX[0], 35
    mov BYTE PTR sec3EnemyX[1], 55
    mov BYTE PTR sec3EnemyActive[0], 1
    mov BYTE PTR sec3EnemyActive[1], 1
    
    ; Load section 1 data
    call LoadSectionData
     

    ret
InitGame ENDP

; ========================================
; LOAD SECTION DATA - Sets pointers for current section
; ========================================
LoadSectionData PROC
    push eax
    
    cmp currentSection, 1
    je loadSec1
    cmp currentSection, 2
    je loadSec2
    jmp loadSec3

loadSec1:
    mov coinXPtr, OFFSET sec1CoinX
    mov coinYPtr, OFFSET sec1CoinY
    mov coinCollectedPtr, OFFSET sec1CoinCollected
    mov coinCount, 5
    
    mov enemyXPtr, OFFSET sec1EnemyX
    mov enemyYPtr, OFFSET sec1EnemyY
    mov enemyActivePtr, OFFSET sec1EnemyActive
    mov enemyDirPtr, OFFSET sec1EnemyDir
    mov enemyCount, 2
    jmp doneLoadSection

loadSec2:
    mov coinXPtr, OFFSET sec2CoinX
    mov coinYPtr, OFFSET sec2CoinY
    mov coinCollectedPtr, OFFSET sec2CoinCollected
    mov coinCount, 5
    
    mov enemyXPtr, OFFSET sec2EnemyX
    mov enemyYPtr, OFFSET sec2EnemyY
    mov enemyActivePtr, OFFSET sec2EnemyActive
    mov enemyDirPtr, OFFSET sec2EnemyDir
    mov enemyCount, 3
    jmp doneLoadSection

loadSec3:
    mov coinXPtr, OFFSET sec3CoinX
    mov coinYPtr, OFFSET sec3CoinY
    mov coinCollectedPtr, OFFSET sec3CoinCollected
    mov coinCount, 5
    
    mov enemyXPtr, OFFSET sec3EnemyX
    mov enemyYPtr, OFFSET sec3EnemyY
    mov enemyActivePtr, OFFSET sec3EnemyActive
    mov enemyDirPtr, OFFSET sec3EnemyDir
    mov enemyCount, 2

doneLoadSection:
    pop eax
    ret
LoadSectionData ENDP

LoadLevelData PROC
    cmp currentLevel, 1
    je loadLevel1
    cmp currentLevel, 2
    je loadLevel2
    cmp currentLevel, 3
    je loadLevel3
    ret

loadLevel1:
    ; Section-based system for overworld
    call LoadSectionData
    ret

loadLevel2:
    ; Underground level with Koopas
    mov currentSection, 1
    mov coinXPtr, OFFSET lvl2CoinX
    mov coinYPtr, OFFSET lvl2CoinY
    mov coinCollectedPtr, OFFSET lvl2CoinCollected
    mov coinCount, 5

    mov enemyXPtr, OFFSET lvl2EnemyX
    mov enemyYPtr, OFFSET lvl2EnemyY
    mov enemyActivePtr, OFFSET lvl2EnemyActive
    mov enemyDirPtr, OFFSET lvl2EnemyDir
    mov enemyCount, 3
    ret

loadLevel3:
    ; Castle/Lava level (uses lvl4 labels)
    mov coinXPtr, OFFSET lvl4CoinX
    mov coinYPtr, OFFSET lvl4CoinY
    mov coinCollectedPtr, OFFSET lvl4CoinCollected
    mov coinCount, 5

    mov enemyXPtr, OFFSET lvl4EnemyX
    mov enemyYPtr, OFFSET lvl4EnemyY
    mov enemyActivePtr, OFFSET lvl4EnemyActive
    mov enemyDirPtr, OFFSET lvl4EnemyDir
    mov enemyCount, 5           ; CHANGED from 3 to 5 (includes boss)
    
    ; Initialize boss
    mov bossHealth, 5
    mov bossIsJumping, 0
    mov bossFireballActive, 0
    call GetMseconds
    mov bossJumpTimer, eax
    mov bossShootTimer, eax
    
    ret  
LoadLevelData ENDP


; ========================================
; CHANGE SECTION - Transition to next/prev section
; ========================================
ChangeSection PROC
    push eax
    
    ; Clear fireballs when changing sections
    mov fireball1Active, 0
    mov fireball2Active, 0
    mov powerupActive, 0
    
    ; Check which level we're in
    cmp currentLevel, 1
    je setupLevel1Data
    cmp currentLevel, 2
    je setupLevel2Data
    jmp setupLevel3Data

setupLevel1Data:
    ; Level 1 uses section system
    call LoadSectionData
    jmp afterSetup

setupLevel2Data:
    ; Level 2 (underground) - single section
    mov coinXPtr, OFFSET lvl2CoinX
    mov coinYPtr, OFFSET lvl2CoinY
    mov coinCollectedPtr, OFFSET lvl2CoinCollected
    mov coinCount, 5
    mov enemyXPtr, OFFSET lvl2EnemyX
    mov enemyYPtr, OFFSET lvl2EnemyY
    mov enemyActivePtr, OFFSET lvl2EnemyActive
    mov enemyDirPtr, OFFSET lvl2EnemyDir
    mov enemyCount, 3
    jmp afterSetup

setupLevel3Data:
    ; Level 3 (castle) uses lvl4 arrays
    mov coinXPtr, OFFSET lvl4CoinX
    mov coinYPtr, OFFSET lvl4CoinY
    mov coinCollectedPtr, OFFSET lvl4CoinCollected
    mov coinCount, 5
    mov enemyXPtr, OFFSET lvl4EnemyX
    mov enemyYPtr, OFFSET lvl4EnemyY
    mov enemyActivePtr, OFFSET lvl4EnemyActive
    mov enemyDirPtr, OFFSET lvl4EnemyDir
    mov enemyCount, 5

afterSetup:
    ; Redraw the entire screen
    call Clrscr
    call DrawSkyBackground
    call DrawClouds
    call DrawLevel
    call DrawCoins
    call DrawEnemies
    cmp currentSection, 3
    jne skipFlagDraw
    call DrawFlagpole
skipFlagDraw:
    call DrawPlayer
    call DrawHUD
    
    pop eax
    ret
ChangeSection ENDP

; ========================================
; CHECK SECTION TRANSITION
; ========================================
CheckSectionTransition PROC
    push eax
    
    ; Check if going right (to next section)
    cmp xPos, 78
    jl checkLeftTransition
    
    cmp currentSection, 3
    jge doneTransition      ; Already at last section
    
    ; Move to next section
    inc currentSection
    mov xPos, 2             ; Start from left side
    call ChangeSection
    jmp doneTransition

checkLeftTransition:
    ; Check if going left (to previous section)
    cmp xPos, 1
    jg doneTransition
    
    cmp currentSection, 1
    jle doneTransition      ; Already at first section
    
    ; Move to previous section
    dec currentSection
    mov xPos, 77            ; Start from right side
    call ChangeSection

doneTransition:
    pop eax
    ret
CheckSectionTransition ENDP

UpdateTimer PROC
    push eax
    push ebx
    
    call GetMseconds
    mov ebx, eax
    sub ebx, lastTime
    
    cmp ebx, 1000
    jl skipTimerUpdate
    
    cmp gameTime, 0
    jle skipTimerUpdate
    
    dec gameTime
    
    call GetMseconds
    mov lastTime, eax
    
skipTimerUpdate:
    pop ebx
    pop eax
    ret
UpdateTimer ENDP

DrawSkyBackground PROC
    push eax
    push ecx
    push edx

    cmp currentLevel, 2
    je undergroundBg
    cmp currentLevel, 3
    je castleBg

    ; Default (Level 1 & 3: blue sky)
    mov bgAttr, blue * 16
    mov eax, lightBlue
    add eax, bgAttr
    mov bgEmptyColor, eax
    jmp drawBg

undergroundBg:
    ; Level 2: DARK GRAY cave - NOT BLACK!
    mov bgAttr, cyan * 16           ; CHANGED FROM BLACK
    mov eax, lightCyan              ; Light cyan for visibility
    add eax, bgAttr
    mov bgEmptyColor, eax
    jmp drawBg

castleBg:
    ; Level 3: gray stone
    mov bgAttr, gray * 16
    mov eax, lightGray
    add eax, bgAttr
    mov bgEmptyColor, eax

drawBg:
    call SetTextColor
    mov dh, 2
skyRowLoop:
    cmp dh, 27
    jge doneSky
    mov dl, 0
    mov ecx, 80
skyColLoop:
    call Gotoxy
    mov al, ' '
    call WriteChar
    inc dl
    loop skyColLoop
    inc dh
    jmp skyRowLoop

doneSky:
    pop edx
    pop ecx
    pop eax
    ret
DrawSkyBackground ENDP
; ========================================
; DRAW CLOUDS
; ========================================
DrawClouds PROC
    push eax
    push edx
    
    ; white text on global bgAttr
    mov eax, bgAttr
    add eax, white
    call SetTextColor
    
    ; small cloud left
    mov dh, 4
    mov dl, 5
    call Gotoxy
    mov edx, OFFSET cloudSmall
    call WriteString
    mov dh, 5
    mov dl, 5
    call Gotoxy
    mov edx, OFFSET cloudSmall2
    call WriteString
    mov dh, 6
    mov dl, 5
    call Gotoxy
    mov edx, OFFSET cloudSmall3
    call WriteString
    
    ; big cloud right
    mov dh, 3
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET cloudBig
    call WriteString
    mov dh, 4
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET cloudBig2
    call WriteString
    mov dh, 5
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET cloudBig3
    call WriteString
    mov dh, 6
    mov dl, 45
    call Gotoxy
    mov edx, OFFSET cloudBig4
    call WriteString
    
    pop edx
    pop eax
    ret
DrawClouds ENDP
DrawHUD PROC
    push eax
    push edx
    
    ; High Score (yellow)
    mov eax, black + (white * 16)
    call SetTextColor
    mov dh, 0
    mov dl, 2
    call Gotoxy
    mov edx, OFFSET hudHighScore
    call WriteString
    mov eax, highScore
    call WriteDec
    
    ; Current Score (white)
    mov eax, white + (black * 16)
    mov dh, 0
    mov dl, 20
    call Gotoxy
    mov edx, OFFSET hudScore
    call WriteString
    mov eax, score
    call WriteDec
    
    ; World info
    mov dh, 0
    mov dl, 38
    call Gotoxy
    mov edx, OFFSET hudWorld
    call WriteString
    movzx eax, currentLevel
    call WriteDec
    mov al, '-'
    call WriteChar
    movzx eax, currentSection
    call WriteDec
    
    ; Coins (yellow)
    mov eax, black + (white * 16)
    call SetTextColor
    mov dh, 0
    mov dl, 50
    call Gotoxy
    mov edx, OFFSET hudCoins
    call WriteString
    movzx eax, coins
    call WriteDec
    
    ; MAGNET CHARGES - ADD THIS SECTION
    mov dh, 0
    mov dl, 60
    call Gotoxy
    mov edx, OFFSET hudMagnet
    call WriteString
    movzx eax, magnetCharges
    call WriteDec
    
    ; Timer (white)
    mov eax, black+ (white * 16)
    call SetTextColor
    mov dh, 1        ; Moved to second row
    mov dl, 0
    call Gotoxy
    mov edx, OFFSET hudTimer
    call WriteString
    mov eax, gameTime
    call WriteDec
    
    ; Lives (red)
    mov eax, red + (white  * 16)
    call SetTextColor
    mov dh, 1        ; Moved to second row
    mov dl, 20
    call Gotoxy
    mov edx, OFFSET hudLives
    call WriteString
    movzx eax, lives
    call WriteDec
    
    pop edx
    pop eax
    ret
DrawHUD ENDP
; ========================================
; DRAW LEVEL - Based on current section
; ========================================
; =============== NEW DrawLevel (all levels use Level 1 layout) ===============
; Uses currentSection = 1,2,3 for sub-areas, same as your original Level 1
; currentLevel is ignored for drawing (you can still use it for enemies, bg, etc.)

comment @
the function responsible for restoring the correct background tile at any location the 
player or an enemy just moved from. Every time Mario moves, jumps, or an enemy walks, 
their previous position must be “cleaned” and redrawn, otherwise the screen would stay 
overwritten with their character. This procedure takes the current coordinates (xPos, yPos), 
checks which level and section the player is in, and determines what type of tile originally existed 
at that location—such as ground, platforms, pipes, question blocks, pits, lava, bridges, or 
empty background. Based on this, it redraws the correct symbol and color for that exact tile. In simple words
, this function is the map-restoration engine of the game, ensuring that the world’s graphics 
stay accurate and consistent even as characters move across the screen.
@

CheckLavaDeath PROC
    cmp currentLevel, 3
    jne noLava
    
    cmp yPos, 27
    jne noLava
    
    mov dl, xPos
    cmp dl, 25
    jb noLava
    cmp dl, 40
    ja noLava
    
    ; Player fell in lava - instant death!
    dec lives
    call PlayDeathSound
    mov marioForm, 0
    mov xPos, 5
    mov yPos, 20
    mov isJumping, 0
    
noLava:
    ret
CheckLavaDeath ENDP
NextLevel PROC
    cmp currentLevel, 4
    jge allLevelsComplete
    
    inc currentLevel
    mov currentSection, 1
    call InitGame
    call LoadLevelData
    ret

allLevelsComplete:
    ; You won the game!
    mov currentLevel, 1
    ret
NextLevel ENDP
; ========================================
; DRAW PIPE 1 (Section 1)
; ========================================
DrawPipe1 PROC
    push eax
    push edx
    push ecx
    
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    
    mov dh, 25
    mov dl, 60
    mov ecx, 6
pipe1Top:
    call Gotoxy
    mov al, 220
    call WriteChar
    inc dl
    loop pipe1Top
    
    mov dh, 26
    mov dl, 60
    mov ecx, 6
pipe1Body:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop pipe1Body
    
    pop ecx
    pop edx
    pop eax
    ret
DrawPipe1 ENDP

; ========================================
; DRAW PIPE 2
; ========================================
DrawPipe2 PROC
    push eax
    push edx
    push ecx
    
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    
    ; Tall pipe at x=40-45
    mov dh, 24
    mov dl, 40
    mov ecx, 6
pipe2Top:
    call Gotoxy
    mov al, 220
    call WriteChar
    inc dl
    loop pipe2Top
    
    mov dh, 25
pipe2BodyLoop:
    cmp dh, 27
    jge donePipe2
    mov dl, 40
    mov ecx, 6
pipe2BodyInner:
    call Gotoxy
    mov al, 219
    call WriteChar
    inc dl
    loop pipe2BodyInner
    inc dh
    jmp pipe2BodyLoop
    
donePipe2:
    pop ecx
    pop edx
    pop eax
    ret
DrawPipe2 ENDP

; ========================================
; DRAW FLAGPOLE (Section 3 only)
; ========================================
DrawFlagpole PROC
    push eax
    push edx
    push ecx
    
    ; pole: white on bgAttr
    mov eax, bgAttr
    add eax, white
    call SetTextColor
    
    mov ecx, 12
    mov dh, 15
drawPoleLoop:
    push ecx
    mov dl, 75
    call Gotoxy
    mov al, 179
    call WriteChar
    inc dh
    pop ecx
    loop drawPoleLoop
    
    ; flag: red on bgAttr
    mov eax, bgAttr
    add eax, red
    call SetTextColor
    mov dh, 15
    mov dl, 76
    call Gotoxy
    mov al, 16
    call WriteChar
    
    ; top: yellow on bgAttr
    mov eax, bgAttr
    add eax, yellow
    call SetTextColor
    mov dh, 14
    mov dl, 75
    call Gotoxy
    mov al, 254
    call WriteChar
    
    pop ecx
    pop edx
    pop eax
    ret
DrawFlagpole ENDP

; ========================================
; CHECK COLLISION BELOW
; ========================================
CheckBelow PROC
    push edx
    push ebx
    
    mov al, 0
    mov dh, yPos
    inc dh
    
    mov bl, yPos
    mov yPos, dh
    call IsSolid
    mov yPos, bl
    
    cmp al, 1
    je foundGround
    
    cmp dh, 27
    jne notGround
    mov al, 1
    
notGround:
    pop ebx
    pop edx
    ret
    
foundGround:
    mov al, 1
    pop ebx
    pop edx
    ret
CheckBelow ENDP

; ========================================
; REDRAW GROUND AT POSITION 
; ========================================
RedrawGroundAtPosition PROC
    push eax
    push edx
    
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    

    cmp inHiddenRoom, 1
    je redrawHiddenRoom

    ; Check which level we're in
    cmp currentLevel, 1
    je redrawLevel1
    cmp currentLevel, 2
    je redrawLevel2
    cmp currentLevel, 3
    je redrawLevel3


redrawHiddenRoom:
    ; Ground check
    cmp dh, 27
    jne checkHiddenPlatformsRedraw
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

checkHiddenPlatformsRedraw:
    ; Left platform: y=20, x=5-35
    cmp dh, 20
    jne checkRightPlatformRedraw
    cmp dl, 5
    jb checkExitPipeRedraw
    cmp dl, 35
    ja checkRightPlatformRedraw
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

checkRightPlatformRedraw:
    ; Right platform: y=20, x=45-75
    cmp dh, 20
    jne checkExitPipeRedraw
    cmp dl, 45
    jb checkExitPipeRedraw
    cmp dl, 75
    ja checkExitPipeRedraw
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

checkExitPipeRedraw:
    ; Exit pipe: x=70-75, y=25-26
    cmp dl, 70
    jb emptySpaceHidden
    cmp dl, 75
    ja emptySpaceHidden
    cmp dh, 25
    jb emptySpaceHidden
    cmp dh, 26
    ja emptySpaceHidden
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    cmp dh, 25
    je drawPipeTopHidden
    mov al, 219
    call WriteChar
    jmp doneRedraw

drawPipeTopHidden:
    mov al, 220
    call WriteChar
    jmp doneRedraw

emptySpaceHidden:
    mov eax, bgEmptyColor
    call SetTextColor
    mov al, ' '
    call WriteChar
    jmp doneRedraw

; ========================================
; LEVEL 1 - OVERWORLD (3 sections)
; ========================================
redrawLevel1:
    ; Ground check
    cmp dh, 27
    jne checkL1Platforms
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

checkL1Platforms:
    cmp currentSection, 1
    je redrawSec1L1
    cmp currentSection, 2
    je redrawSec2L1
    jmp redrawSec3L1

redrawSec1L1:
    ; Platform y=23, x=20-35
    cmp dh, 23
    jne s1l1p2
    cmp dl, 20
    jb s1l1p2
    cmp dl, 35
    ja s1l1p2
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s1l1p2:
    ; Platform y=20, x=40-55
    cmp dh, 20
    jne s1l1blocks
    cmp dl, 40
    jb s1l1blocks
    cmp dl, 55
    ja s1l1blocks
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s1l1blocks:
    ; ? blocks y=20, x=22,26,30
    cmp dh, 20
    jne s1l1pipe
    cmp dl, 22
    je drawQBlock
    cmp dl, 26
    je drawQBlock
    cmp dl, 30
    je drawQBlock
    jmp s1l1pipe

s1l1pipe:
    ; Pipe x=60-65, y=25-26
    cmp dl, 60
    jb emptySpace
    cmp dl, 65
    ja emptySpace
    cmp dh, 25
    jb emptySpace
    cmp dh, 26
    ja emptySpace
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    cmp dh, 25
    je drawPipeTop
    mov al, 219
    call WriteChar
    jmp doneRedraw

redrawSec2L1:
    ; Platform y=23, x=10-25
    cmp dh, 23
    jne s2l1p2
    cmp dl, 10
    jb s2l1p2
    cmp dl, 25
    ja s2l1p2
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s2l1p2:
    ; Platform y=17, x=15-35
    cmp dh, 17
    jne s2l1p3
    cmp dl, 15
    jb s2l1p3
    cmp dl, 35
    ja s2l1p3
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s2l1p3:
    ; Platform y=23, x=55-70
    cmp dh, 23
    jne s2l1blocks
    cmp dl, 55
    jb s2l1blocks
    cmp dl, 70
    ja s2l1blocks
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s2l1blocks:
    ; ? blocks y=14, x=20,25,30
    cmp dh, 14
    jne s2l1pipe
    cmp dl, 20
    je drawQBlock
    cmp dl, 25
    je drawQBlock
    cmp dl, 30
    je drawQBlock
    jmp s2l1pipe

s2l1pipe:
    ; Pipe x=40-45, y=24-26
    cmp dl, 40
    jb emptySpace
    cmp dl, 45
    ja emptySpace
    cmp dh, 24
    jb emptySpace
    cmp dh, 26
    ja emptySpace
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    cmp dh, 24
    je drawPipeTop
    mov al, 219
    call WriteChar
    jmp doneRedraw

redrawSec3L1:
    ; Platform y=23, x=10-30
    cmp dh, 23
    jne s3l1stairs
    cmp dl, 10
    jb s3l1stairs
    cmp dl, 30
    ja s3l1stairs
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l1stairs:
    ; Staircase sections
    cmp dh, 26
    jne s3l1st2
    cmp dl, 55
    jb s3l1blocks
    cmp dl, 58
    ja s3l1st2
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l1st2:
    cmp dh, 25
    jne s3l1st3
    cmp dl, 59
    jb s3l1blocks
    cmp dl, 62
    ja s3l1st3
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l1st3:
    cmp dh, 24
    jne s3l1st4
    cmp dl, 63
    jb s3l1blocks
    cmp dl, 66
    ja s3l1st4
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l1st4:
    cmp dh, 23
    jne s3l1blocks
    cmp dl, 67
    jb s3l1blocks
    cmp dl, 70
    ja s3l1blocks
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l1blocks:
    ; ? blocks y=20, x=15,20
    cmp dh, 20
    jne emptySpace
    cmp dl, 15
    je drawQBlock
    cmp dl, 20
    je drawQBlock
    jmp emptySpace

; ========================================
; LEVEL 2 - UNDERGROUND (3 sections)
; ========================================
redrawLevel2:
    ; Ground with PITS - only draw where there IS ground
    cmp dh, 27
    jne checkL2Platforms
    
    mov eax, yellow + (brown * 16)
    call SetTextColor
    
    cmp currentSection, 1
    je pitS1L2
    cmp currentSection, 2
    je pitS2L2
    jmp pitS3L2

pitS1L2:
    cmp dl, 30
    jb drawGroundL2
    cmp dl, 40
    jbe emptySpace
    jmp drawGroundL2

pitS2L2:
    cmp dl, 35
    jb drawGroundL2
    cmp dl, 48
    jbe emptySpace
    jmp drawGroundL2

pitS3L2:
    cmp dl, 25
    jb drawGroundL2
    cmp dl, 33
    jbe emptySpace
    cmp dl, 55
    jb drawGroundL2
    cmp dl, 63
    jbe emptySpace

drawGroundL2:
    mov al, '#'
    call WriteChar
    jmp doneRedraw

checkL2Platforms:
    cmp currentSection, 1
    je redrawSec1L2
    cmp currentSection, 2
    je redrawSec2L2
    jmp redrawSec3L2

redrawSec1L2:
    ; Platform y=22, x=10-20
    cmp dh, 22
    jne s1l2p2
    cmp dl, 10
    jb s1l2p2
    cmp dl, 20
    ja s1l2p2
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s1l2p2:
    ; Platform y=18, x=50-65
    cmp dh, 18
    jne s1l2movplat
    cmp dl, 50
    jb s1l2movplat
    cmp dl, 65
    ja s1l2movplat
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s1l2movplat:
    ; Moving platform
    cmp dh, movPlatY
    jne s1l2pipe
    cmp dl, movPlatX
    jb s1l2pipe
    mov al, movPlatX
    add al, movPlatLen
    cmp dl, al
    jae s1l2pipe
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s1l2pipe:
    ; Pipe x=62-67, y=25-26
    cmp dl, 62
    jb s1l2blocks
    cmp dl, 67
    ja s1l2blocks
    cmp dh, 25
    jb s1l2blocks
    cmp dh, 26
    ja s1l2blocks
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    cmp dh, 25
    je drawPipeTop
    mov al, 219
    call WriteChar
    jmp doneRedraw

s1l2blocks:
    ; ? blocks y=19, x=15,56
    cmp dh, 19
    jne emptySpace
    cmp dl, 15
    je drawQBlock
    cmp dl, 56
    je drawQBlock
    jmp emptySpace

redrawSec2L2:
    ; Platform y=23, x=10-23
    cmp dh, 23
    jne s2l2p2
    cmp dl, 10
    jb s2l2p2
    cmp dl, 23
    ja s2l2p2
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s2l2p2:
    ; Platform y=19, x=52-70
    cmp dh, 19
    jne s2l2pipe
    cmp dl, 52
    jb s2l2pipe
    cmp dl, 70
    ja s2l2pipe
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s2l2pipe:
    ; Pipe x=28-33, y=24-26
    cmp dl, 28
    jb s2l2blocks
    cmp dl, 33
    ja s2l2blocks
    cmp dh, 24
    jb s2l2blocks
    cmp dh, 26
    ja s2l2blocks
    mov eax, lightGreen + (green * 16)
    call SetTextColor
    cmp dh, 24
    je drawPipeTop
    mov al, 219
    call WriteChar
    jmp doneRedraw

s2l2blocks:
    ; ? block y=16, x=60
    cmp dh, 16
    jne emptySpace
    cmp dl, 60
    je drawQBlock
    jmp emptySpace

redrawSec3L2:
    ; Platform y=22, x=5-20
    cmp dh, 22
    jne s3l2p2
    cmp dl, 5
    jb s3l2p2
    cmp dl, 20
    ja s3l2p2
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l2p2:
    ; Platform y=20, x=68-76
    cmp dh, 20
    jne s3l2bridge
    cmp dl, 68
    jb s3l2bridge
    cmp dl, 76
    ja s3l2bridge
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l2bridge:
    ; Bridge y=24, x=35-47
    cmp dh, 24
    jne s3l2blocks
    cmp dl, 35
    jb s3l2blocks
    cmp dl, 47
    ja s3l2blocks
    mov eax, yellow + (brown * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s3l2blocks:
    ; ? blocks y=17, x=10,15
    cmp dh, 17
    jne emptySpace
    cmp dl, 10
    je drawQBlock
    cmp dl, 15
    je drawQBlock
    jmp emptySpace

; ========================================
; LEVEL 3 - SKY (3 sections)
; ========================================
redrawLevel3:
    ; Ground with LAVA
    cmp dh, 27
    jne checkL4Platforms
    
    cmp currentSection, 1
    je lavaS1L4
    jmp lavaS2L4

lavaS1L4:
    cmp dl, 28
    jb drawGroundL4
    cmp dl, 42
    jbe drawLavaL4
    jmp drawGroundL4

lavaS2L4:
    cmp dl, 38
    jb drawGroundL4
    cmp dl, 54
    jbe drawLavaL4

drawGroundL4:
    mov eax, lightGray + (gray * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

drawLavaL4:
    mov eax, yellow + (red * 16)
    call SetTextColor
    mov al, '~'
    call WriteChar
    jmp doneRedraw

checkL4Platforms:
    cmp currentSection, 1
    je redrawSec1L4
    jmp redrawSec2L4

redrawSec1L4:
    ; Platform y=23, x=8-22
    cmp dh, 23
    jne s1l4p2
    cmp dl, 8
    jb s1l4p2
    cmp dl, 22
    ja s1l4p2
    mov eax, lightGray + (gray * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s1l4p2:
    ; Platform y=20, x=48-65
    cmp dh, 20
    jne s1l4bridge
    cmp dl, 48
    jb s1l4bridge
    cmp dl, 65
    ja s1l4bridge
    mov eax, lightGray + (gray * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s1l4bridge:
    ; Bridge y=24, x=30-40
    cmp dh, 24
    jne s1l4blocks
    cmp dl, 30
    jb s1l4blocks
    cmp dl, 40
    ja s1l4blocks
    mov eax, brown + (gray * 16)
    call SetTextColor
    mov al, '='
    call WriteChar
    jmp doneRedraw

s1l4blocks:
    ; ? blocks y=17, x=54,59
    cmp dh, 17
    jne emptySpace
    cmp dl, 54
    je drawQBlock
    cmp dl, 59
    je drawQBlock
    jmp emptySpace

redrawSec2L4:
    ; Platform y=23, x=5-30
    cmp dh, 23
    jne s2l4p2
    cmp dl, 5
    jb s2l4p2
    cmp dl, 30
    ja s2l4p2
    mov eax, lightGray + (gray * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s2l4p2:
    ; Platform y=20, x=60-76
    cmp dh, 20
    jne s2l4bridge
    cmp dl, 60
    jb s2l4bridge
    cmp dl, 76
    ja s2l4bridge
    mov eax, lightGray + (gray * 16)
    call SetTextColor
    mov al, '#'
    call WriteChar
    jmp doneRedraw

s2l4bridge:
    ; Bridge y=24, x=40-52
    cmp dh, 24
    jne s2l4blocks
    cmp dl, 40
    jb s2l4blocks
    cmp dl, 52
    ja s2l4blocks
    mov eax, brown + (gray * 16)
    call SetTextColor
    mov al, '='
    call WriteChar
    jmp doneRedraw

s2l4blocks:
    ; ? blocks y=19, x=15,20
    cmp dh, 19
    jne emptySpace
    cmp dl, 15
    je drawQBlock
    cmp dl, 20
    je drawQBlock
    jmp emptySpace

; ========================================
; COMMON DRAWING ELEMENTS
; ========================================
drawQBlock:
    mov eax, white + (yellow * 16)
    call SetTextColor
    mov al, '?'
    call WriteChar
    jmp doneRedraw

drawPipeTop:
    mov al, 220
    call WriteChar
    jmp doneRedraw

emptySpace:
    mov eax, bgEmptyColor
    call SetTextColor
    mov al, ' '
    call WriteChar
    
doneRedraw:
    pop edx
    pop eax
    ret
; ========================================
; LEVEL 4 - CASTLE (2 sections)
; ========================================


RedrawGroundAtPosition ENDP



; ========================================
; UPDATE PLAYER (Erase old position)
; ========================================
UpdatePlayer PROC
    push eax
    push edx
    
    call IsSolid
    cmp al, 1
    je onSolidGround
    
    ; erase old position with plain bgAttr
    mov eax, bgAttr
    call SetTextColor
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    jmp doneErase
    
onSolidGround:
    call RedrawGroundAtPosition
    
doneErase:
    pop edx
    pop eax
    ret
UpdatePlayer ENDP

; ========================================
; DRAW PLAYER
; ========================================
DrawPlayer PROC
    push eax
    push edx

    mov dl, xPos
    mov dh, yPos
    call Gotoxy

    ; choose color based on form, but always on bgAttr
    cmp marioForm, 0
    je drawSmall
    cmp marioForm, 1
    je drawSuper

    ; Fire Mario
    mov eax, bgAttr
    add eax, white          ; white F
    call SetTextColor
    mov al, 'F'
    call WriteChar
    jmp doneDraw

drawSmall:
    mov eax, bgAttr
    add eax, red            ; red m
    call SetTextColor
    mov al, 'm'
    call WriteChar
    jmp doneDraw

drawSuper:
    mov eax, bgAttr
    add eax, red            ; red M (super)
    call SetTextColor
    mov al, 'M'
    call WriteChar

doneDraw:
    pop edx
    pop eax
    ret
DrawPlayer ENDP

; ========================================
; MOVE PLAYER LEFT
; ========================================
MovePlayerLeft PROC
    mov playerDir, 1        ; Facing left
    
    mov al, playerSpeed
    cmp al, maxSpeed
    jge speedOkL
    inc playerSpeed

speedOkL:
    mov al, xPos
    sub al, playerSpeed

    mov bl, xPos
    mov xPos, al
    call IsSolid
    mov xPos, bl
    cmp al, 1
    je doneLeft

    call UpdatePlayer
    mov bl, xPos
    sub bl, playerSpeed
    mov xPos, bl
    call DrawPlayer
    
    ; Check section transition
    call CheckSectionTransition

doneLeft:
    ret
MovePlayerLeft ENDP

; ========================================
; MOVE PLAYER RIGHT
; ========================================
MovePlayerRight PROC
    mov playerDir, 0        ; Facing right
    
    mov al, playerSpeed
    cmp al, maxSpeed
    jge speedOkR
    inc playerSpeed

speedOkR:
    mov al, xPos
    add al, playerSpeed

    mov bl, xPos
    mov xPos, al
    call IsSolid
    mov xPos, bl
    cmp al, 1
    je doneRight

    call UpdatePlayer
    mov al, xPos
    add al, playerSpeed
    mov xPos, al
    call DrawPlayer
    
    ; Check section transition
    call CheckSectionTransition

doneRight:
    ret
MovePlayerRight ENDP

; ========================================
; JUMP PLAYER
; ========================================
JumpPlayer PROC
    cmp isJumping, 1
    je alreadyJumping
    
    mov isJumping, 1
    mov jumpCounter, 8
    call PlayJumpSound
    
alreadyJumping:
    ret
JumpPlayer ENDP

; ========================================
; UPDATE JUMP PHYSICS
; ========================================
UpdateJump PROC
    cmp isJumping, 0
    je noJump
    
    cmp jumpCounter, 0
    jle endJump

    cmp jumpKeyHeld, 1
    je doMoveUp

    cmp jumpCounter, 2
    jle doMoveUp
    mov jumpCounter, 2

doMoveUp:
    call UpdatePlayer
    dec yPos
    
    call IsSolid
    cmp al, 1
    je hitCeiling
    
    call DrawPlayer
    dec jumpCounter
    jmp noJump

hitCeiling:
    call HandleBlockHit
    inc yPos
    call DrawPlayer
    mov jumpCounter, 0

endJump:
    mov isJumping, 0
    
noJump:
    ret
UpdateJump ENDP

; ========================================
; APPLY GRAVITY
; ========================================
ApplyGravity PROC
    push eax
    push ebx

    ; -------- CHECK TILE BELOW MARIO --------
    mov al, xPos        ; X coordinate
    mov ah, yPos
    inc ah              ; check yPos + 1 (tile below)
    call IsSolidAt      ; AL = 1 if solid, 0 if empty
    cmp al, 1
    je onGround         ; solid => stop falling

    ; -------- NOT ON GROUND => APPLY FALLING --------
    mov al, isJumping
    cmp al, 1
    je skipGravity      ; if jumping, do not apply extra fall

    call UpdatePlayer
    inc yPos
    call DrawPlayer
    jmp skipGravity

onGround:
    mov isJumping, 0
    mov jumpCounter, 0

skipGravity:
    pop ebx
    pop eax
    ret
ApplyGravity ENDP

; ========================================
; HANDLE BLOCK HIT - Section aware
; ========================================
HandleBlockHit PROC
    push eax
    push ebx
    push edx
    
    mov dl, xPos
    mov al, yPos
    
    ; Check which level we're in
    cmp currentLevel, 1
    je handleLevel1Blocks
    cmp currentLevel, 2
    je handleLevel2Blocks
    cmp currentLevel, 3
    je handleLevel3Blocks
    jmp doneHB
    
; ========================================
; LEVEL 1 BLOCKS (3 sections)
; ========================================
handleLevel1Blocks:
    cmp currentSection, 1
    je handleSec1L1
    cmp currentSection, 2
    je handleSec2L1
    jmp handleSec3L1

handleSec1L1:
    cmp al, 20
    jne doneHB
    cmp dl, 22
    je spawnPU
    cmp dl, 26
    je spawnPU
    cmp dl, 30
    je spawnPU
    jmp doneHB

handleSec2L1:
    cmp al, 14
    jne doneHB
    cmp dl, 20
    je spawnPU
    cmp dl, 25
    je spawnPU
    cmp dl, 30
    je spawnPU
    jmp doneHB

handleSec3L1:
    cmp al, 20
    jne doneHB
    cmp dl, 15
    je spawnPU
    cmp dl, 20
    je spawnPU
    jmp doneHB

; ========================================
; LEVEL 2 BLOCKS (Underground - 3 sections)
; ========================================
handleLevel2Blocks:
    cmp currentSection, 1
    je handleSec1L2
    cmp currentSection, 2
    je handleSec2L2
    jmp handleSec3L2

handleSec1L2:
    ; ? blocks y=19, x=15,56
    cmp al, 19
    jne doneHB
    cmp dl, 15
    je spawnPU
    cmp dl, 56
    je spawnPU
    jmp doneHB

handleSec2L2:
    ; ? block y=16, x=60
    cmp al, 16
    jne doneHB
    cmp dl, 60
    je spawnPU
    jmp doneHB

handleSec3L2:
    ; ? blocks y=17, x=10,15
    cmp al, 17
    jne doneHB
    cmp dl, 10
    je spawnPU
    cmp dl, 15
    je spawnPU
    jmp doneHB

; ========================================
; LEVEL 3 BLOCKS (Castle/Lava - 2 sections)
; ========================================
handleLevel3Blocks:
    cmp currentSection, 1
    je handleSec1L3
    jmp handleSec2L3

handleSec1L3:
    ; ? blocks y=17, x=54,59
    cmp al, 17
    jne doneHB
    cmp dl, 54
    je spawnPU
    cmp dl, 59
    je spawnPU
    jmp doneHB

handleSec2L3:
    ; ? blocks y=19, x=15,20
    cmp al, 19
    jne doneHB
    cmp dl, 15
    je spawnPU
    cmp dl, 20
    je spawnPU
    jmp doneHB

; ========================================
; SPAWN POWER-UP
; ========================================
spawnPU:
    mov bl, al
    mov bh, dl

    ; Draw hit effect
    push eax
    mov eax, gray + (yellow * 16)
    call SetTextColor
    mov dh, bl
    mov dl, bh
    call Gotoxy
    mov al, '!'
    call WriteChar
    pop eax

    ; Don't spawn if power-up already active
    cmp powerupActive, 1
    je doneHB

    mov powerupActive, 1

    ; Determine power-up type based on Mario's current form
    cmp marioForm, 0
    jne giveFlower
    mov powerupType, 1      ; Mushroom for small Mario
    jmp setPUPos

giveFlower:
    mov powerupType, 2      ; Fire Flower for Super Mario

setPUPos:
    mov powerupX, bh
    mov al, bl
    dec al                  ; Position power-up above the block
    mov powerupY, al
    call DrawPowerup

doneHB:
    pop edx
    pop ebx
    pop eax
    ret
HandleBlockHit ENDP
IsSolidAt PROC
    push ebx

    ; Save current player position
    mov bl, xPos
    mov bh, yPos

    ; Temporarily move to test position
    mov xPos, al
    mov yPos, ah

    ; Call your existing IsSolid (level + pits logic)
    call IsSolid       ; returns AL = 0/1

    ; Restore real player position
    mov xPos, bl
    mov yPos, bh

    pop ebx
    ret
IsSolidAt ENDP; ========================================
; DRAW POWER-UP
; ========================================
DrawPowerup PROC
    cmp powerupActive, 1
    jne noPU

    push eax
    push edx

    mov dl, powerupX
    mov dh, powerupY
    call Gotoxy

    cmp powerupType, 1
    je drawMushroom

    ; Fire Flower: red on bgAttr
    mov eax, bgAttr
    add eax, red
    call SetTextColor
    mov al, 'F'
    call WriteChar
    jmp endPU

drawMushroom:
    ; Mushroom: red on bgAttr too (you can change letter if you like)
    mov eax, bgAttr
    add eax, red
    call SetTextColor
    mov al, 'U'
    call WriteChar

endPU:
    pop edx
    pop eax

noPU:
    ret
DrawPowerup ENDP


; ========================================
; CHECK POWER-UP COLLECTION
; ========================================
CheckPowerupCollection PROC
    cmp powerupActive, 1
    jne noPickup

    push eax
    push edx

    mov al, xPos
    cmp al, powerupX
    jne notHere
    mov al, yPos
    cmp al, powerupY
    jne notHere

    mov powerupActive, 0

    mov eax, bgEmptyColor
    call SetTextColor
    mov dl, powerupX
    mov dh, powerupY
    call Gotoxy
    mov al, ' '
    call WriteChar

    add score, 500
    call PlayPowerUpSound
    cmp powerupType, 1
    je gotMushroom

    cmp marioForm, 0
    je notHere
    mov marioForm, 2
    jmp endPUC

gotMushroom:
    cmp marioForm, 0
    jne endPUC
    mov marioForm, 1

endPUC:
    call DrawPlayer

notHere:
    pop edx
    pop eax

noPickup:
    ret
CheckPowerupCollection ENDP

; ========================================
; DRAW COINS - Using pointers
; ========================================
DrawCoins PROC
    push eax
    push ecx
    push esi
    push edi
    push ebx
    push edx
    
    ; yellow coins on bgAttr
    mov eax, bgAttr
    add eax, yellow
    call SetTextColor
    
    movzx ecx, coinCount
    mov esi, coinXPtr
    mov edi, coinYPtr
    mov ebx, coinCollectedPtr
    
drawCoinLoop:
    cmp BYTE PTR [ebx], 1
    je skipCoin
    
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, '$'
    call WriteChar
    
skipCoin:
    inc esi
    inc edi
    inc ebx
    loop drawCoinLoop
    
    pop edx
    pop ebx
    pop edi
    pop esi
    pop ecx
    pop eax
    ret
DrawCoins ENDP


; ========================================
; CHECK COIN COLLECTION
; ========================================
CheckCoinCollection PROC
    push eax
    push ecx
    push esi
    push edi
    push ebx
    push edx
    
    movzx ecx, coinCount
    mov esi, coinXPtr
    mov edi, coinYPtr
    mov ebx, coinCollectedPtr
    
checkCoinLoop:
    mov al, [esi]
    cmp al, xPos
    jne nextCoin
    
    mov al, [edi]
    cmp al, yPos
    jne nextCoin
    
    cmp BYTE PTR [ebx], 1
    je nextCoin
    
    mov BYTE PTR [ebx], 1
    add score, 300
    call PlayCoinSound 
    inc coins

   
    
    push eax
    mov eax,  bgEmptyColor
    call SetTextColor
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, ' '
    call WriteChar
    pop eax
    
nextCoin:
    inc esi
    inc edi
    inc ebx
    loop checkCoinLoop
    
    pop edx
    pop ebx
    pop edi
    pop esi
    pop ecx
    pop eax
    ret
CheckCoinCollection ENDP

; ========================================
; USE COIN MAGNET 
; ========================================
UseCoinMagnet PROC
    ; Check if we have charges left
    cmp magnetCharges, 0
    je noMagnetCharges
    
    ; Use one charge
    dec magnetCharges
    
    ; Play sound
    call PlayPowerUpSound
    
    ; Collect coins in radius
    movzx ecx, coinCount
    mov esi, coinXPtr
    mov edi, coinYPtr
    mov ebx, coinCollectedPtr
    
collectLoop:
    cmp BYTE PTR [ebx], 1
    je skipCoin
    
    ; Check if coin is near player (simple box check)
    mov al, [esi]      ; coin X
    sub al, xPos       ; distance X
    jns positiveX
    neg al
positiveX:
    cmp al, 10         ; 10 tile radius
    ja skipCoin
    
    mov dl, [edi]      ; coin Y
    sub dl, yPos       ; distance Y
    jns positiveY
    neg dl
positiveY:
    cmp dl, 10         ; 10 tile radius
    ja skipCoin
    
    ; Collect coin
    mov BYTE PTR [ebx], 1
    add score, 300
    
    inc coins
    call PlayCoinSound
    ; Erase coin
    push eax
    mov eax, bgEmptyColor
    call SetTextColor
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, ' '
    call WriteChar
    pop eax
    
skipCoin:
    inc esi
    inc edi
    inc ebx
    loop collectLoop
    
    ; Update HUD
    call DrawHUD
    
noMagnetCharges:
    ret
UseCoinMagnet ENDP


; ========================================
; DRAW ENEMIES
; ========================================
DrawEnemies PROC
    push eax
    push ecx
    push esi
    push edi
    push ebx
    push edx

    ; decide by currentLevel
    cmp currentLevel, 1
    je drawLevel1Enemies
    cmp currentLevel, 2
    je drawLevel2Enemies
    cmp currentLevel, 3
    je drawLevel3Enemies
    jmp doneDrawEnemies

; ---------- LEVEL 1: Goombas ----------
drawLevel1Enemies:
    mov eax, bgAttr
    add eax, brown
    call SetTextColor

    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr

drawL1Loop:
    cmp BYTE PTR [ebx], 0
    je skipL1Enemy

    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, 'G'
    call WriteChar

skipL1Enemy:
    inc esi
    inc edi
    inc ebx
    loop drawL1Loop
    jmp doneDrawEnemies

; ---------- LEVEL 2: Koopas ----------
drawLevel2Enemies:
    mov eax, bgAttr
    add eax, brown
    call SetTextColor

    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr

drawL2Loop:
    cmp BYTE PTR [ebx], 0
    je skipL2Enemy

    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, 'K'
    call WriteChar

skipL2Enemy:
    inc esi
    inc edi
    inc ebx
    loop drawL2Loop
    jmp doneDrawEnemies

; ---------- LEVEL 3: Flying enemies + BOSS ----------
drawLevel3Enemies:
    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr
    
    xor edx, edx
drawL3Loop:
    inc edx
    
    cmp BYTE PTR [ebx], 0
    je skipL3Enemy

    push edx
    push ecx
    
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    
    pop ecx
    pop edx
    
    ; Check if this is the boss (enemy #5 in section 2)
    cmp currentSection, 2
    jne drawNormalL3Enemy
    cmp edx, 5
    je drawBossChar

drawNormalL3Enemy:
    push eax
    mov eax, bgAttr
    add eax, brown
    call SetTextColor
    mov al, 'F'
    call WriteChar
    pop eax
    jmp skipL3Enemy

drawBossChar:
    push eax
    mov eax, lightRed + (gray * 16)
    call SetTextColor
    mov al, 'B'
    call WriteChar
    pop eax

skipL3Enemy:
    inc esi
    inc edi
    inc ebx
    loop drawL3Loop

doneDrawEnemies:
    pop edx
    pop ebx
    pop edi
    pop esi
    pop ecx
    pop eax
    ret
DrawEnemies ENDP

; ========================================
; UPDATE ENEMIES - per level behaviour
; ========================================
UpdateEnemies PROC
    push eax
    push ecx
    push esi
    push edi
    push ebx
    push edx

    cmp currentLevel, 1
    je updateLevel1Enemies
    cmp currentLevel, 2
    je updateLevel2Koopas
    cmp currentLevel, 3
    je updateLevel3Enemies
    jmp doneUpdateEnemies

; ---------- LEVEL 1: Goombas ----------
updateLevel1Enemies:
    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr
    mov edx, enemyDirPtr

updateL1Loop:
    cmp BYTE PTR [ebx], 0
    je skipL1Update

    push eax
    push edx
    mov al, xPos
    mov ah, yPos
    mov dl, [esi]
    mov dh, [edi]
    mov xPos, dl
    mov yPos, dh
    call RedrawGroundAtPosition
    mov xPos, al
    mov yPos, ah
    pop edx
    pop eax

    cmp BYTE PTR [edx], 0
    je l1MoveLeft

    inc BYTE PTR [esi]
    cmp BYTE PTR [esi], 75
    jl l1DrawEnemyNow
    mov BYTE PTR [edx], 0
    jmp l1DrawEnemyNow

l1MoveLeft:
    dec BYTE PTR [esi]
    cmp BYTE PTR [esi], 2
    jg l1DrawEnemyNow
    mov BYTE PTR [edx], 1

l1DrawEnemyNow:
    push eax
    mov eax, bgAttr
    add eax, brown
    call SetTextColor
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, 'G'
    call WriteChar
    pop edx
    pop eax

skipL1Update:
    inc esi
    inc edi
    inc ebx
    inc edx
    loop updateL1Loop
    jmp doneUpdateEnemies

; ---------- LEVEL 2: Koopas ----------
updateLevel2Koopas:
    movzx ecx, enemyCount
    cmp ecx, 0
    je doneUpdateEnemies              ; No enemies, exit early
    
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr
    mov edx, enemyDirPtr
    
    mov BYTE PTR [buffer], 0          ; Loop counter

updateL2Loop:
    cmp BYTE PTR [ebx], 0
    jne processL2Enemy
    jmp skipL2Update

processL2Enemy:
    ; Get current enemy state
    push eax
    push ecx
    movzx eax, BYTE PTR [buffer]
    mov ecx, OFFSET lvl2KoopaState
    add ecx, eax
    mov ah, BYTE PTR [ecx]            ; ah = state (0=walk, 1=shell)
    pop ecx
    
    ; Erase old position
    push eax
    push edx
    mov al, xPos
    mov ah, yPos
    mov dl, [esi]
    mov dh, [edi]
    mov xPos, dl
    mov yPos, dh
    call RedrawGroundAtPosition
    mov xPos, al
    mov yPos, ah
    pop edx
    pop eax

    cmp ah, 1
    je l2MoveShellFast

    ; ===== WALKING KOOPA =====
    cmp BYTE PTR [edx], 0
    je l2WalkLeft

l2WalkRight:
    inc BYTE PTR [esi]
    cmp BYTE PTR [esi], 75
    jge l2TurnLeft
    jmp l2DrawKoopa

l2TurnLeft:
    mov BYTE PTR [edx], 0
    jmp l2DrawKoopa

l2WalkLeft:
    dec BYTE PTR [esi]
    cmp BYTE PTR [esi], 2
    jle l2TurnRight
    jmp l2DrawKoopa

l2TurnRight:
    mov BYTE PTR [edx], 1

l2DrawKoopa:
    push eax
    mov eax, bgAttr
    add eax, lightGreen
    call SetTextColor
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, 'K'
    call WriteChar
    pop edx
    pop eax
    pop eax                           ; Pop the state eax
    jmp skipL2Update

    ; ===== SLIDING SHELL =====
l2MoveShellFast:
    cmp BYTE PTR [edx], 0
    je l2ShellLeft

l2ShellRight:
    add BYTE PTR [esi], 2
    cmp BYTE PTR [esi], 75
    jge l2ShellTurnLeft
    jmp l2DrawShell

l2ShellTurnLeft:
    mov BYTE PTR [edx], 0
    jmp l2DrawShell

l2ShellLeft:
    sub BYTE PTR [esi], 2
    cmp BYTE PTR [esi], 2
    jle l2ShellTurnRight
    jmp l2DrawShell

l2ShellTurnRight:
    mov BYTE PTR [edx], 1

l2DrawShell:
    push eax
    mov eax, bgAttr
    add eax, lightRed
    call SetTextColor
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, '@'
    call WriteChar
    pop edx
    pop eax
    pop eax                           ; Pop the state eax

skipL2Update:
    inc esi
    inc edi
    inc ebx
    inc edx
    inc BYTE PTR [buffer]
    dec ecx
    cmp ecx, 0
    jg updateL2Loop
    jmp doneUpdateEnemies

; ---------- LEVEL 3: Flying enemies + BOSS ----------
updateLevel3Enemies:
    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr
    mov edx, enemyDirPtr

updateL3Loop:
    cmp BYTE PTR [ebx], 0
    je skipL3Update

    push eax
    movzx eax, enemyCount
    sub eax, ecx
    inc eax
    
    cmp currentSection, 2
    jne normalFlyingEnemy
    cmp eax, 5
    je updateBoss

normalFlyingEnemy:
    pop eax
    
    push eax
    push edx
    mov al, xPos
    mov ah, yPos
    mov dl, [esi]
    mov dh, [edi]
    mov xPos, dl
    mov yPos, dh
    call RedrawGroundAtPosition
    mov xPos, al
    mov yPos, ah
    pop edx
    pop eax

    cmp BYTE PTR [edx], 0
    je l3MoveUp

    inc BYTE PTR [edi]
    cmp BYTE PTR [edi], 20
    jle l3DrawEnemyNow
    mov BYTE PTR [edx], 0
    jmp l3DrawEnemyNow

l3MoveUp:
    dec BYTE PTR [edi]
    cmp BYTE PTR [edi], 10
    jge l3DrawEnemyNow
    mov BYTE PTR [edx], 1

l3DrawEnemyNow:
    push eax
    mov eax, bgAttr
    add eax, lightRed
    call SetTextColor
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, 'F'
    call WriteChar
    pop edx
    pop eax
    jmp skipL3Update

; ===============================================================
; ============ SLOWER FLYING BOSS - EASIER TO STOMP =============
; ===============================================================
updateBoss:
    pop eax

    ; ========== ERASE OLD BOSS POSITION ==========
    push eax
    push edx
    mov al, xPos
    mov ah, yPos
    mov dl, [esi]
    mov dh, [edi]
    mov xPos, dl
    mov yPos, dh
    call RedrawGroundAtPosition
    mov xPos, al
    mov yPos, ah
    pop edx
    pop eax

    ; ========== MOVEMENT DELAY - ONLY MOVE EVERY OTHER FRAME ==========
    call Random32
    and eax, 1           ; 50% chance to move this frame
    cmp eax, 0
    je drawBossNow       ; Skip movement this frame

    ; ========== HORIZONTAL CHASE (SLOWER) ==========
    mov al, [esi]        ; Boss X
    mov bl, xPos         ; Player X

    cmp bl, al
    je bossCheckVertical
    jg bossMoveRight
    jmp bossMoveLeft

bossMoveLeft:
    dec BYTE PTR [esi]
    mov al, [esi]
    cmp al, 2
    jge bossCheckVertical
    mov BYTE PTR [esi], 2
    jmp bossCheckVertical

bossMoveRight:
    inc BYTE PTR [esi]
    mov al, [esi]
    cmp al, 78
    jle bossCheckVertical
    mov BYTE PTR [esi], 78

    ; ========== VERTICAL CHASE - SLOWER ==========
bossCheckVertical:
    mov al, [edi]        ; Boss Y
    mov bl, yPos         ; Player Y

    sub bl, al
    cmp bl, 0
    je bossOptionalJump
    jg bossMoveDown
    jmp bossMoveUp

bossMoveUp:
    dec BYTE PTR [edi]
    mov al, [edi]
    cmp al, 3
    jge bossOptionalJump
    mov BYTE PTR [edi], 3
    jmp bossOptionalJump

bossMoveDown:
    inc BYTE PTR [edi]
    mov al, [edi]
    cmp al, 26
    jle bossOptionalJump
    mov BYTE PTR [edi], 26

    ; ========== OCCASIONAL RANDOM JUMP ==========
bossOptionalJump:
    call Random32
    and eax, 127
    cmp eax, 1
    jne drawBossNow
    
    call Random32
    and eax, 1
    cmp eax, 0
    je bossRandomUp
    
    mov al, [edi]
    add al, 2
    cmp al, 26
    jle bossSetRandomPos
    mov al, 26
    jmp bossSetRandomPos

bossRandomUp:
    mov al, [edi]
    sub al, 2
    cmp al, 3
    jge bossSetRandomPos
    mov al, 3

bossSetRandomPos:
    mov [edi], al

drawBossNow:
    push eax
    push edx
    mov eax, lightRed + (gray * 16)
    call SetTextColor
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, 'B'
    call WriteChar
    pop edx
    pop eax

skipL3Update:
    inc esi
    inc edi
    inc ebx
    inc edx
    dec ecx
    cmp ecx, 0
    jg updateL3Loop

doneUpdateEnemies:
    pop edx
    pop ebx
    pop edi
    pop esi
    pop ecx
    pop eax
    ret
UpdateEnemies ENDP

Boss proc

cmp currentlevel, 3
jz noskip
cmp currentSection, 2
jz noskip





noskip:


Boss endp

CheckEnemyCollision PROC
    push eax
    push ecx
    push esi
    push edi
    push ebx
    push edx
    
    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr
    
    ; Check if Level 2 for Koopa logic
    cmp currentLevel, 2
    je checkKoopaCollision
    jmp checkNormalCollision

; ========== KOOPA COLLISION LEVEL 2 ==========
checkKoopaCollision:
    push OFFSET lvl2KoopaState
    pop edx                         ; edx = state pointer

checkKoopaLoop:
    cmp BYTE PTR [ebx], 0
    je nextKoopa

    ; --- check for stomp: player one row above enemy ---
    mov al, [esi]
    cmp al, xPos
    jne checkKoopaBody

    mov al, [edi]
    dec al
    mov ah, yPos
    cmp ah, al
    jne checkKoopaBody

    ; ======= STOMP ON KOOPA =======
    ; Check current state
    cmp BYTE PTR [edx], 0           ; Is it walking?
    jne stompedShell

    ; Walking Koopa ->becomes shell
    mov BYTE PTR [edx], 1           ; Change to shell state
    add score, 100
    
    ; Bounce player
    mov isJumping, 1
    mov jumpCounter, 3
    jmp nextKoopa

stompedShell:
    ; Shell stomped -> kill it

    mov BYTE PTR [ebx], 0
    add score, 200
    call PlayStompSound
    inc enemiesDefeated
    
    ; Erase the shell
    push eax
    mov al, xPos
    mov ah, yPos
    mov cl, [esi]
    mov ch, [edi]
    mov xPos, cl
    mov yPos, ch
    call RedrawGroundAtPosition
    mov xPos, al
    mov yPos, ah
    pop eax
    
    mov isJumping, 1
    mov jumpCounter, 3
    jmp nextKoopa

checkKoopaBody:
    ; Side hit
    mov al, [esi]
    cmp al, xPos
    jne nextKoopa
    mov al, [edi]
    cmp al, yPos
    jne nextKoopa

    ; Check if it's a shell
    cmp BYTE PTR [edx], 1
    je hitShell

    ; Hit walking Koopa take damage
    jmp takeDamage

hitShell:
    ; Hit a shell - just bounce off (or you could kick it later)
    jmp takeDamage

nextKoopa:
    inc esi
    inc edi
    inc ebx
    inc edx
    dec ecx
    cmp ecx, 0
    jg checkKoopaLoop

    pop edx
    pop ebx
    pop edi
    pop esi
    pop ecx
    pop eax
    ret

; ========== NORMAL COLLISION (Level 1 & 3) ==========
checkNormalCollision:
checkEnemyLoop:
    cmp BYTE PTR [ebx], 0
    je nextEnemy

    ; --- check for stomp ---
    mov al, [esi]
    cmp al, xPos
    jne checkBodyCollision

    mov al, [edi]
    dec al
    mov dl, yPos
    cmp dl, al
    jne checkBodyCollision

    ; ======= STOMP KILL =======
   push eax
    movzx eax, enemyCount
    sub eax, ecx
    inc eax         ; Get current enemy number
    
    cmp currentLevel, 3
    jne normalStompKill
    cmp currentSection, 2
    jne normalStompKill
    cmp eax, 5
    je stompBoss

normalStompKill:
    pop eax
    mov BYTE PTR [ebx], 0
    add score, 200
    call PlayStompSound
    inc enemiesDefeated
    jmp continueAfterStomp

stompBoss:
    pop eax
    ; Damage boss
    dec bossHealth
    add score, 100
    call PlayStompSound
    
    ; Check if boss died
    cmp bossHealth, 0
    jg continueAfterStomp
    
    ; Boss defeated!
    mov BYTE PTR [ebx], 0
    add score, 1000
    inc enemiesDefeated

continueAfterStomp:

    ; Erase enemy
    push eax
    push edx
    mov al, xPos
    mov ah, yPos
    mov dl, [esi]
    mov dh, [edi]
    mov xPos, dl
    mov yPos, dh
    call RedrawGroundAtPosition
    mov xPos, al
    mov yPos, ah
    pop edx
    pop eax

    mov isJumping, 1
    mov jumpCounter, 3
    jmp nextEnemy

checkBodyCollision:
    mov al, [esi]
    cmp al, xPos
    jne nextEnemy
    mov al, [edi]
    cmp al, yPos
    jne nextEnemy

takeDamage:
    ; ======= BODY HIT - TAKE DAMAGE =======
    cmp marioForm, 0
    je smallHit

    cmp marioForm, 2
    jne poweredWasSuper
    mov marioForm, 1
    jmp doneDamage

poweredWasSuper:
    mov marioForm, 0

doneDamage:
    call DrawPlayer
    jmp nextEnemy

smallHit:
    dec lives
    call PlayDeathSound
    mov marioForm, 0
    mov xPos, 5
    mov yPos, 26
    mov isJumping, 0
    call DrawPlayer

nextEnemy:
    inc esi
    inc edi
    inc ebx
    dec ecx
    cmp ecx,0
    jg checkEnemyLoop
    pop edx
    pop ebx
    pop edi
    pop esi
    pop ecx
    pop eax
    ret
CheckEnemyCollision ENDP
; ========================================
; CHECK FLAGPOLE
; ========================================

CheckFlagpole PROC
    push eax
    push ebx
    
    ; Check if we're at a flagpole section
    cmp currentLevel, 1
    je checkLevel1Flagpole
    cmp currentLevel, 2
    je checkLevel2Flagpole       ; 
    cmp currentLevel, 3
    je checkLevel3Flagpole
    jmp notAtFlag

checkLevel1Flagpole:
    cmp currentSection, 3
    jne notAtFlag
    jmp checkFlagPosition

; ---------- NEW: Level 2 flagpole ----------
checkLevel2Flagpole:
    cmp currentSection, 3        ; change this if your lvl2 flag is in another section
    jne notAtFlag
    jmp checkFlagPosition

checkLevel3Flagpole:
    cmp currentSection, 2
    jne notAtFlag
    ; fall through to flag position check

checkFlagPosition:
    movzx eax, flagX
    movzx ebx, xPos
    sub eax, ebx
    cmp eax, 2
    jg notAtFlag
    cmp eax, -2
    jl notAtFlag
    
    ; we’re close enough to the flag
    mov levelComplete, 1
    
    ; bonus score based on height on pole
    mov al, 27
    sub al, yPos
    movzx eax, al
    mov ebx, 100
    mul ebx
    add score, eax
    
notAtFlag:
    pop ebx
    pop eax
    ret
CheckFlagpole ENDP
; ========================================
; SHOOT FIREBALL
; ========================================
ShootFireball PROC
    push eax
    push edx

    cmp marioForm, 2
    jne cantShoot

    cmp fireball1Active, 0
    jne tryFireball2

    mov fireball1Active, 1
    mov al, xPos
    
    cmp playerDir, 0
    je fb1GoRight
    mov fireball1Dir, 0
    dec al
    jmp setFB1Pos

fb1GoRight:
    mov fireball1Dir, 1
    inc al

setFB1Pos:
    mov fireball1X, al
    mov al, yPos
    mov fireball1Y, al
    jmp cantShoot

tryFireball2:
    cmp fireball2Active, 0
    jne cantShoot

    mov fireball2Active, 1
    mov al, xPos
    
    cmp playerDir, 0
    je fb2GoRight
    mov fireball2Dir, 0
    dec al
    jmp setFB2Pos

fb2GoRight:
    mov fireball2Dir, 1
    inc al

setFB2Pos:
    mov fireball2X, al
    mov al, yPos
    mov fireball2Y, al

cantShoot:
    pop edx
    pop eax
    ret
ShootFireball ENDP

; ========================================
; UPDATE FIREBALLS
; ========================================

UpdateFireballs PROC
    push eax
    push ebx
    push ecx
    push edx

    cmp fireball1Active, 0
    je updateFB2

    mov eax, bgEmptyColor
    call SetTextColor
    mov dl, fireball1X
    mov dh, fireball1Y
    call Gotoxy
    mov al, ' '
    call WriteChar

    cmp fireball1Dir, 1
    jne fb1MoveLeft
    
    inc fireball1X
    cmp fireball1X, 79
    jge deactivateFB1
    jmp fb1CheckCollision

fb1MoveLeft:
    dec fireball1X
    cmp fireball1X, 1
    jle deactivateFB1

fb1CheckCollision:
    mov al, fireball1X
    mov ah, fireball1Y
    mov bl, xPos
    mov bh, yPos
    mov xPos, al
    mov yPos, ah
    call IsSolid
    mov xPos, bl
    mov yPos, bh
    cmp al, 1
    je deactivateFB1

    call CheckFireballEnemyHit1
    cmp al, 1
    je deactivateFB1

    mov al, fireball1Y
    inc al
    mov bl, xPos
    mov bh, yPos
    mov cl, fireball1X
    mov xPos, cl
  
    mov yPos, al
    push eax
    call IsSolid
    mov xPos, bl
    mov yPos, bh
    cmp al, 1
    pop eax
    je updateFB2
    
    mov fireball1Y, al
    jmp updateFB2

deactivateFB1:
    mov fireball1Active, 0

updateFB2:
    cmp fireball2Active, 0
    je doneUpdateFB

    mov eax,   bgAttr
    call SetTextColor
    mov dl, fireball2X
    mov dh, fireball2Y
    call Gotoxy
    mov al, ' '
    call WriteChar

    cmp fireball2Dir, 1
    jne fb2MoveLeft
    
    inc fireball2X
    cmp fireball2X, 79
    jge deactivateFB2
    jmp fb2CheckCollision

fb2MoveLeft:
    dec fireball2X
    cmp fireball2X, 1
    jle deactivateFB2

fb2CheckCollision:
    mov al, fireball2X
    mov ah, fireball2Y
    mov bl, xPos
    mov bh, yPos
    mov xPos, al
    mov yPos, ah
    call IsSolid
    mov xPos, bl
    mov yPos, bh
    cmp al, 1
    je deactivateFB2

    call CheckFireballEnemyHit2
    cmp al, 1
    je deactivateFB2

    mov al, fireball2Y
    inc al
    mov bl, xPos
    mov bh, yPos
    mov cl, fireball2X
    mov xPos, cl
    mov yPos, al
    push eax
    call IsSolid
    mov xPos, bl
    mov yPos, bh
    cmp al, 1
    pop eax
    je doneUpdateFB
    
    mov fireball2Y, al
    jmp doneUpdateFB

deactivateFB2:
    mov fireball2Active, 0

doneUpdateFB:
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
UpdateFireballs ENDP

; ========================================
; CHECK FIREBALL 1 ENEMY HIT
; ========================================
CheckFireballEnemyHit1 PROC
    push ecx
    push esi
    push edi
    push ebx

    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr

checkFB1Loop:
    cmp BYTE PTR [ebx], 0
    je nextFB1Enemy

    mov al, [esi]
    cmp al, fireball1X
    jne nextFB1Enemy
    mov al, [edi]
    cmp al, fireball1Y
    jne nextFB1Enemy

    mov BYTE PTR [ebx], 0
    add score, 200
    call PlayStompSound
    inc enemiesDefeated

    push eax
    mov eax, bgEmptyColor
    call SetTextColor
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, ' '
    call WriteChar
    pop eax

    mov al, 1
    jmp doneFB1Check

nextFB1Enemy:
    inc esi
    inc edi
    inc ebx
    dec ecx
    jnz checkFB1Loop
    mov al, 0

doneFB1Check:
    pop ebx
    pop edi

    pop esi
    pop ecx
    ret
CheckFireballEnemyHit1 ENDP

; ========================================
; CHECK FIREBALL
; ========================================
CheckFireballEnemyHit2 PROC
    push ecx
    push esi
    push edi
    push ebx

    movzx ecx, enemyCount
    mov esi, enemyXPtr
    mov edi, enemyYPtr
    mov ebx, enemyActivePtr

checkFB2Loop:
    cmp BYTE PTR [ebx], 0
    je nextFB2Enemy

    mov al, [esi]
    cmp al, fireball2X
    jne nextFB2Enemy
    mov al, [edi]
    cmp al, fireball2Y
    jne nextFB2Enemy

    mov BYTE PTR [ebx], 0
    add score, 200
    call PlayStompSound
    inc enemiesDefeated

    push eax
    mov eax, bgEmptyColor
    call SetTextColor
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov al, ' '
    call WriteChar
    pop eax

    mov al, 1
    jmp doneFB2Check

nextFB2Enemy:
    inc esi
    inc edi
    inc ebx
    dec ecx
    jnz checkFB2Loop
    mov al, 0

doneFB2Check:
    pop ebx
    pop edi
    pop esi
    pop ecx
    ret
CheckFireballEnemyHit2 ENDP

; ========================================
; DRAW FIREBALLS
; ========================================
DrawFireballs PROC
    push eax
    push edx

    ; fireballs: red on bgAttr
    cmp fireball1Active, 0
    je drawFB2

    mov eax, bgAttr
    add eax, red
    call SetTextColor
    mov dl, fireball1X
    mov dh, fireball1Y
    call Gotoxy
    mov al, 'o'
    call WriteChar

drawFB2:
    cmp fireball2Active, 0
    je doneFBDraw

    mov eax, bgAttr
    add eax, red
    call SetTextColor
    mov dl, fireball2X
    mov dh, fireball2Y
    call Gotoxy
    mov al, 'o'
    call WriteChar

doneFBDraw:
    pop edx
    pop eax
    ret

DrawFireballs ENDP


; ========================================
; PAUSE SCREEN
; ========================================
ShowPauseScreen PROC
    mov eax, yellow + (black * 16)
    call SetTextColor
    
    mov dh, 12
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET pauseTitle
    call WriteString
    
    mov eax, white + (black * 16)
    call SetTextColor
    
    mov dh, 14
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET pauseOpt1
    call WriteString
    
    mov dh, 15
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET pauseOpt2
    call WriteString
    
pauseLoop:
    call ReadChar
    cmp al, 'r'
    je resumeGame
    cmp al, 'R'
    je resumeGame
    cmp al, 'x'
    je exitToMenu
    cmp al, 'X'
    je exitToMenu
    jmp pauseLoop

resumeGame:
    mov al, 0
    ret

exitToMenu:
    mov al, 1
    ret
ShowPauseScreen ENDP

; ========================================
; LEVEL COMPLETE SCREEN
; ========================================
ShowLevelCompleteScreen PROC

    call Clrscr
    
    mov eax, gameTime
    mov ebx, 50
    mul ebx
    push eax
    
    mov ecx, 3
fireworksLoop:
    push ecx
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov dh, 5
    mov dl, 22
    call Gotoxy
    mov edx, OFFSET completeFireworks
    call WriteString
    mov eax, 300
    call Delay
    mov eax, black + (black * 16)
    call SetTextColor
    mov dh, 5
    mov dl, 22
    call Gotoxy
    mov edx, OFFSET completeFireworks
    call WriteString
    mov eax, 200
    call Delay
    pop ecx
    loop fireworksLoop
    
    mov eax, red + (black * 16)
    call SetTextColor
    mov dh, 8
    mov dl, 28
    call Gotoxy
    mov edx, OFFSET completeTitle
    call WriteString
    
    mov eax, white + (black * 16)
    call SetTextColor
    
    mov dh, 11
    mov dl, 26
    call Gotoxy
    mov edx, OFFSET completeMsg1
    call WriteString
    movzx eax, coins
    call WriteDec
    
    mov dh, 12
    mov dl, 26
    call Gotoxy
    mov edx, OFFSET completeMsg2
    call WriteString
    movzx eax, enemiesDefeated
    call WriteDec
    
    mov dh, 13
    mov dl, 26
    call Gotoxy
    mov edx, OFFSET completeMsg3
    call WriteString
    mov eax, gameTime
    call WriteDec
    
    mov eax, green + (black * 16)
    call SetTextColor
    mov dh, 14
    mov dl, 26
    call Gotoxy
    mov edx, OFFSET completeMsg4
    call WriteString
    pop eax
    push eax
    call WriteDec
    
    pop eax
    add score, eax
    
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov dh, 17
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET completeFinal
    call WriteString
    mov eax, score
    call WriteDec
    
    mov eax, white + (black * 16)
    call SetTextColor
    mov dh, 22
    mov dl, 20
    call Gotoxy
    mov edx, OFFSET completeContinue
    call WriteString
    
    call ReadChar
    ret
ShowLevelCompleteScreen ENDP

; ========================================
; GAME OVER SCREEN
; ========================================
ShowGameOverScreen PROC

    call Clrscr
    
    mov eax, red + (black * 16)
    call SetTextColor
    
    mov dh, 10
    mov dl, 32
    call Gotoxy
    mov edx, OFFSET gameOverTitle
    call WriteString
    
    mov eax, white + (black * 16)
    call SetTextColor
    
    mov dh, 13
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET gameOverScore
    call WriteString
    mov eax, score
    call WriteDec
    
    mov dh, 16
    mov dl, 27
    call Gotoxy
    mov edx, OFFSET gameOverMsg
    call WriteString
    
    mov dh, 20
    mov dl, 20
    call Gotoxy
    mov edx, OFFSET completeContinue
    call WriteString
    
    call ReadChar
    ret
ShowGameOverScreen ENDP

DrawBush Proc
    cmp currentLevel,1
    jg endd
    cmp currentSection,1
    jg endd
    ; Set bush color (green shades)
    mov eax, green + (black * 16)
    call SetTextColor
    
    ; Row 1: Top of bush
    mov dh, 24
    mov dl, 5
    call Gotoxy
    mov al, 177  ; Light shade
    call WriteChar
    mov al, 176  ; Medium shade  
    call WriteChar
    mov al, 178  ; Dark shade
    call WriteChar
    
    ; Row 2: Middle of bush
    pop edx      ; Restore original position
    push edx
    add dh, 1    ; Next row
    call Gotoxy
    mov al, 178
    call WriteChar
    mov al, 219  ; Full block
    call WriteChar
    mov al, 177
    call WriteChar
    
    ; Row 3: Bottom of bush
    pop edx
    add dh, 2
    call Gotoxy
    mov al, 176
    call WriteChar
    mov al, 177
    call WriteChar
    mov al, 178
    call WriteChar
 endd:   
    ret
DrawBush ENDP
; ========================================
; GAME LOOP
; ========================================
GameLoop PROC

    cmp currentLevel, 1
    je playMusic1
    cmp currentLevel, 2
    je playMusic2
    cmp currentLevel, 3
    je playMusic3
    jmp skipMusic
    playMusic1:
;        call PlayLevel1Music
        jmp skipMusic
    playMusic2:
 ;       call PlayLevel2Music
        jmp skipMusic
    playMusic3:
  ;   call PlayLevel3Music
    skipMusic:



    call Clrscr
    call DrawSkyBackground
    call DrawClouds
    ;call DrawBush
    call DrawHUD
    call DrawLevel
    call DrawCoins
    call DrawEnemies

    ; Draw flagpole only in section 3
    cmp currentSection, 3
    jne skipFlagStart
    call DrawFlagpole
skipFlagStart:
    call DrawPlayer
    call DrawPowerup


gameLoopMain:
    cmp levelComplete, 1
    je endLevel
    
    call UpdateTimer
    
    cmp gameTime, 0
    jle gameOver
    
    call CheckCoinCollection
    call CheckPowerupCollection
    call CheckEnemyCollision

    call CheckFlagpole
    call checkfalldeath
    call CheckHiddenPipe 
    cmp lives, 0
    jle showGameOver

    call UpdateJump
    call ApplyGravity
    call CheckLavaDeath  ; This checks if player fell in lava in Level 4
    call UpdateFireballs
    call updatemovingplatforms

    call DrawHUD
    call UpdateEnemies

    call DrawFireballs
    
    mov eax, 50
    call Delay
    
    call ReadKey
    jz noInput

    mov inputChar, al
    mov jumpKeyHeld, 0

    cmp inputChar, 'x'
    je exitGame
    cmp inputChar, 'X'
    je exitGame
    
    cmp inputChar, 'p'
    je pauseGame
    cmp inputChar, 'P'
    je pauseGame
    
    cmp inputChar, 'a'
    je moveL
    cmp inputChar, 'A'
    je moveL
    
    cmp inputChar, 'd'
    je moveR
    cmp inputChar, 'D'
    je moveR
    
    cmp inputChar, 'w'
    je handleW
    cmp inputChar, 'W'
    je handleW
    
    cmp inputChar, 'f'
    je shootFire
    cmp inputChar, 'F'
    je shootFire
    cmp inputChar, ' '
    je shootFire
    
    


     cmp inputChar, 'm'
    je useMagnet
    cmp inputChar, 'M'
    je useMagnet

    jmp noInput


handleW:
    mov jumpKeyHeld, 1
    jmp jump
useMagnet:              
call UseCoinMagnet
    jmp gameLoopMain


pauseGame:
    call ShowPauseScreen
    cmp al, 1
    je exitGame
    call Clrscr
    call DrawSkyBackground
    call DrawClouds
    call DrawHUD
    call DrawLevel
    call DrawCoins
    call DrawEnemies
    cmp currentSection, 3
    jne skipFlagPause
    call DrawFlagpole
skipFlagPause:
    call DrawPlayer
    call DrawPowerup
    call DrawFireballs
    call GetMseconds
    mov lastTime, eax
    jmp gameLoopMain

moveL:
    call MovePlayerLeft
    jmp gameLoopMain

moveR:
    call MovePlayerRight
    jmp gameLoopMain

jump:
    call JumpPlayer
    jmp gameLoopMain

shootFire:
    call ShootFireball
    jmp gameLoopMain

noInput:
    mov jumpKeyHeld, 0
    cmp playerSpeed, 0
    jle gameLoopMain
    dec playerSpeed
    jmp gameLoopMain

endLevel:
    ; Check if we should go to next level
    mov al, currentLevel
    cmp al, maxLevel           ; maxLevel = 4
    jge allLevelsBeaten        ; If already at level 4, you beat the game!
    
    ; Move to next level
    inc currentLevel
    mov currentSection, 1
    mov levelComplete, 0
    
    ; Reset player stats for new level (keep score and lives!)
    mov xPos, 5
    mov yPos, 26
    mov playerDir, 0
    mov isJumping, 0
    mov jumpCounter, 0
    mov playerSpeed, 0
    mov marioForm, 0           ; Reset to small Mario
    mov powerupActive, 0
    mov fireball1Active, 0
    mov fireball2Active, 0
    mov enemiesDefeated, 0
    mov coins, 0               ; Reset coins for new level
    mov gameTime, 400          ; Reset timer
    
    ; Load the new level data
    call LoadLevelData
    
    ; Reset level-specific coin/enemy data based on new level
    cmp currentLevel, 2
    je resetLevel2
    cmp currentLevel, 3
    je resetLevel3
    jmp startNewLevel

resetLevel2:
    ; Reset level 2 coins
    mov ecx, 5
    mov esi, OFFSET lvl2CoinCollected
resetL2Coins:
    mov BYTE PTR [esi], 0
    inc esi
    loop resetL2Coins
    
    ; Reset level 2 enemies
    mov BYTE PTR lvl2EnemyX[0], 25
    mov BYTE PTR lvl2EnemyX[1], 45
    mov BYTE PTR lvl2EnemyX[2], 65
    mov BYTE PTR lvl2EnemyActive[0], 1
    mov BYTE PTR lvl2EnemyActive[1], 1
    mov BYTE PTR lvl2EnemyActive[2], 1
    jmp startNewLevel

resetLevel3:
    ; Reset level 3 coins (uses lvl4 labels!)
    mov ecx, 5
    mov esi, OFFSET lvl4CoinCollected
resetL3Coins:
    mov BYTE PTR [esi], 0
    inc esi
    loop resetL3Coins
    
    ; Reset level 3 enemies - NOW 5 ENEMIES INCLUDING BOSS!
    mov BYTE PTR lvl4EnemyX[0], 30
    mov BYTE PTR lvl4EnemyX[1], 50
    mov BYTE PTR lvl4EnemyX[2], 60
    mov BYTE PTR lvl4EnemyX[3], 70
    mov BYTE PTR lvl4EnemyX[4], 68      ; BOSS
    
    mov BYTE PTR lvl4EnemyY[0], 24
    mov BYTE PTR lvl4EnemyY[1], 24
    mov BYTE PTR lvl4EnemyY[2], 18
    mov BYTE PTR lvl4EnemyY[3], 18
    mov BYTE PTR lvl4EnemyY[4], 18      ; BOSS
    
    mov BYTE PTR lvl4EnemyActive[0], 1
    mov BYTE PTR lvl4EnemyActive[1], 1
    mov BYTE PTR lvl4EnemyActive[2], 1
    mov BYTE PTR lvl4EnemyActive[3], 1
    mov BYTE PTR lvl4EnemyActive[4], 1  ; BOSS ACTIVE
    
    ; Reset boss health
    mov bossHealth, 5
    mov bossIsJumping, 0
    mov bossFireballActive, 0
    
    jmp startNewLevel
startNewLevel:
    ; Redraw everything for new level
    call Clrscr
    call DrawSkyBackground
    call DrawClouds
    call DrawHUD
    call DrawLevel
    call DrawCoins
    call DrawEnemies
    call DrawPlayer
    
    call GetMseconds
    mov lastTime, eax
    
    ; Continue playing the new level!
    jmp gameLoopMain

allLevelsBeaten:
    call CheckAndUpdateHighScore  
cmp al, 1
jne notNewHighScore



notNewHighScore:



    
showNormalGameOver:
    call ShowGameOverScreen
    ; Player beat all 4 levels!
;    call ShowVictoryScreen
    ret

gameOver:
    dec lives
    mov marioForm, 0
    cmp lives, 0
    jle showGameOver

    
    mov gameTime, 400
    mov xPos, 5
    mov yPos, 26
    mov isJumping, 0

    call GetMseconds
    mov lastTime, eax
    
    call Clrscr
    call DrawSkyBackground
    call DrawClouds
    call DrawHUD
    call DrawLevel
    call DrawCoins
    call DrawEnemies
    cmp currentSection, 3
    jne skipFlagRespawn
    call DrawFlagpole
skipFlagRespawn:
    call DrawPlayer
    jmp gameLoopMain

showGameOver:
    
    call CheckAndUpdateHighScore
    call ShowGameOverScreen

    cmp al, 1
    jne showNormalGameOver
    
 
    jmp afterGameOverScreen
    

showNormalGameOver1:
    call ShowGameOverScreen
    
afterGameOverScreen:
    ret

exitGame:
    ret
GameLoop ENDP

CheckAndUpdateHighScore PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; Clear buffers first
    mov ecx, 100
    mov edi, OFFSET buffer
    xor al, al
    rep stosb
    
    mov ecx, 30
    mov edi, OFFSET highScoreName
    xor al, al
    rep stosb

    ; ===== STEP 1: Try to open scores.txt =====
    mov edx, OFFSET filename_scores
    call OpenInputFile
    mov fileHandle, eax
    
    cmp eax, INVALID_HANDLE_VALUE
    je createNewScoreFile           ; File doesn't exist, create new
    
    ; ===== STEP 2: Read the high score =====
    mov eax, fileHandle
    mov edx, OFFSET buffer
    mov ecx, 20                     ; Read up to 20 bytes
    call ReadFromFile
    mov temp_score, al              ; Store bytes read
    
    ; Null-terminate buffer
    movzx ebx, temp_score
    mov esi, OFFSET buffer
    mov BYTE PTR [esi + ebx], 0
    
    ; Close file
    mov eax, fileHandle
    call CloseFile
    
    ; ===== Convert ASCII to number =====
    mov esi, OFFSET buffer
    xor eax, eax
    xor ebx, ebx
    
convertLoop:
    mov bl, BYTE PTR [esi]
    cmp bl, 0
    je doneConvert
    cmp bl, 10                      ; Skip newline
    je skipChar
    cmp bl, 13                      ; Skip carriage return
    je skipChar
    cmp bl, '0'
    jl doneConvert
    cmp bl, '9'
    jg doneConvert
    
    sub bl, '0'                     ; Convert ASCII to digit
    imul eax, 10                    ; Multiply current result by 10
    add eax, ebx                    ; Add new digit

skipChar:
    inc esi
    jmp convertLoop
    
doneConvert:
    mov highScore, eax              ; Store the high score (DWORD)
    
    ; ===== STEP 3: Read player name from names.txt =====
    mov ecx, 30
    mov edi, OFFSET highScoreName
    xor al, al
    rep stosb
    
    mov edx, OFFSET filename_names
    call OpenInputFile
    mov fileHandle, eax
    
    cmp eax, INVALID_HANDLE_VALUE
    je createNewScoreFile
    
    mov eax, fileHandle
    mov edx, OFFSET highScoreName
    mov ecx, 30
    call ReadFromFile
    mov temp_score, al              ; Store bytes read
    
    ; Null-terminate name
    movzx ebx, temp_score
    mov esi, OFFSET highScoreName
    mov BYTE PTR [esi + ebx], 0
    
    mov eax, fileHandle
    call CloseFile
    
    ; ===== STEP 4: Compare current score with high score =====
    mov eax, score                  ; Current score (DWORD)
    cmp eax, highScore
    jle noUpdate                    ; Current score is not higher
    
    ; ===== STEP 5: Current score is higher - update both files =====
    jmp updateFiles

createNewScoreFile:
    ; If files don't exist, current player becomes high score
    mov eax, score
    mov highScore, eax
    
updateFiles:
    ; Clear buffer
    mov ecx, 100
    mov edi, OFFSET buffer
    xor al, al
    rep stosb
    
    ; ===== Convert DWORD score to ASCII string =====
    mov eax, score
    mov edi, OFFSET buffer
    
    ; Handle zero case
    cmp eax, 0
    jne convertToAscii
    mov BYTE PTR [edi], '0'
    inc edi
    mov BYTE PTR [edi], 0           ; Null terminate
    jmp writeScore
    
convertToAscii:
    ; Convert number to ASCII digits (reversed)
    push edi
    xor ecx, ecx
    
convertDigit:
    cmp eax, 0
    je reverseDigits
    xor edx, edx
    mov ebx, 10
    div ebx                         ; Divide by 10
    add dl, '0'                     ; Convert remainder to ASCII
    mov BYTE PTR [edi], dl
    inc edi
    inc ecx
    jmp convertDigit
    
reverseDigits:
    ; Null terminate
    mov BYTE PTR [edi], 0
    
    ; Reverse the string in place
    pop esi                         ; Start of string
    dec edi                         ; End of string
    
reverseLoop:
    cmp esi, edi
    jge writeScore
    mov al, BYTE PTR [esi]
    mov bl, BYTE PTR [edi]
    mov BYTE PTR [esi], bl
    mov BYTE PTR [edi], al
    inc esi
    dec edi
    jmp reverseLoop
    
writeScore:
    ; ===== Write new score to scores.txt =====
    mov edx, OFFSET filename_scores
    call CreateOutputFile
    mov fileHandle, eax
    
    cmp eax, INVALID_HANDLE_VALUE
    je fileError
    
    ; Calculate string length
    mov edi, OFFSET buffer
    xor ecx, ecx
countLen:
    cmp BYTE PTR [edi + ecx], 0
    je doneCount
    inc ecx
    jmp countLen
doneCount:
    
    ; Write to file
    mov eax, fileHandle
    mov edx, OFFSET buffer
    call WriteToFile
    
    mov eax, fileHandle
    call CloseFile
    
    ; ===== Write new name to names.txt =====
    mov edx, OFFSET filename_names
    call CreateOutputFile
    mov fileHandle, eax
    
    cmp eax, INVALID_HANDLE_VALUE
    je fileError
    
    ; Calculate player name length
    mov edi, OFFSET playerName
    xor ecx, ecx
countNameLen:
    cmp BYTE PTR [edi + ecx], 0
    je doneNameCount
    inc ecx
    jmp countNameLen
doneNameCount:
    
    ; Write player name to file
    mov eax, fileHandle
    mov edx, OFFSET playerName
    call WriteToFile
    
    mov eax, fileHandle
    call CloseFile
    
    ; ===== Show congratulations message =====
    call Clrscr
    
    ; Title
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov dh, 10
    mov dl, 28
    call Gotoxy
    mov edx, OFFSET highScoreMsg    ; "*** NEW HIGH SCORE! ***"
    call WriteString
    
    ; Player name
    mov eax, white + (black * 16)
    call SetTextColor
    mov dh, 13
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET highScoreCongrats  ; "Congratulations, "
    call WriteString
    mov edx, OFFSET playerName
    call WriteString
    mov al, '!'
    call WriteChar
    
    ; Score
    mov eax, green + (black * 16)
    call SetTextColor
    mov dh, 15
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET highScoreAchieved  ; "You achieved the highest score: "
    call WriteString
    mov eax, score
    call WriteDec
    
    ; Fireworks effect
    mov ecx, 3
    mov dh, 18
fireworksLoop:
    push ecx
    push edx
    
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET completeFireworks
    call WriteString
    
    mov eax, 300
    call Delay
    
    mov eax, black + (black * 16)
    call SetTextColor
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET completeFireworks
    call WriteString
    
    mov eax, 150
    call Delay
    
    pop edx
    pop ecx
    inc dh
    loop fireworksLoop
    
    ; Wait prompt
    mov eax, white + (black * 16)
    call SetTextColor
    mov dh, 22
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET completeContinue
    call WriteString
    
    call ReadChar
    jmp done

noUpdate:
    ; Score not high enough - do nothing
    jmp done

fileError:
    ; Handle file error
    call Clrscr
    mov eax, red + (black * 16)
    call SetTextColor
    mov dh, 12
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET loadFailed
    call WriteString
    mov eax, 2000
    call Delay

done:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
CheckAndUpdateHighScore ENDP

; ========================================
; LOAD HIGH SCORE 
; ========================================
LoadHighScore PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; Clear buffers
    mov ecx, 100
    mov edi, OFFSET buffer
    xor al, al
    rep stosb
    
    mov ecx, 30
    mov edi, OFFSET highScoreName
    xor al, al
    rep stosb

    ; ===== Open scores.txt =====
    mov edx, OFFSET filename_scores
    call OpenInputFile
    mov fileHandle, eax
    
    cmp eax, INVALID_HANDLE_VALUE
    je noScoreFile
    
    ; ===== Read score =====
    mov eax, fileHandle
    mov edx, OFFSET buffer
    mov ecx, 20
    call ReadFromFile
    mov temp_score, al
    
    ; Null-terminate
    movzx ebx, temp_score
    mov esi, OFFSET buffer
    mov BYTE PTR [esi + ebx], 0
    
    mov eax, fileHandle
    call CloseFile
    
    ; ===== Convert ASCII to number =====
    mov esi, OFFSET buffer
    xor eax, eax
    xor ebx, ebx
    
loadConvertLoop:
    mov bl, BYTE PTR [esi]
    cmp bl, 0
    je loadDoneConvert
    cmp bl, 10
    je loadSkipChar
    cmp bl, 13
    je loadSkipChar
    cmp bl, '0'
    jl loadDoneConvert
    cmp bl, '9'
    jg loadDoneConvert
    
    sub bl, '0'
    imul eax, 10
    add eax, ebx

loadSkipChar:
    inc esi
    jmp loadConvertLoop
    
loadDoneConvert:
    mov highScore, eax
    
    ; ===== Read name =====
    mov edx, OFFSET filename_names
    call OpenInputFile
    mov fileHandle, eax
    
    cmp eax, INVALID_HANDLE_VALUE
    je noScoreFile
    
    mov eax, fileHandle
    mov edx, OFFSET highScoreName
    mov ecx, 30
    call ReadFromFile
    mov temp_score, al
    
    ; Null-terminate
    movzx ebx, temp_score
    mov esi, OFFSET highScoreName
    mov BYTE PTR [esi + ebx], 0
    
    mov eax, fileHandle
    call CloseFile
    jmp loadDone

noScoreFile:
    ; No high score yet
    mov highScore, 0
    mov BYTE PTR highScoreName, 0

loadDone:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
LoadHighScore ENDP

; ========================================
; SHOW HIGH SCORES
; ========================================
ShowHighScores PROC
    push eax
    push ebx
    push edx

    ; Load the high score first
    call LoadHighScore
    
    call Clrscr
    
    ; Check if there's a high score
    cmp highScore, 0
    je noScores
    
    ; ===== Display high score =====
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov dh, 8
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET allScoresHeader
    call WriteString
    
    ; Display name and score
    mov eax, white + (black * 16)
    call SetTextColor
    
    mov dh, 11
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET highScoreCongrats
    call WriteString
    
    ; Name
    mov al, highScoreName[0]
    cmp al, 0
    je noName
    mov edx, OFFSET highScoreName
    call WriteString
    jmp showScore
    
noName:
    mov edx, OFFSET playerName
    call WriteString
    
showScore:
    mov al, '!'
    call WriteChar
    
    mov dh, 13
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET highScoreAchieved
    call WriteString
    
    mov eax, highScore
    call WriteDec
    
    jmp showPrompt
    
noScores:
    ; No scores found
    mov eax, red + (black * 16)
    call SetTextColor
    mov dh, 10
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET noScoresMsg
    call WriteString
    
showPrompt:
    ; Back prompt
    mov eax, green + (black * 16)
    call SetTextColor
    mov dh, 18
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET instrBack
    call WriteString
    
    call ReadChar
    
    pop edx
    pop ebx
    pop eax
    ret
ShowHighScores ENDP
SaveProgress PROC
    
    ret
SaveProgress ENDP

; ========================================
; LOAD PROGRESS
; ========================================
LoadProgress PROC
    ret
LoadProgress ENDP

; ==================== IMPROVED SOUND SYSTEM ====================

; currentMusic BYTE 0  ; Track which music is playing (0=none, 1=music, 2=sfx)

; ==================== SOUND PROCEDURES ====================

; Play sound effect WITHOUT stopping background music
PlaySFXWithMusic PROC
    ; EDX = pointer to sound file path
    pushad
    
    ; Use SND_NOSTOP flag to not interrupt background music
    ; This allows multiple sounds to play simultaneously
    INVOKE PlaySoundA, edx, 0, SND_FILENAME OR SND_ASYNC OR SND_NOSTOP
    
    popad
    ret
PlaySFXWithMusic ENDP

; Play sound effect that CAN interrupt music if needed (important sounds)
PlaySFXImportant PROC
    ; EDX = pointer to sound file path
    pushad
    
    ; No special flags - will interrupt if necessary
    INVOKE PlaySoundA, edx, 0, SND_FILENAME OR SND_ASYNC
    
    popad
    ret
PlaySFXImportant ENDP

; Play background music in a loop
PlayMusicLoop PROC
    ; EDX = pointer to music file path
    pushad
    
    ; SND_LOOP plays the sound repeatedly
    INVOKE PlaySoundA, edx, 0, SND_FILENAME OR SND_ASYNC OR SND_LOOP
    
    popad
    ret
PlayMusicLoop ENDP

; Stop all sounds
StopAllSounds PROC
    pushad
    INVOKE PlaySoundA, 0, 0, 0
    popad
    ret
StopAllSounds ENDP

; ==================== REPLACEMENT SOUND FUNCTIONS ====================

PlayCoinSound PROC
    push edx
    mov edx, OFFSET coinSound
    call PlaySFXWithMusic  ; Use NOSTOP so it doesn't interrupt music
    pop edx
    ret
PlayCoinSound ENDP

PlayJumpSound PROC
    push edx
    mov edx, OFFSET jumpSound
    call PlaySFXWithMusic  ; Use NOSTOP
    pop edx
    ret
PlayJumpSound ENDP

PlayStompSound PROC
    push edx
    mov edx, OFFSET stompSound
    call PlaySFXWithMusic  ; Use NOSTOP
    pop edx
    ret
PlayStompSound ENDP

PlayDeathSound PROC
    push edx
    mov edx, OFFSET deathSound
    call PlaySFXImportant  ; Death IS important, allow interruption
    pop edx
    ret
PlayDeathSound ENDP

PlayPowerUpSound PROC
    push edx
    mov edx, OFFSET powerupSound
    call PlaySFXWithMusic  ; Use NOSTOP
    pop edx
    ret
PlayPowerUpSound ENDP

PlayLevelClearSound PROC
    push edx
    call StopAllSounds     ; Stop music first
    mov eax, 100
    call Delay             ; Brief pause
    mov edx, OFFSET stompSound  ; Or use a level-complete sound if you have one
    call PlaySFXImportant  ; Play clear sound
    pop edx
    ret
PlayLevelClearSound ENDP

; ==================== MUSIC PLAYING ====================
comment @
PlayLevel1Music PROC
    push edx
    mov edx, OFFSET music1
    call PlayMusicLoop
    pop edx
    ret
PlayLevel1Music ENDP

PlayLevel2Music PROC
    push edx
    mov edx, OFFSET music2
    call PlayMusicLoop
    pop edx
    ret
PlayLevel2Music ENDP

PlayLevel3Music PROC
    push edx
    mov edx, OFFSET music3
    call PlayMusicLoop
    pop edx
    ret
PlayLevel3Music ENDP
@
StopBackgroundMusic PROC
    call StopAllSounds
    ret
StopBackgroundMusic ENDP

; ==================== DISPLAY HIGH SCORE ====================
ShowHighScoreSimple PROC
    call Clrscr
    
    mov eax, yellow + (black * 16)
    call SetTextColor
    
    mov dh, 8
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET highScoreMsg
    call WriteString
    
    ; Display current high score
    mov eax, white + (black * 16)
    call SetTextColor
    
    mov dh, 11
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET highScoreCongrats
    call WriteString
    
    ; Display name if available
    mov al, playerName[0]
    cmp al, 0
    je noPlayerName
    mov edx, OFFSET playerName
    call WriteString
    jmp showTheScore
    
noPlayerName:
    mov edx, OFFSET highScoreName
    call WriteString
    
showTheScore:
    mov al, '!'
    call WriteChar
    
    mov dh, 13
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET highScoreAchieved
    call WriteString
    
    mov eax, highScore
    call WriteDec
    
    ; Back prompt
    mov eax, green + (black * 16)
    call SetTextColor
    mov dh, 18
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET instrBack
    call WriteString
    
    call ReadChar
    ret
ShowHighScoreSimple ENDP



; ========================================
; GET PLAYER NAME
; ========================================
GetPlayerName PROC    
    call Clrscr
    
    mov eax, black + (white * 16)
    call SetTextColor
    
    mov dh, 10
    mov dl, 20
    call Gotoxy
    mov edx, OFFSET namePrompt
    call WriteString
    
    mov eax, black+ (white * 16)
    call SetTextColor
    
    mov edx, OFFSET playerName
    mov ecx, 30
    call ReadString  
    ret
GetPlayerName ENDP

; ========================================
; INSTRUCTIONS SCREEN
; ========================================
ShowInstructions PROC
    call Clrscr
    
    mov eax, yellow + (white  * 16)
    call SetTextColor
    
    mov dh, 4
    mov dl, 28
    call Gotoxy
    mov edx, OFFSET instrTitle
    call WriteString
    
    mov eax, black+ (white * 16)
    call SetTextColor
    
    mov dh, 7
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr1
    call WriteString
    
    mov dh, 8
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr2
    call WriteString
    
    mov dh, 9
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr3
    call WriteString
    
    mov dh, 10
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr4
    call WriteString
    
    mov dh, 11
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr5
    call WriteString
    
    mov dh, 12
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr6
    call WriteString
    
    mov dh, 13
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr7
    call WriteString
    
    mov dh, 15
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr8
    call WriteString
    
    mov dh, 16
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr9
    call WriteString
    
    mov dh, 17
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr10
    call WriteString
    
    mov dh, 18
    mov dl, 10
    call Gotoxy
    mov edx, OFFSET instr11
    call WriteString
    
    mov eax, green + (white * 16)
    call SetTextColor
    mov dh, 22
    mov dl, 20
    call Gotoxy
    mov edx, OFFSET instrBack
    call WriteString
    
    call ReadChar
    ret
ShowInstructions ENDP


; ========================================
; WELCOME SCREEN

ShowWelcomeScreen PROC
   
   ; Set your desired background color
    mov eax, white + (white * 16)  ; White text on blue background
    call SetTextColor
    
    ; Fill entire screen with spaces in that color
    mov ecx, 2000  ; 80×25 = 2000 characters (standard console size)
    mov al, ' '    ; Space character
FillLoop:
    call WriteChar ; Write a space with current color
    loop FillLoop
   
   
   
   
   call Clrscr
   
   

    mov eax, black + (white* 16)
    call SetTextColor
    
    mov dh, 8  ; vertical
    mov dl, 2  ; horizontal
    call Gotoxy
    mov edx, OFFSET titleLine1
    call WriteString
    
    mov dh, 9
    mov dl, 2
    call Gotoxy
    mov edx, OFFSET titleLine2
    call WriteString
    
    mov dh, 10
    mov dl, 2
    call Gotoxy
    mov edx, OFFSET titleLine3
    call WriteString
    
    mov dh, 11
    mov dl, 2
    call Gotoxy
    mov edx, OFFSET titleLine4
    call WriteString
    
    mov dh, 12
    mov dl, 2
    call Gotoxy
    mov edx, OFFSET titleLine5
    call WriteString
    
    mov dh, 13
    mov dl, 2
    call Gotoxy
    mov edx, OFFSET titleLine6
    call WriteString
    
    mov eax, black + (white * 16)
    call SetTextColor
    
    mov dh, 14
    mov dl, 2
    call Gotoxy
    mov edx, OFFSET titleLine7
    call WriteString
    
    mov eax, white + (black * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 26
    call Gotoxy
    mov edx, OFFSET entertocontinue 
    call WriteString
    
    call ReadChar  ; just to like continue
    ret
ShowWelcomeScreen ENDP

;menu screen

ShowMenu PROC
; Set your desired background color
    mov eax, black+ (white* 16)  ; White text on blue background
    call SetTextColor
    
    ; Fill entire screen with spaces in that color
    mov ecx, 2000  ; 80×25 = 2000 characters (standard console size)
    mov al, ' '    ; Space character
FillLoop:
    call WriteChar ; Write a space with current color
    loop FillLoop
    call Clrscr
    
    mov eax, black+ (white * 16)
    call SetTextColor
    
    mov dh, 8
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET menuTitle
    call WriteString
    
    mov eax, black + (white * 16)
    call SetTextColor
    
    mov dh, 11
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET menuOpt1
    call WriteString
    
    mov dh, 12
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET menuOpt2
    call WriteString
    
    mov dh, 13
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET menuOpt3
    call WriteString
    
    mov dh, 14
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET menuOpt4
    call WriteString
    
    mov dh, 15
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET menuOpt5  ; Now defined
    call WriteString
    
    mov dh, 17
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET menuPrompt
    call WriteString
    
    ret
ShowMenu ENDP

main PROC
    call Randomize
    call Clrscr ; moving cursor to the top left
 
    call ShowWelcomeScreen
    
mainLoop:
    call Clrscr
    call ShowMenu
    call ReadChar
    
    cmp al, '1'
    je startGame
    cmp al, '2'
    je showInstr
    cmp al, '3'
    je showHighScores1    
    cmp al, '4'
    je loadGame
    cmp al, '5'
    je exitProg
    jmp mainLoop

startGame:
    call GetPlayerName
    mov currentLevel, 1
    call InitGame
    call GameLoop
    jmp mainLoop

showInstr:
    call ShowInstructions
    jmp mainLoop

showHighScores1:          
  call ShowHighScores 
    jmp mainLoop

loadGame:
    call GetPlayerName
    call LoadProgress
    call GameLoop
    jmp mainLoop

exitProg:
    call Clrscr
    exit
main ENDP
END main