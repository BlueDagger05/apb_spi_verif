-----------------------------------
-- Abstract : Simple SPI Protocol
-----------------------------------

-----------------------------------
-- Programmer's Model
--------------------------------------------------------------------------------------------------------------
-- Offset Address |  Operation Type  |  Register Name  |  Field Name 
--------------------------------------------------------------------------------------------------------------
-- 0x00           |  R/W             |  SPIDR          |  [7:0] Received Data
-------------------------------------------------------------------------------------------------------------
-- 0x04           |  R/W             |  SPICR1         |  [7] SPIE  - SPI Interrupt Enable
--                |                  |                 |  [6] SPE   - SPI Enable
--                |                  |                 |  [5] SPTIE - SPI Transmit Interrupt Enable
--                |                  |                 |  [4] MSTR  - Master/Slave
--                |                  |                 |  [3] CPOL  - Clock Polarity
--                |                  |                 |  [2] CPHA  - Clock Phase
--                |                  |                 |  [1] SSOE  - Slave Select Output Enable
--                |                  |                 |  [0] LSBFE - LSB First Enable
--------------------------------------------------------------------------------------------------------------
-- 0x08           |  R/W             |  SPIBR          |  [7] Reserved
--                |                  |                 |  [6] SPPR2 - SPI Baud Rate Pre-Selection Bit
--                |                  |                 |  [5] SPPR1 - SPI Baud Rate Pre-Selection Bit
--                |                  |                 |  [4] SPPR0 - SPI Baud Rate Pre-Selection Bit
--                |                  |                 |  [3] Reserved
--                |                  |                 |  [2] SPR2  - SPI Baud Rate Selection Bit
--                |                  |                 |  [1] SPR1  - SPI Baud Rate Selection Bit
--                |                  |                 |  [0] SPR0  - SPI Baud Rate Selection Bit
--------------------------------------------------------------------------------------------------------------
-- 0x0C           |  R               |  SPISR          |  [7] SPIF  - SPI Interrupt Flag
--                |                  |                 |  [6] Reserved
--                |                  |                 |  [5] SPTEF - SPI Transmit Empty Flag
--                |                  |                 |  [4] MODF  - Mode Fault
--                |                  |                 |  [3] Reserved
--                |                  |                 |  [2] Reserved
--                |                  |                 |  [1] Reserved
--                |                  |                 |  [0] Reserved
--------------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;

entity spi_master is port(
    -- Port Definitions
    CLK:      in std_logic;                    -- Clock
    RESETn:   in std_logic;                    -- Active-low reset
    SSTART:   in std_logic;                    -- Start SPI signal
    SDATA:    in std_logic_vector(7 downto 0); -- SPI Data from APB
    MDATA:    in std_logic_vector(7 downto 0); -- Master Data
    MISO:     in std_logic;                    -- Serial data received from Slave
    SRDATA:  out std_logic_vector(7 downto 0); -- Received data from SPI Slave
    MOSI:    out std_logic;                    -- Serial data sent from Master
    SCLK:    out std_logic;                    -- CLK for Slave
    SSn:     out std_logic;                    -- Slave Select / Chip Select
);
end spi_master;

architecture arch_spi_master of spi_master is
  -- Local ID parameters
  signal SPI_SPIDR  :std_logic_vector(7 downto 0) := 8'b1010_1011; -- Default value -8'hAB
  signal SPI_SPICR1 :std_logic_vector(7 downto 0) := 8'b0001_0000; -- Default Master Mode
  signal SPI_SPIBR  :std_logic_vector(7 downto 0) := 8'b0000_0001; -- Default baud rate divisor 4
  signal SPI_SPISR  :std_logic_vector(7 downto 0) := 8'b0010_0000; -- Default empty transfer
begin


end
arch_spi_master;

