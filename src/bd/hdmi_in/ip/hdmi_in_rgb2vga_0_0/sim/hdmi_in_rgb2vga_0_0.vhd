-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: digilentinc.com:ip:rgb2vga:1.0
-- IP Revision: 3

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY hdmi_in_rgb2vga_0_0 IS
  PORT (
    rgb_pData : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    rgb_pVDE : IN STD_LOGIC;
    rgb_pHSync : IN STD_LOGIC;
    rgb_pVSync : IN STD_LOGIC;
    PixelClk : IN STD_LOGIC;
    vga_pRed : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    vga_pGreen : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    vga_pBlue : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    vga_pHSync : OUT STD_LOGIC;
    vga_pVSync : OUT STD_LOGIC
  );
END hdmi_in_rgb2vga_0_0;

ARCHITECTURE hdmi_in_rgb2vga_0_0_arch OF hdmi_in_rgb2vga_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF hdmi_in_rgb2vga_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT rgb2vga IS
    GENERIC (
      VID_IN_DATA_WIDTH : INTEGER;
      kRedDepth : INTEGER;
      kGreenDepth : INTEGER;
      kBlueDepth : INTEGER
    );
    PORT (
      rgb_pData : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      rgb_pVDE : IN STD_LOGIC;
      rgb_pHSync : IN STD_LOGIC;
      rgb_pVSync : IN STD_LOGIC;
      PixelClk : IN STD_LOGIC;
      vga_pRed : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      vga_pGreen : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      vga_pBlue : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      vga_pHSync : OUT STD_LOGIC;
      vga_pVSync : OUT STD_LOGIC
    );
  END COMPONENT rgb2vga;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF rgb_pData: SIGNAL IS "xilinx.com:interface:vid_io:1.0 vid_in DATA";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_pVDE: SIGNAL IS "xilinx.com:interface:vid_io:1.0 vid_in ACTIVE_VIDEO";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_pHSync: SIGNAL IS "xilinx.com:interface:vid_io:1.0 vid_in HSYNC";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_pVSync: SIGNAL IS "xilinx.com:interface:vid_io:1.0 vid_in VSYNC";
  ATTRIBUTE X_INTERFACE_INFO OF PixelClk: SIGNAL IS "xilinx.com:signal:clock:1.0 signal_clock CLK";
BEGIN
  U0 : rgb2vga
    GENERIC MAP (
      VID_IN_DATA_WIDTH => 24,
      kRedDepth => 5,
      kGreenDepth => 6,
      kBlueDepth => 5
    )
    PORT MAP (
      rgb_pData => rgb_pData,
      rgb_pVDE => rgb_pVDE,
      rgb_pHSync => rgb_pHSync,
      rgb_pVSync => rgb_pVSync,
      PixelClk => PixelClk,
      vga_pRed => vga_pRed,
      vga_pGreen => vga_pGreen,
      vga_pBlue => vga_pBlue,
      vga_pHSync => vga_pHSync,
      vga_pVSync => vga_pVSync
    );
END hdmi_in_rgb2vga_0_0_arch;
