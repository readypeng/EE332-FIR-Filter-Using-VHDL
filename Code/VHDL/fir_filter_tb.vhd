--------------------------------------------------------------------------------
--
--   FileName:         fir_filter_tb.vhd
--   Dependencies:     types.vhd
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;
USE work.types.ALL;
USE std.textio.ALL;

ENTITY fir_filter_tb IS

END fir_filter_tb;

ARCHITECTURE beha OF fir_filter_tb IS
    COMPONENT fir_filter IS
        PORT (
            clk : IN STD_LOGIC; --system clock
            reset : IN STD_LOGIC; --active low asynchronous reset
            data : IN signed(data_width - 1 DOWNTO 0); --data stream
            coefficients : IN coefficient_array; --coefficient array
            result : OUT STD_LOGIC_VECTOR((data_width + coeff_width + INTEGER(ceil(log2(real(taps)))) - 1) DOWNTO 0)); --filtered result
    END COMPONENT fir_filter;

    SIGNAL clk_tb : STD_LOGIC; --system clock
    SIGNAL reset_tb : STD_LOGIC; --active high asynchronous reset
    SIGNAL data_tb : signed(data_width - 1 DOWNTO 0); --data stream
    SIGNAL coefficients_tb : coefficient_array; --coefficient array
    SIGNAL result_tb : STD_LOGIC_VECTOR((data_width + coeff_width + INTEGER(ceil(log2(real(taps)))) - 1) DOWNTO 0); --filtered result

BEGIN
    UUT : fir_filter PORT MAP(clk => clk_tb, reset => reset_tb, data => data_tb, coefficients => coefficients_tb, result => result_tb);

    clock_gen : PROCESS
        CONSTANT period : TIME := 10 ns;
    BEGIN
        CLK_tb <= '0';
        WAIT FOR period/2;
        CLK_tb <= '1';
        WAIT FOR period/2;
    END PROCESS;

    RESET_tb <= '1', '0' AFTER 10ns;
    -- coefficients assignment
    coefficients_tb(0) <= to_signed(-574, coeff_width);
    coefficients_tb(1) <= to_signed(-910, 16);
    coefficients_tb(2) <= to_signed(301, 16);
    coefficients_tb(3) <= to_signed(1829, 16);
    coefficients_tb(4) <= to_signed(1284, 16);
    coefficients_tb(5) <= to_signed(-2449, 16);
    coefficients_tb(6) <= to_signed(-4745, 16);
    coefficients_tb(7) <= to_signed(416, 16);
    coefficients_tb(8) <= to_signed(13019, 16);
    coefficients_tb(9) <= to_signed(24083, 16);
    --
    coefficients_tb(10) <= to_signed(24083, 16);
    coefficients_tb(11) <= to_signed(13019, 16);
    coefficients_tb(12) <= to_signed(416, 16);
    coefficients_tb(13) <= to_signed(-4745, 16);
    coefficients_tb(14) <= to_signed(-2449, 16);
    coefficients_tb(15) <= to_signed(1284, 16);
    coefficients_tb(16) <= to_signed(1829, 16);
    coefficients_tb(17) <= to_signed(301, 16);
    coefficients_tb(18) <= to_signed(-910, 16);
    coefficients_tb(19) <= to_signed(-574, 16);

    --data stream input
     data_tb <=
    "1001110110000100",
    "0110001001111100" AFTER 10ns,
    "0001011101000000" AFTER 20ns,
    "0001011101000000" AFTER 30ns,
    "0110001001111100" AFTER 40ns,
    "0000000000000000" AFTER 50ns,
    "1001110110000100" AFTER 60ns,
    "1110100011000000" AFTER 70ns,
    "1110100011000000" AFTER 80ns,
    "1001110110000100" AFTER 90ns,
    "0000000000000000" AFTER 100ns,
    "0110001001111100" AFTER 110ns,
    "0001011101000000" AFTER 120ns,
    "0001011101000000" AFTER 130ns,
    "0110001001111100" AFTER 140ns,
    "0000000000000000" AFTER 150ns,
    "1001110110000100" AFTER 160ns,
    "1110100011000000" AFTER 170ns,
    "1110100011000000" AFTER 180ns,
    "1001110110000100" AFTER 190ns,
    "0000000000000000" AFTER 200ns,
    "0110001001111100" AFTER 210ns,
    "0001011101000000" AFTER 220ns,
    "0001011101000000" AFTER 230ns,
    "0110001001111100" AFTER 240ns,
    "0000000000000000" AFTER 250ns,
    "1001110110000100" AFTER 260ns,
    "1110100011000000" AFTER 270ns,
    "1110100011000000" AFTER 280ns,
    "1001110110000100" AFTER 290ns,
    "0000000000000000" AFTER 300ns,
    "0110001001111100" AFTER 310ns,
    "0001011101000000" AFTER 320ns,
    "0001011101000000" AFTER 330ns,
    "0110001001111100" AFTER 340ns,
    "0000000000000000" AFTER 350ns,
    "1001110110000100" AFTER 360ns,
    "1110100011000000" AFTER 370ns,
    "1110100011000000" AFTER 380ns,
    "1001110110000100" AFTER 390ns,
    "0000000000000000" AFTER 400ns,
    "0110001001111100" AFTER 410ns,
    "0001011101000000" AFTER 420ns,
    "0001011101000000" AFTER 430ns,
    "0110001001111100" AFTER 440ns,
    "0000000000000000" AFTER 450ns,
    "1001110110000100" AFTER 460ns,
    "1110100011000000" AFTER 470ns,
    "1110100011000000" AFTER 480ns,
    "1001110110000100" AFTER 490ns,
    "0000000000000000" AFTER 500ns,
    "0110001001111100" AFTER 510ns,
    "0001011101000000" AFTER 520ns,
    "0001011101000000" AFTER 530ns,
    "0110001001111100" AFTER 540ns,
    "0000000000000000" AFTER 550ns,
    "1001110110000100" AFTER 560ns,
    "1110100011000000" AFTER 570ns,
    "1110100011000000" AFTER 580ns,
    "1001110110000100" AFTER 590ns,
    "0000000000000000" AFTER 600ns,
    "0110001001111100" AFTER 610ns,
    "0001011101000000" AFTER 620ns,
    "0001011101000000" AFTER 630ns,
    "0110001001111100" AFTER 640ns,
    "0000000000000000" AFTER 650ns,
    "1001110110000100" AFTER 660ns,
    "1110100011000000" AFTER 670ns,
    "1110100011000000" AFTER 680ns,
    "1001110110000100" AFTER 690ns,
    "0000000000000000" AFTER 700ns,
    "0110001001111100" AFTER 710ns,
    "0001011101000000" AFTER 720ns,
    "0001011101000000" AFTER 730ns,
    "0110001001111100" AFTER 740ns,
    "0000000000000000" AFTER 750ns,
    "1001110110000100" AFTER 760ns,
    "1110100011000000" AFTER 770ns,
    "1110100011000000" AFTER 780ns,
    "1001110110000100" AFTER 790ns,
    "0000000000000000" AFTER 800ns,
    "0110001001111100" AFTER 810ns,
    "0001011101000000" AFTER 820ns,
    "0001011101000000" AFTER 830ns,
    "0110001001111100" AFTER 840ns,
    "0000000000000000" AFTER 850ns,
    "1001110110000100" AFTER 860ns,
    "1110100011000000" AFTER 870ns,
    "1110100011000000" AFTER 880ns,
    "1001110110000100" AFTER 890ns,
    "0000000000000000" AFTER 900ns,
    "0110001001111100" AFTER 910ns,
    "0001011101000000" AFTER 920ns,
    "0001011101000000" AFTER 930ns,
    "0110001001111100" AFTER 940ns,
    "0000000000000000" AFTER 950ns,
    "1001110110000100" AFTER 960ns,
    "1110100011000000" AFTER 970ns,
    "1110100011000000" AFTER 980ns,
    "1001110110000100" AFTER 990ns,
    "0000000000000000" AFTER 1000ns,
    "0110001001111100" AFTER 1010ns,
    "0001011101000000" AFTER 1020ns,
    "0001011101000000" AFTER 1030ns,
    "0110001001111100" AFTER 1040ns,
    "0000000000000000" AFTER 1050ns,
    "1001110110000100" AFTER 1060ns,
    "1110100011000000" AFTER 1070ns,
    "1110100011000000" AFTER 1080ns,
    "1001110110000100" AFTER 1090ns,
    "0000000000000000" AFTER 1100ns,
    "0110001001111100" AFTER 1110ns,
    "0001011101000000" AFTER 1120ns,
    "0001011101000000" AFTER 1130ns,
    "0110001001111100" AFTER 1140ns,
    "0000000000000000" AFTER 1150ns,
    "1001110110000100" AFTER 1160ns,
    "1110100011000000" AFTER 1170ns,
    "1110100011000000" AFTER 1180ns,
    "1001110110000100" AFTER 1190ns,
    "0000000000000000" AFTER 1200ns,
    "0110001001111100" AFTER 1210ns,
    "0001011101000000" AFTER 1220ns,
    "0001011101000000" AFTER 1230ns,
    "0110001001111100" AFTER 1240ns,
    "0000000000000000" AFTER 1250ns,
    "1001110110000100" AFTER 1260ns,
    "1110100011000000" AFTER 1270ns,
    "1110100011000000" AFTER 1280ns,
    "1001110110000100" AFTER 1290ns,
    "0000000000000000" AFTER 1300ns,
    "0110001001111100" AFTER 1310ns,
    "0001011101000000" AFTER 1320ns,
    "0001011101000000" AFTER 1330ns,
    "0110001001111100" AFTER 1340ns,
    "0000000000000000" AFTER 1350ns,
    "1001110110000100" AFTER 1360ns,
    "1110100011000000" AFTER 1370ns,
    "1110100011000000" AFTER 1380ns,
    "1001110110000100" AFTER 1390ns,
    "0000000000000000" AFTER 1400ns,
    "0110001001111100" AFTER 1410ns,
    "0001011101000000" AFTER 1420ns,
    "0001011101000000" AFTER 1430ns,
    "0110001001111100" AFTER 1440ns,
    "0000000000000000" AFTER 1450ns,
    "1001110110000100" AFTER 1460ns,
    "1110100011000000" AFTER 1470ns,
    "1110100011000000" AFTER 1480ns,
    "1001110110000100" AFTER 1490ns,
    "0000000000000000" AFTER 1500ns,
    "0110001001111100" AFTER 1510ns,
    "0001011101000000" AFTER 1520ns,
    "0001011101000000" AFTER 1530ns,
    "0110001001111100" AFTER 1540ns,
    "0000000000000000" AFTER 1550ns,
    "1001110110000100" AFTER 1560ns,
    "1110100011000000" AFTER 1570ns,
    "1110100011000000" AFTER 1580ns,
    "1001110110000100" AFTER 1590ns,
    "0000000000000000" AFTER 1600ns,
    "0110001001111100" AFTER 1610ns,
    "0001011101000000" AFTER 1620ns,
    "0001011101000000" AFTER 1630ns,
    "0110001001111100" AFTER 1640ns,
    "0000000000000000" AFTER 1650ns,
    "1001110110000100" AFTER 1660ns,
    "1110100011000000" AFTER 1670ns,
    "1110100011000000" AFTER 1680ns,
    "1001110110000100" AFTER 1690ns,
    "0000000000000000" AFTER 1700ns,
    "0110001001111100" AFTER 1710ns,
    "0001011101000000" AFTER 1720ns,
    "0001011101000000" AFTER 1730ns,
    "0110001001111100" AFTER 1740ns,
    "0000000000000000" AFTER 1750ns,
    "1001110110000100" AFTER 1760ns,
    "1110100011000000" AFTER 1770ns,
    "1110100011000000" AFTER 1780ns,
    "1001110110000100" AFTER 1790ns,
    "0000000000000000" AFTER 1800ns,
    "0110001001111100" AFTER 1810ns,
    "0001011101000000" AFTER 1820ns,
    "0001011101000000" AFTER 1830ns,
    "0110001001111100" AFTER 1840ns,
    "0000000000000000" AFTER 1850ns,
    "1001110110000100" AFTER 1860ns,
    "1110100011000000" AFTER 1870ns,
    "1110100011000000" AFTER 1880ns,
    "1001110110000100" AFTER 1890ns,
    "0000000000000000" AFTER 1900ns,
    "0110001001111100" AFTER 1910ns,
    "0001011101000000" AFTER 1920ns,
    "0001011101000000" AFTER 1930ns,
    "0110001001111100" AFTER 1940ns,
    "0000000000000000" AFTER 1950ns,
    "1001110110000100" AFTER 1960ns,
    "1110100011000000" AFTER 1970ns,
    "1110100011000000" AFTER 1980ns,
    "1001110110000100" AFTER 1990ns,
    "0000000000000000" AFTER 2000ns,
    "0110001001111100" AFTER 2010ns,
    "0001011101000000" AFTER 2020ns,
    "0001011101000000" AFTER 2030ns,
    "0110001001111100" AFTER 2040ns,
    "0000000000000000" AFTER 2050ns,
    "1001110110000100" AFTER 2060ns,
    "1110100011000000" AFTER 2070ns,
    "1110100011000000" AFTER 2080ns,
    "1001110110000100" AFTER 2090ns,
    "0000000000000000" AFTER 2100ns,
    "0110001001111100" AFTER 2110ns,
    "0001011101000000" AFTER 2120ns,
    "0001011101000000" AFTER 2130ns,
    "0110001001111100" AFTER 2140ns,
    "0000000000000000" AFTER 2150ns,
    "1001110110000100" AFTER 2160ns,
    "1110100011000000" AFTER 2170ns,
    "1110100011000000" AFTER 2180ns,
    "1001110110000100" AFTER 2190ns,
    "0000000000000000" AFTER 2200ns,
    "0110001001111100" AFTER 2210ns,
    "0001011101000000" AFTER 2220ns,
    "0001011101000000" AFTER 2230ns,
    "0110001001111100" AFTER 2240ns,
    "0000000000000000" AFTER 2250ns,
    "1001110110000100" AFTER 2260ns,
    "1110100011000000" AFTER 2270ns,
    "1110100011000000" AFTER 2280ns,
    "1001110110000100" AFTER 2290ns,
    "0000000000000000" AFTER 2300ns,
    "0110001001111100" AFTER 2310ns,
    "0001011101000000" AFTER 2320ns,
    "0001011101000000" AFTER 2330ns,
    "0110001001111100" AFTER 2340ns,
    "0000000000000000" AFTER 2350ns,
    "1001110110000100" AFTER 2360ns,
    "1110100011000000" AFTER 2370ns,
    "1110100011000000" AFTER 2380ns,
    "1001110110000100" AFTER 2390ns,
    "1001110110000100" AFTER 2400ns;
END beha;