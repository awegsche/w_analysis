
/afs/cern.ch/eng/sl/lintrack/miniconda2/bin/python \
  ../Beta-Beat.src/GetLLM/getsuper.py \
  --accel=lhc \
  --lhcmode=lhc_runIII_2023 \
  --beam=1 \
  --twissfile=/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/models/LHCB1/2m_withAllKnobs_bbsrc/twiss.dat \
  --files=/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid1016_Beam1@BunchTurn@2023_04_06@21_34_59_181-1_6600/bunchid1016_Beam1@BunchTurn@2023_04_06@21_34_59_181.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2029_Beam1@BunchTurn@2023_04_06@21_34_59_181-1_6600/bunchid2029_Beam1@BunchTurn@2023_04_06@21_34_59_181.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2456_Beam1@BunchTurn@2023_04_06@21_34_59_181-1_6600/bunchid2456_Beam1@BunchTurn@2023_04_06@21_34_59_181.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid1016_Beam1@BunchTurn@2023_04_06@21_39_57_193-1_6600/bunchid1016_Beam1@BunchTurn@2023_04_06@21_39_57_193.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2029_Beam1@BunchTurn@2023_04_06@21_39_57_193-1_6600/bunchid2029_Beam1@BunchTurn@2023_04_06@21_39_57_193.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2456_Beam1@BunchTurn@2023_04_06@21_39_57_193-1_6600/bunchid2456_Beam1@BunchTurn@2023_04_06@21_39_57_193.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid1016_Beam1@BunchTurn@2023_04_06@21_42_32_413-1_6600/bunchid1016_Beam1@BunchTurn@2023_04_06@21_42_32_413.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2029_Beam1@BunchTurn@2023_04_06@21_42_32_413-1_6600/bunchid2029_Beam1@BunchTurn@2023_04_06@21_42_32_413.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2456_Beam1@BunchTurn@2023_04_06@21_42_32_413-1_6600/bunchid2456_Beam1@BunchTurn@2023_04_06@21_42_32_413.sdds \
  --output=200cm_bbsrc \
  --algorithm=SUSSIX
