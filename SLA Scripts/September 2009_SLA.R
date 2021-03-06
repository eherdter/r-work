### June 2, 2014 ## getting ssh anomalies for all stations using DT_MSLA (monthly mean sea level anomolies)

library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

SSH_9_9 = open.ncdf("dt_global_allsat_msla_h_y2009_m09.nc")

lats = get.var.ncdf(SSH_9_9, "lat")
## the latsU correspond to the sla lats and longs 
lons = get.var.ncdf(SSH_9_9, "lon")


######  for June 2006 ####

# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
SSH_9_9_A =get.var.ncdf(SSH_9_9, "sla", start= c(1085,477,1), count=c(1,1,1))


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
SSH_9_9_B = get.var.ncdf(SSH_9_9, "sla", start=c(1103, 473, 1), count= c(1,1,1))


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
SSH_9_9_C = get.var.ncdf(SSH_9_9, "sla", start=c(1078, 475, 1), count= c(1,1,1))


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
SSH_9_9_D = get.var.ncdf(SSH_9_9, "sla", start=c(1078, 473, 1), count= c(1,1,1))


# for station 58 ~ 475, 1073
SSH_9_9_E = get.var.ncdf(SSH_9_9, "sla", start=c(1073, 475, 1), count= c(1,1,1))


# for station BR3440, (472, 1103)
SSH_9_9_F = get.var.ncdf(SSH_9_9, "sla", start=c(1103, 472, 1), count= c(1,1,1))

#for station PC0610 and PC0620, ~ (478, 1098)
SSH_9_9_G = get.var.ncdf(SSH_9_9, "sla", start=c(1098, 478, 1), count= c(1,1,1))


# for PC1220, 33, 34, (476,1083)
SSH_9_9_H = get.var.ncdf(SSH_9_9, "sla", start=c(1083, 476, 1), count= c(1,1,1))


#for PC1320, He265, 37 ~ (474, 1078)
SSH_9_9_I = get.var.ncdf(SSH_9_9, "sla", start=c(1078, 474, 1), count= c(1,1,1))


# For PC1520 ~ (479, 1087)
SSH_9_9_J = get.var.ncdf(SSH_9_9, "sla", start=c(1087, 479, 1), count= c(1,1,1))


#For PC81460 (479, 1091)
SSH_9_9_K = get.var.ncdf(SSH_9_9, "sla", start=c(1091, 479, 1), count= c(1,1,1))


# For BOR0340 (471, 1104)
SSH_9_9_L = get.var.ncdf(SSH_9_9, "sla", start=c(1104, 471, 1), count= c(1,1,1))


# for BR0320 (471, 1107)
SSH_9_9_M = get.var.ncdf(SSH_9_9, "sla", start=c(1107, 471, 1), count= c(1,1,1))


#For 82 (472, 1102)
SSH_9_9_N = get.var.ncdf(SSH_9_9, "sla", start=c(1102, 472, 1), count= c(1,1,1))


# For WB16150 (475, 1080)
SSH_9_9_O = get.var.ncdf(SSH_9_9, "sla", start=c(1080, 475, 1), count= c(1,1,1))


For #51 (476, 1080)
SSH_9_9_P = get.var.ncdf(SSH_9_9, "sla", start=c(1080, 476, 1), count= c(1,1,1))

# for 16 (476, 1100)
SSH_9_9_Q = get.var.ncdf(SSH_9_9, "sla", start=c(1100, 476, 1), count= c(1,1,1))

# For 15 (476,1101)
SSH_9_9_R = get.var.ncdf(SSH_9_9, "sla", start=c(1101, 476, 1), count= c(1,1,1))


#For 28 (477, 1086)
SSH_9_9_S = get.var.ncdf(SSH_9_9, "sla", start=c(1086, 477, 1), count= c(1,1,1))


SSH_9_9_T = get.var.ncdf(SSH_9_9, "sla", start=c(1102, 477, 1), count= c(1,1,1))


#for Br 4/5 10 (477 1105)
SSH_9_9_U = get.var.ncdf(SSH_9_9, "sla", start=c(1105, 477, 1), count= c(1,1,1))


# for 27, PC1020 (478, 1086)
SSH_9_9_V = get.var.ncdf(SSH_9_9, "sla", start=c(1086, 478, 1), count= c(1,1,1))


# for PC1010 (479,1086)
SSH_9_9_W = get.var.ncdf(SSH_9_9, "sla", start=c(1086, 479, 1), count= c(1,1,1))


# for PC0920 (479, 1088)
SSH_9_9_X = get.var.ncdf(SSH_9_9, "sla", start=c(1088, 479, 1), count= c(1,1,1))


# For PC0910 (480, 1088)
SSH_9_9_Y = get.var.ncdf(SSH_9_9, "sla", start=c(1088, 480, 1), count= c(1,1,1))


# for PC1420 (480,1091) 
SSH_9_9_Z = get.var.ncdf(SSH_9_9, "sla", start=c(1091, 480, 1), count= c(1,1,1))


# For WBSL840 (480, 1092)
SSH_9_9_AA = get.var.ncdf(SSH_9_9, "sla", start=c(1092, 480, 1), count= c(1,1,1))


# for PC0720 (481, 1095)
SSH_9_9_BB = get.var.ncdf(SSH_9_9, "sla", start=c(1095, 481, 1), count= c(1,1,1))


# for PC1510 (481, 1087)
SSH_9_9_CC = get.var.ncdf(SSH_9_9, "sla", start=c(1087, 481, 1), count= c(1,1,1))


#for PC0710 (482, 1096)
SSH_9_9_DD = get.var.ncdf(SSH_9_9, "sla", start=c(1096, 482, 1), count= c(1,1,1))


letters = c("A", "B", "C", "D","E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "BB", "CC", "DD")

SSH = c(SSH_9_9_A, SSH_9_9_B, SSH_9_9_C, SSH_9_9_D, SSH_9_9_E, SSH_9_9_F, SSH_9_9_G, SSH_9_9_H, SSH_9_9_I, SSH_9_9_J, SSH_9_9_K, SSH_9_9_L, SSH_9_9_M, SSH_9_9_N, SSH_9_9_O, SSH_9_9_P, SSH_9_9_Q, SSH_9_9_R, SSH_9_9_S, SSH_9_9_T, SSH_9_9_U, SSH_9_9_V, SSH_9_9_W, SSH_9_9_X, SSH_9_9_Y, SSH_9_9_Z, SSH_9_9_AA, SSH_9_9_BB, SSH_9_9_CC, SSH_9_9_DD)

working <- data.frame(cbind(letters, SSH))