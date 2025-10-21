(NTHU_113062559_李承澔) ACAL 2025 Spring Lab 14 HW Submission Template
===

###### tags: `AIAS Spring 2024`, `AIAS Fall 2024`, `AIAS Spring 2025`, `Submission Template`

:::danger
注意事項
---
1. **請不要用這份template 交作業**, 建立一個新的檔案, 然後copy & paste 這個template 到你創建的文件做修改。
2. 在上面的title修改你的學號與姓名 , 避免TA修改作業時把檔案跟人弄錯。
    - Ex: Ex: NCKU_xxx_OOO ACAL 2025 Spring Lab 14 Homework Submission
3. 在Playlab 作業中心繳交作業時, 請用你創建的檔案鏈結繳交, 其他相關的資料與鏈結請依照Template 規定的格式記載於codimd 上。
:::
[toc]

## Gitlab code link
:::info
Please paste the link to your private Gitlab repository for this homework submission here. 
:::

- Gitlab link - [Gitlab](https://course.playlab.tw/git/chngh0207/lab14)

## Homework 14-1 - Make accelerator move data by itself

- 說明與要求：
    - 根據作業要求，同學的block diagram應如下圖所示:
    <p style="text-align:center"><img src="https://course.playlab.tw/md/uploads/1dd3c2e5-27ae-4875-a00b-4b0b4f8ce2ae.png" width=400 ></p>

    - 在address space不變的情況，請同學準備一份asm code，演示一次**SA從SRAM讀值並將運算後的結果寫回SRAM的過程**，透過emulator轉化出硬體所需的檔案，需要做的有...
        - SRAM預設初始值，可以和lab的矩陣內容相同，運算資料的儲存位置。SA透過AXI對其進行讀寫
        - MMIO_Regfile也會有預設值，一開始`ENABLE`設為high讓SA一開始就能夠進行資料讀取
    - 需要克服的點：
        - 當資料不再是每一個clock送入一筆，SA該如何因應，請同學寫下你是如何解決？要注意的是，<font color=#f00>這裡的SA讀寫資料所花的時間應假設為**未知**，而非fix-length!!</font>同學須注意FSM的設計。
    - **Ans:**
    利用在lab裡所提供的方法，可以根據`STATUS`信號，印出你SRAM裡存放輸入矩陣以及輸出矩陣的資訊，截圖貼上來。
    截圖中請包括 reference clock、SA 的 master port、及 DataMem 的 slave port 的訊號以及說明 SA 如何處理超過 1 cycle 時所需包含之訊號。
    :::success
    - 測試方式說明:
        ```
        sbt 'testOnly acal_lab14.HW14_1.topTest -tbn verilator'
        ```
      測試的assembly code改寫自`matmul_demo.S`，並將原本program DMA的部分改為program SA搬移資料。其中SA的MMIO regfile改成如下及其對應的地址偏移量。
      ![](https://course.playlab.tw/md/uploads/9240deaa-f9a3-4f10-bebd-c9fc3b7c6ee5.png)
      ```
      ACCEL_OFFSET_LOAD_EN:
      .word 0x28
      ACCEL_OFFSET_LOAD_DONE:
      .word 0x2c
      ACCEL_OFFSET_SRC_INFO:
      .word 0x30
      ACCEL_OFFSET_DST_INFO:
      .word 0x34
      ACCEL_OFFSET_SIZE_CFG:
      .word 0x38
      ```
      矩陣的搬移來源及目標地址：
      ```
      mat_A: 0x8000 -> 0x200000
      mat_B: 0x8010 -> 0x200010
      ```
      其餘program SA進行運算的部分則不變。
      

    - 結果(貼圖):
      ![](https://course.playlab.tw/md/uploads/b67e3e66-d3c8-4fd3-a721-98df12375945.png)
      Matrix calculator的結果：
      ![](https://course.playlab.tw/md/uploads/b394c91d-d183-4496-9479-13a1d3fec926.png)

    - SA 如何調整設計以應對讀寫資料耗時超過 1 cycle 且不固定的情況
      我在`Memory_Mapped.scala`中進行讀寫資料的功能。
      其實就是lab 11做過的DMA功能，我將DMA的master port code複製到此lab中，並且透過CPU program MMIO reg的不同，來決定目前是搬移資料還是進行SA的運算。
      ![](https://course.playlab.tw/md/uploads/625a1689-e9d0-4e6c-8ae1-b82514b959ae.png)
      當`io.mmio.LOAD_EN`被program，表示目前要進行DMA將資料讀入LocalMem；否則再另外判斷`io.mmio.ENABLEOUT`，決定SA的行為。
      
      在搬移過程中，則透過FSM處理讀寫資料耗時超過1 cycle的情形。
      ![](https://course.playlab.tw/md/uploads/072d54f9-b772-47b7-8ecc-11ace3d26706.png)
      
      SA搬移mat_A的過程
      ![](https://course.playlab.tw/md/uploads/e9ee8c6d-93fe-43e1-93f3-16f5f8817fd1.png)
      當CPU program`0x100028 io.mmio.LOAD_EN` reg後，SA開始搬移資料。
      由SA的master port發出read cycle至DataMem，並由DataMem的slave port回應資料給SA。
      
      SA搬移mat_B的過程如上。

    :::

    > 建議同學在此作業中將 DMA module 從 AXI Bus 中移除，以免與 Lab 中的設計混淆

_____

## Homework 14-2 - Make the AXI bus support more masters (Accelerator)
- 說明與要求：
    - 根據作業要求，同學最後的block diagram應如下圖所示:
    <p style="text-align:center"><img src="https://course.playlab.tw/md/uploads/62ec268b-8c6e-40b3-b86a-93996fb1fd99.png" width=500 ></p>
    
    - 在 2 masters 以上的情況下，Arbiter會去決定誰在當下發出的request"算數"，方式有兩種，一種是Round-Robbin(輪流)，另一種則是Priority(index越小，優先權越大)，在Lab中所採用的機制為前者(RRArbiter)，提供給同學參考的測試情境應如下：
        - CPU接續 program DMA 與 SA 後，兩者開始透過AXI讀取SRAM的值，假設CPU並非向lab所示範那樣hang住等待SA所發出的`status`信號，假設它接下來也需要對SRAM執行讀寫，則此時會有多達3個 masters 對同一個 slave 發出 request
        - 同學必須截下當 3 masters 同時發出request的情況下中，Abiter會如何選擇，並擷取說明被選擇的那方的波形，以及沒有被選擇到的又該如何處理?
        :::success
        ```
        sbt 'testOnly acal_lab14.HW14_2.topTest -tbn verilator'
        ```
        * Multiple read request to the same slave
        
            在此實驗中，3個master各會發2個read request到slave 0

            ![](https://course.playlab.tw/md/uploads/448cea01-cd86-4222-9a77-551852ff2866.png)
            根據波形中的readMuxes_0`io_in_X_readAddr_ready`及readMuxes_0 arbiter的`choice`訊號，可以看到arbiter依序grant了master 1, 2, 0, 1, 2, 0。
            接著觀察各個master read port的`r_ready`訊號也可以發現同樣的grant順序。若未被選擇到的master則繼續等待，直到自己的`r_ready`被拉起。
        
        
        * Multiple write request to the same slave
        
            在此實驗中，3個master各會發2個read request到slave 1
            ![](https://course.playlab.tw/md/uploads/a8b32b27-57b0-423d-8756-d29c2945d334.png)

            根據波形中的writeMuxes_1`io_in_X_writeAddr_ready`, io_in_X_writeData_ready`及writeMuxes_1 arbiter的`choice`訊號，可以看到arbiter依序grant了master 2, 0, 1, 2, 0, 1。
            接著觀察各個master write port的`w_ready`, `aw_ready`訊號也可以發現同樣的grant順序。若未被選擇到的master則繼續等待，直到自己的`w_ready`, `aw_ready`被拉起。
        
        :::
- Bonus：
    - 現有的AXI只能處理一筆request (i.e., 1 master & 1 slave)，但若是 2 masters 以上所發出的 requests 並不衝突(要找不同的 slave)，同學是否能將AXI擴增至能平行處理多筆requests呢?(i.e., 同時有多組 master/slave 配對成功。)

_____

## Homework 14-3 Put Everything together to run a larger NxN (where N is 16) matrix multiplication 
- 說明與要求：
    - Option 1 (當輸入矩陣小於硬體時)
        - 無止境的放大生成硬體以符合輸入資料的要求，這種做法的缺點當資料遠小於硬體時會耗能，耗面積，但同學也應考慮到當實際硬體與運算資料的"形狀不符"時，該如何利用MMIO所提供的資訊去改變Controller的設定
            - 舉例：4x4 SA如何完成[2x3]x[3x2]的矩陣乘法呢?
    - Option 2 (當輸入矩陣大於硬體時)
        - 對資料做mapping(組合、拆分)以符合硬體規格(4x4)，此種作法較為實際，因硬體為有限且早已確定，應該將資料調整成符合硬體要求的樣子做運算。
    - 測資要求與結果呈現：
        - 你是採用Option 1 還是 Option 2，說明Controller是如何設計?(Option 1)，或者資料該如何調整成硬體所能接受的樣子(資料如何存放、如何mapping)(Option 2)。
        - 同學實作出的硬體要能夠運算以下測資(自行準備並在下方說明)：[2x3]x[3x2]、[4x4]x[4x4]、[16x16]x[16x16]三筆矩陣乘法。
        - 比較使用兩種 mode (DMA fetch data / SA fetch data) 進行運算在此作業中的差異 (program 的方式有何不同? 兩者的 performance 有何差別? 造成差異的原因為何? etc.)
        ::: success
        * HW 14-3-1 ([2x3]x[3x2])
            - 測資：
                \begin{align}
                    mat\_A&=\begin{pmatrix}
                      1 & 1 & 4\\
                      4 & 2 & 3
                    \end{pmatrix}\\
                    mat\_B&=\begin{pmatrix}
                      3 & 2\\
                      1 & 3\\
                      4 & 1
                    \end{pmatrix}
                \end{align}
            - 存放以及mapping：
                將mat_A及mat_B padding成SA的尺寸，也就是4x4的大小。
                並且將兩矩陣從DataMem搬移至LocalMem，來源及目標地址如下：
                ```
                mat_A: 0x8000 -> 0x200000
                mat_B: 0x8010 -> 0x200010
                ```
            - 結果：
                Matrix calculator 結果
                ![](https://course.playlab.tw/md/uploads/8821f7f1-32b4-4ae1-8323-5e8f9fc37e8a.png)
                SA transfer data
                ```
                sbt 'testOnly acal_lab14.HW14_3_1_SA.topTest -tbn verilator'
                ```
                ![](https://course.playlab.tw/md/uploads/ab4b495e-fcd0-4b28-98c2-b23e16ffc885.png)
                               
                DMA transfer data
                ```
                sbt 'testOnly acal_lab14.HW14_3_1_DMA.topTest -tbn verilator'
                ```
                ![](https://course.playlab.tw/md/uploads/840bc5e2-14e4-4c37-a104-fddcf22e14f2.png)
                
        * HW 14-3-2 ([4x4]x[4x4])
            - 測資：
                \begin{align}
                    mat\_A&=\begin{pmatrix}
                      1 & 4 & 2 & 4\\
                      3 & 2 & 3 & 3\\
                      3 & 2 & 1 & 2\\
                      2 & 4 & 4 & 2
                    \end{pmatrix}\\
                    mat\_B&=\begin{pmatrix}
                      2 & 4 & 4 & 1\\
                      2 & 4 & 2 & 2\\
                      3 & 3 & 4 & 1\\
                      4 & 3 & 3 & 3
                    \end{pmatrix}
                \end{align}
            - 存放以及mapping：
                將兩矩陣從DataMem搬移至LocalMem，來源及目標地址如下：
                ```
                mat_A: 0x8000 -> 0x200000
                mat_B: 0x8010 -> 0x200010
                ```
            - 結果：
                Matrix calculator 結果
                ![](https://course.playlab.tw/md/uploads/77450ad8-292a-4028-9044-ed917103b831.png)

                SA transfer data
                ```
                sbt 'testOnly acal_lab14.HW14_3_2_SA.topTest -tbn verilator'
                ```
                ![](https://course.playlab.tw/md/uploads/2ebaed30-75c3-4982-8342-aa6efc0afd1f.png)

                               
                DMA transfer data
                ```
                sbt 'testOnly acal_lab14.HW14_3_2_DMA.topTest -tbn verilator'
                ```
                ![](https://course.playlab.tw/md/uploads/bcfe062b-5e54-448c-a2c1-99ab68b826b3.png)

                
                
        * HW 14-3-3 ([16x16]x[16x16])
            - 測資：
                \begin{align}
                    mat\_A&=\begin{pmatrix}
                    1 & 4 & 1 & 3 & 1 & 2 & 4 & 2 & 4 & 2 & 3 & 2 & 1 & 1 & 4 & 4\\
                    3 & 3 & 1 & 1 & 3 & 2 & 2 & 4 & 1 & 1 & 4 & 1 & 1 & 4 & 3 & 2\\
                    2 & 3 & 3 & 2 & 1 & 2 & 4 & 2 & 2 & 3 & 4 & 3 & 3 & 1 & 4 & 2\\
                    1 & 1 & 3 & 4 & 1 & 2 & 1 & 2 & 4 & 2 & 1 & 3 & 3 & 3 & 2 & 1\\
                    4 & 3 & 4 & 2 & 2 & 4 & 4 & 1 & 1 & 3 & 3 & 3 & 2 & 1 & 3 & 2\\
                    2 & 3 & 2 & 2 & 4 & 3 & 1 & 1 & 2 & 4 & 1 & 4 & 1 & 4 & 2 & 4\\
                    2 & 3 & 2 & 2 & 4 & 3 & 3 & 3 & 2 & 4 & 1 & 3 & 2 & 2 & 3 & 3\\
                    1 & 4 & 2 & 4 & 3 & 3 & 1 & 3 & 2 & 3 & 1 & 1 & 3 & 2 & 1 & 2\\
                    1 & 1 & 2 & 2 & 2 & 2 & 3 & 4 & 3 & 4 & 2 & 2 & 3 & 2 & 1 & 2\\
                    2 & 3 & 4 & 4 & 4 & 4 & 3 & 3 & 2 & 4 & 4 & 1 & 2 & 2 & 2 & 3\\
                    3 & 1 & 4 & 3 & 3 & 1 & 4 & 1 & 1 & 1 & 2 & 2 & 1 & 3 & 2 & 4\\
                    4 & 1 & 2 & 3 & 3 & 4 & 1 & 4 & 3 & 4 & 2 & 3 & 3 & 3 & 1 & 3\\
                    3 & 4 & 4 & 2 & 2 & 2 & 1 & 1 & 1 & 3 & 1 & 1 & 1 & 1 & 2 & 3\\
                    4 & 1 & 4 & 1 & 2 & 3 & 4 & 4 & 1 & 2 & 2 & 2 & 4 & 1 & 4 & 4\\
                    3 & 1 & 3 & 2 & 4 & 4 & 3 & 4 & 2 & 2 & 2 & 2 & 3 & 3 & 4 & 1\\
                    3 & 4 & 1 & 2 & 3 & 2 & 2 & 1 & 4 & 3 & 4 & 4 & 1 & 2 & 4 & 3\\
                    \end{pmatrix}\\
                    mat\_B&=\begin{pmatrix}
                    3 & 4 & 1 & 3 & 3 & 4 & 1 & 1 & 3 & 2 & 3 & 3 & 3 & 3 & 4 & 1\\
                    4 & 4 & 4 & 3 & 2 & 1 & 2 & 4 & 4 & 2 & 2 & 2 & 4 & 4 & 1 & 1\\
                    4 & 2 & 2 & 1 & 4 & 1 & 1 & 3 & 3 & 3 & 2 & 4 & 4 & 4 & 4 & 3\\
                    2 & 2 & 3 & 2 & 3 & 4 & 3 & 4 & 4 & 1 & 3 & 1 & 3 & 3 & 1 & 1\\
                    3 & 2 & 4 & 1 & 4 & 2 & 2 & 2 & 1 & 2 & 1 & 2 & 4 & 4 & 3 & 4\\
                    3 & 4 & 1 & 4 & 3 & 3 & 2 & 1 & 4 & 2 & 4 & 4 & 2 & 2 & 2 & 2\\
                    2 & 4 & 2 & 1 & 3 & 2 & 2 & 4 & 2 & 2 & 2 & 4 & 2 & 3 & 4 & 3\\
                    4 & 2 & 3 & 4 & 1 & 2 & 4 & 1 & 4 & 1 & 2 & 3 & 1 & 4 & 2 & 1\\
                    4 & 4 & 4 & 1 & 1 & 1 & 3 & 1 & 1 & 1 & 3 & 1 & 4 & 1 & 4 & 4\\
                    4 & 3 & 3 & 3 & 1 & 4 & 3 & 3 & 1 & 3 & 1 & 2 & 3 & 2 & 1 & 4\\
                    3 & 1 & 4 & 4 & 2 & 1 & 4 & 3 & 3 & 2 & 4 & 1 & 3 & 4 & 4 & 2\\
                    3 & 3 & 1 & 3 & 1 & 3 & 2 & 3 & 1 & 1 & 2 & 3 & 3 & 2 & 3 & 3\\
                    1 & 3 & 3 & 2 & 2 & 4 & 1 & 3 & 3 & 4 & 3 & 1 & 4 & 1 & 4 & 4\\
                    2 & 1 & 3 & 3 & 1 & 3 & 3 & 1 & 4 & 1 & 4 & 3 & 3 & 3 & 2 & 4\\
                    2 & 2 & 1 & 2 & 1 & 1 & 2 & 4 & 4 & 4 & 4 & 4 & 2 & 2 & 3 & 4\\
                    2 & 3 & 4 & 1 & 3 & 2 & 1 & 1 & 1 & 3 & 2 & 1 & 4 & 1 & 1 & 3\\
                    \end{pmatrix}
                \end{align}
            - 存放以及mapping：
                將兩矩陣從DataMem搬移至LocalMem，來源及目標地址如下：
                ```
                mat_A: 0x8000 -> 0x200000
                mat_B: 0x8100 -> 0x200100
                ```
            - 結果：
                Matrix calculator 結果
                ![](https://course.playlab.tw/md/uploads/a0677cdf-6498-4bee-be2b-4626282a9bcf.png)
                

                SA transfer data
                ```
                sbt 'testOnly acal_lab14.HW14_3_3_SA.topTest -tbn verilator'
                ```
                |Cycle count & input matrix|Output matrix|
                |---|---|
                |![](https://course.playlab.tw/md/uploads/1f51a17a-50dc-4891-93f6-d778f93f17a2.png)|![](https://course.playlab.tw/md/uploads/f44ebdbc-9f94-49ce-a706-04b1a5577fe1.png)|
                
                > Cycle count = 16927 
                
                               
                DMA transfer data
                ```
                sbt 'testOnly acal_lab14.HW14_3_3_DMA.topTest -tbn verilator'
                ```
                |Cycle count & input matrix|Output matrix|
                |---|---|
                |![](https://course.playlab.tw/md/uploads/4a51ca08-45ab-4879-a547-7f4a4cd10cdd.png)|![](https://course.playlab.tw/md/uploads/3625d5a6-01a4-4eac-ac7d-6966794babba.png)|
                
                > Cycle count = 17733 
                
                
            * 比較使用兩種 mode (SA fetch data / DMA fetch data) 進行運算在此作業中的差異
                
                1. 兩者的差異僅為在搬移資料時，program的方式不同。
                    若SA fetch，program SA的MMIO reg以啟動SA搬移資料；若DMA fetch，則program DMA的MMIO以啟動DMA搬移資料。
                    ![](https://course.playlab.tw/md/uploads/196ee844-ea0e-4dde-97f4-d8fdc049cd6d.png)
                    
                2. Performance的差異
                    SA搬移資料的master state controller，相較於DMA中的master state controller。在`mWriteSend` state，SA讀到資料後要寫入LocalMem時不必等待與destination address的handshake完成，因為此時SA會直接寫入LocalMem而不需經過bus；同理，也少了`mWriteResp` state，不必等待bus回傳寫入成功的資訊，所以所需cycle更少。
                    其餘運算花費的時間相同。
                    ![](https://course.playlab.tw/md/uploads/bbdee982-5f46-47ad-bc65-3aef06097a86.png)


                

        :::

_____

## Homework 14-4 Prepare software for the Conv2D operation and compare with the result in Lab 11.

最後請同學把 Lab11 中所提供的 Conv2D operation 轉換成 Matrix multiplication 之後，用 systolic array 做加速運算並回答下面的問題:

- Systolic array 能加速matrix multiplication 以及convolution 多少倍呢？ 如果我們沒有限制systolic array 能增加的面積尺寸, 那這個加速的趨勢會一直下去嗎？如果不行，那加速的上限是多少呢？
- 如果你想要讓 acclerator performance 更好，你覺得你的 design 上能做什麼改善？（增加 PE 數量、加寬 bus bandwidth 除外）

:::warning
由於在此份作業中可以使用兩種 mode，同學們可以兩者擇一 (CPU + SA + DM / CPU + DMA + SA + DM) 分別和 HW11-1 (CPU + DM) / HW11-2 or HW11-3 (CPU + DMA + High & Low Latency Memory) 的內容進行類比，透過與 CPU 運算 Conv2D 的方式進行比較，分析使用 Systolic Array 後能夠提升多少 performance。
由於 Lab11 作業的系統與此 Lab 作業的系統並不完全相同，同學們可以想想要如何更改設計讓兩個 Lab 的結果能夠公平地進行比較 (**hint**: 如果同學選擇使用 DMA fetch data，DM 的設計需不需要調整? latency 應該要調整成多少? AXI Bus 需不需要支援 burst mode? ) 
:::

本項作業的繳交內容請附上：

1. CPU 透過 AXI-Lite bus 存取資料條件下執行 Conv2D 的 cycle count 及 output data 截圖
2. 以 Lab8/Lab 9 CPU + DMA + Systolic Array 或是 Lab8/Lab 9 CPU + Systolic Array **(擇一即可)** 執行 Conv2D 的 cycle count 及 output data 截圖 **(碩士班同學請使用 5-stages pipeline CPU 進行實作)**


:::success
- 測資：
    透過im2col將2個3x3 kernel flatten成1x18的矩陣，接著對width padding 0到整數倍的word width (1x20)。同時對height padding 0到SA的rows (4x20)，得到mat_A。

    透過im2col將2個8x8 feature map 轉換成18x36的矩陣，接著對height padding 0到整數倍的word width (20x36)，得到mat_B。
    
    \begin{align}
        mat\_A&=\begin{pmatrix}
          0 & 1 & 2 & 0 & 1 & 2 & 0 & 1 & 2 & 0 & 1 & 2 & 0 & 1 & 2 & 0 & 1 & 2 & 0 & 0\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
        \end{pmatrix}\\
        mat\_B&=\begin{pmatrix}
          0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5\\
1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6\\
2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7\\
0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5\\
1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6\\
2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7\\
0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5\\
1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6\\
2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7\\
0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5\\
1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6\\
2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7\\
0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5\\
1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6\\
2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7\\
0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5 & 0 & 1 & 2 & 3 & 4 & 5\\
1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6 & 1 & 2 & 3 & 4 & 5 & 6\\
2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7 & 2 & 3 & 4 & 5 & 6 & 7\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
        \end{pmatrix}
    \end{align}
- 存放以及mapping：
    將兩矩陣從DataMem搬移至LocalMem，來源及目標地址如下：
    ```
    mat_A: 0x8000 -> 0x200000
    mat_B: 0x8100 -> 0x200100
    ```
- 結果：
    Matrix calculator結果
    
    ![](https://course.playlab.tw/md/uploads/81b82b43-3e9a-4c8b-b749-a7540fc45720.png)
    
    HW 14-4 Pipelined CPU + SA fetch data
    ```
    sbt 'testOnly acal_lab14.HW14_4_SA.topTest -tbn verilator'
    ```
    ![](https://course.playlab.tw/md/uploads/efbb02e8-a542-48ea-8758-9ed7e8c46223.png)
    > Cycle count = 12776
    

- 如何將 Conv2D 的運算轉換成 Matrix Multiplication？
    用im2col將conv轉換成matrix multiplication，如測資段落所述。
    
- 轉換後的矩陣乘法通常 size 都很大，在 systolic array 大小有限的情況下，你如何讓 SA 能夠支援這麼大的矩陣乘法？
    將矩陣切為多個tile，分次送入SA進行計算，並逐次累加這些tile的值。

- 如何處理這些運算中額外的 data？
    運算過程中的partial sum我會直接存在output matrix的位置。
    並在SA計算的時候，從output matrix讀入先前存起來的partial sum tile，與此次SA計算的結果累加，最後即可得到完整的tile。

- 由於 Lab11 作業的系統與此 Lab 作業的系統並不完全相同，如何更改設計讓兩個 Lab 的結果能夠公平地進行比較 
    因為HW11使用了latency=80的GlobalMem，與此次的latency=1的DataMem不同。應該回去更改HW11的latency，以達到公平的比較。

- Systolic array 能加速matrix multiplication 以及convolution 多少倍呢？ 如果我們沒有限制systolic array 能增加的面積尺寸, 那這個加速的趨勢會一直下去嗎？如果不行，那加速的上限是多少呢？
    為了公平比較，我將**HW 11-1 Pipeline CPU + DataMem**中的DataMe淤latency改為1，與此次**HW 14-4 Pipelined CPU + SA fetch data**的結果進行比較。
    
    * HW11-1
    ```
    sbt 'Test/runMain SoC.top_SoCTest -tbn verilator'
    ```
    > Cycle count = 70404
    
    |![](https://course.playlab.tw/md/uploads/39892ef1-990f-4112-8047-78be7fcdfa7c.png)|
    |---|
    |![](https://course.playlab.tw/md/uploads/744ea132-daab-4d13-a8f5-fa88e407fb17.png)|
    > Cycle count = 70404
    
    * HW14-4
    ```
    sbt 'testOnly acal_lab14.HW14_4_SA.topTest -tbn verilator'
    ```
    ![](https://course.playlab.tw/md/uploads/efbb02e8-a542-48ea-8758-9ed7e8c46223.png)
    > Cycle count = 12776

    加速倍速=70404/12776=5.5106
    
    增加SA面積所帶來的加速趨勢不會一直下去。因為當SA尺寸超過input matrix的尺寸時，代表不用再做partitioned matrix multiplication，則不管SA尺寸繼續變大都還是需要一次的matrix multiplication。
    而且繼續增加SA尺寸可能會造成Global signal的繞線困難或訊號延遲，反而降低SA的效能。
    

- 如果你想要讓 acclerator performance 更好，你覺得你的 design 上能做什麼改善？（增加 PE 數量、加寬 bus bandwidth 除外）
    在目前的設計中，我將DMA修改成能一次傳輸整個matrix的資料，不必分tile進行傳輸。但SA仍然要由CPU program才能做對應tile的計算，這MMIO來回program的過程也消耗了大量cycle數。
    因此目前的設計可以進一步修改成，CPU只要program tile在不同方向上的個數、mat_A/mat_B的起始地址、memory stride等參數後，SA即可自動完成所有tile的計算，而不需CPU針對每個tile都要重新program SA一次。
    
:::




















