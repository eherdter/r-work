library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

SSH_2_13 = open.ncdf("dt_global_allsat_msla_h_y2013_m02.nc")

lats = get.var.ncdf(SSH_2_13, "lat")
## the latsU correspond to the sla lats and longs 
lons = get.var.ncdf(SSH_2_13, "lon")


######  for June 2006 ####

# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
SSH_2_13_A =get.var.ncdf(SSH_2_13, "sla", start= c(1085,477,1), count=c(1,1,1))


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
SSH_2_13_B = get.var.ncdf(SSH_2_13, "sla", start=c(1103, 473, 1), count= c(1,1,1))


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
SSH_2_13_C = get.var.ncdf(SSH_2_13, "sla", start=c(1078, 475, 1), count= c(1,1,1))


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
SSH_2_13_D = get.var.ncdf(SSH_2_13, "sla", start=c(1078, 473, 1), count= c(1,1,1))


# for station 58 ~ 475, 1073
SSH_2_13_E = get.var.ncdf(SSH_2_13, "sla", start=c(1073, 475, 1), count= c(1,1,1))


# for station BR3440, (472, 1103)
SSH_2_13_F = get.var.ncdf(SSH_2_13, "sla", start=c(1103, 472, 1), count= c(1,1,1))

#for station PC0610 and PC0620, ~ (478, 1098)
SSH_2_13_G = get.var.ncdf(SSH_2_13, "sla", start=c(1098, 478, 1), count= c(1,1,1))


# for PC1220, 33, 34, (476,1083)
SSH_2_13_H = get.var.ncdf(SSH_2_13, "sla", start=c(1083, 476, 1), count= c(1,1,1))


#for PC1320, He265, 37 ~ (474, 1078)
SSH_2_13_I = get.var.ncdf(SSH_2_13, "sla", start=c(1078, 474, 1), count= c(1,1,1))


# For PC1520 ~ (479, 1087)
SSH_2_13_J = get.var.ncdf(SSH_2_13, "sla", start=c(1087, 479, 1), count= c(1,1,1))


#For PC81460 (479, 1091)
SSH_2_13_K = get.var.ncdf(SSH_2_13, "sla", start=c(1091, 479, 1), count= c(1,1,1))


# For BOR0340 (471, 1104)
SSH_2_13_L = get.var.ncdf(SSH_2_13, "sla", start=c(1104, 471, 1), count= c(1,1,1))


# for BR0320 (471, 1107)
SSH_2_13_M = get.var.ncdf(SSH_2_13, "sla", start=c(1107, 471, 1), count= c(1,1,1))


#For 82 (472, 1102)
SSH_2_13_N = get.var.ncdf(SSH_2_13, "sla", start=c(1102, 472, 1), count= c(1,1,1))


# For WB16150 (475, 1080)
SSH_2_13_O = get.var.ncdf(SSH_2_13, "sla", start=c(1080, 475, 1), count= c(1,1,1))


For #51 (476, 1080)
SSH_2_13_P = get.var.ncdf(SSH_2_13, "sla", start=c(1080, 476, 1), count= c(1,1,1))

# for 16 (476, 1100)
SSH_2_13_Q = get.var.ncdf(SSH_2_13, "sla", start=c(1100, 476, 1), count= c(1,1,1))

# For 15 (476,1101)
SSH_2_13_R = get.var.ncdf(SSH_2_13, "sla", start=c(1101, 476, 1), count= c(1,1,1))


#For 28 (477, 1086)
SSH_2_13_S = get.var.ncdf(SSH_2_13, "sla", start=c(1086, 477, 1), count= c(1,1,1))


SSH_2_13_T = get.var.ncdf(SSH_2_13, "sla", start=c(1102, 477, 1), count= c(1,1,1))


#for Br 4/5 10 (477 1105)
SSH_2_13_U = get.var.ncdf(SSH_2_13, "sla", start=c(1105, 477, 1), count= c(1,1,1))


# for 27, PC1020 (478, 1086)
SSH_2_13_V = get.var.ncdf(SSH_2_13, "sla", start=c(1086, 478, 1), count= c(1,1,1))


# for PC1010 (479,1086)
SSH_2_13_W = get.var.ncdf(SSH_2_13, "sla", start=c(1086, 479, 1), count= c(1,1,1))


# for PC0920 (479, 1088)
SSH_2_13_X = get.var.ncdf(SSH_2_13, "sla", start=c(1088, 479, 1), count= c(1,1,1))


# For PC0910 (480, 1088)
SSH_2_13_Y = get.var.ncdf(SSH_2_13, "sla", start=c(1088, 480, 1), count= c(1,1,1))


# for PC1420 (480,1091) 
SSH_2_13_Z = get.var.ncdf(SSH_2_13, "sla", start=c(1091, 480, 1), count= c(1,1,1))


# For WBSL840 (480, 1092)
SSH_2_13_AA = get.var.ncdf(SSH_2_13, "sla", start=c(1092, 480, 1), count= c(1,1,1))


# for PC0720 (481, 1095)
SSH_2_13_BB = get.var.ncdf(SSH_2_13, "sla", start=c(1095, 481, 1), count= c(1,1,1))


# for PC1510 (481, 1087)
SSH_2_13_CC = get.var.ncdf(SSH_2_13, "sla", start=c(1087, 481, 1), count= c(1,1,1))


#for PC0710 (482, 1096)
SSH_2_13_DD = get.var.ncdf(SSH_2_13, "sla", start=c(1096, 482, 1), count= c(1,1,1))


letters = c("A", "B", "C", "D","E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "BB", "CC", "DD")

mat_2_13= c(SSH_2_13_A, SSH_2_13_B, SSH_2_13_C, SSH_2_13_D, SSH_2_13_E, SSH_2_13_F, SSH_2_13_G, SSH_2_13_H, SSH_2_13_I, SSH_2_13_J, SSH_2_13_K, SSH_2_13_L, SSH_2_13_M, SSH_2_13_N, SSH_2_13_O, SSH_2_13_P, SSH_2_13_Q, SSH_2_13_R, SSH_2_13_S, SSH_2_13_T, SSH_2_13_U, SSH_2_13_V, SSH_2_13_W, SSH_2_13_X, SSH_2_13_Y, SSH_2_13_Z, SSH_2_13_AA, SSH_2_13_BB, SSH_2_13_CC, SSH_2_13_DD)

mat_2_13 <- data.frame(cbind(letters, mat_2_13))