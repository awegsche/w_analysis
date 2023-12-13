#!/bin/bash

/afs/cern.ch/eng/sl/lintrack/omc_python_edge/bin/python -m omc3.hole_in_one \
  --optics \
  --files \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_28_14_348/bunchid0_Beam1@BunchTurn@2023_08_30@17_28_14_348.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_29_34_502/bunchid0_Beam1@BunchTurn@2023_08_30@17_29_34_502.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_31_23_066/bunchid0_Beam1@BunchTurn@2023_08_30@17_31_23_066.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_32_36_044/bunchid0_Beam1@BunchTurn@2023_08_30@17_32_36_044.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_34_47_213/bunchid0_Beam1@BunchTurn@2023_08_30@17_34_47_213.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_38_33_988/bunchid0_Beam1@BunchTurn@2023_08_30@17_38_33_988.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_28_14_348/bunchid183_Beam1@BunchTurn@2023_08_30@17_28_14_348.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_29_34_502/bunchid183_Beam1@BunchTurn@2023_08_30@17_29_34_502.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_31_23_066/bunchid183_Beam1@BunchTurn@2023_08_30@17_31_23_066.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_32_36_044/bunchid183_Beam1@BunchTurn@2023_08_30@17_32_36_044.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_34_47_213/bunchid183_Beam1@BunchTurn@2023_08_30@17_34_47_213.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_38_33_988/bunchid183_Beam1@BunchTurn@2023_08_30@17_38_33_988.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_28_14_348/bunchid427_Beam1@BunchTurn@2023_08_30@17_28_14_348.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_29_34_502/bunchid427_Beam1@BunchTurn@2023_08_30@17_29_34_502.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_31_23_066/bunchid427_Beam1@BunchTurn@2023_08_30@17_31_23_066.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_32_36_044/bunchid427_Beam1@BunchTurn@2023_08_30@17_32_36_044.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_34_47_213/bunchid427_Beam1@BunchTurn@2023_08_30@17_34_47_213.sdds \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_38_33_988/bunchid427_Beam1@BunchTurn@2023_08_30@17_38_33_988.sdds \
  --outputdir inj \
  --calibrationdir /afs/cern.ch/eng/sl/lintrack/LHC_commissioning2017/Calibration_factors_2017/Calibration_factors_2017_beam1 \
  --accel lhc \
  --model_dir /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Models/b1_inj_28_31 \
  --year 2022 \
  --chromatic_beating \
  --beam 1

