# W-analysis

## Setup

- Create access to lintrack:
 
  mount, link, whatever suits you best. I linked it to

  `ln -s  /user/slops/data/LHC_DATA/OP_DATA/Betabeat lintrack`

- Get modified `Beta-Beat.src`:

  `git clone -b getsuper_accmodels git@github.com:pylhc/Beta-Beat.src.git`

- `pip install omc3` into your python env


## Procedure

### omc3

- copy `command.run`, delete the logging part (ideally leave only the call to `python -m omc3`,
but you can leave `ssh optics2`)
- change `outpudir` to the new one (otherwise it would overwrite the original, BAD!!!!)
- add `--chromatic_beating`
- 
The file should now look like this:
```sh
/afs/cern.ch/eng/sl/lintrack/omc_python_edge/bin/python -m omc3.hole_in_one \
  --optics \
  --files \
  /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Measurements/Beam1@BunchTurn@2023_08_30@17_28_14_348/bunchid0_Beam1@BunchTurn@2023_08_30@17_28_14_348.sdds \
  --outputdir inj \
  --calibrationdir /afs/cern.ch/eng/sl/lintrack/LHC_commissioning2017/Calibration_factors_2017/Calibration_factors_2017_beam1 \
  --accel lhc \
  --model_dir /user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-08-30/LHCB1/Models/b1_inj_28_31 \
  --year 2022 \
  --chromatic_beating \
  --beam 1
```
- rerun (e.g. `chmod` and `./command.run`)


### Beta-Beat.src

- same as for omc3: copy `command.run`, delete the logging part (ideally leave only the call to `python -m omc3`,
but you can leave `ssh optics2`)
- change `outpudir` to the new one (otherwise it would overwrite the original, BAD!!!!)
- change `--accel` option to `lhc` instead of `LHCB<beam_number>`
- add `--lhcmode=lhc_runIII_2023`, `--beam=<beam_number>`
- change `--model` to `--twiss_file`
- change `--tbt_analysis` to `--algorithm`

The file should look like this:
```sh
/afs/cern.ch/eng/sl/lintrack/miniconda2/bin/python \
  ../Beta-Beat.src/GetLLM/getsuper.py \
  --accel=lhc \
  --lhcmode=lhc_runIII_2023 \
  --beam=1 \
  --twissfile=/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/models/LHCB1/2m_withAllKnobs_bbsrc/twiss.dat \
  --files=/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid1016_Beam1@BunchTurn@2023_04_06@21_34_59_181-1_6600/bunchid1016_Beam1@BunchTurn@2023_04_06@21_34_59_181.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2029_Beam1@BunchTurn@2023_04_06@21_34_59_181-1_6600/bunchid2029_Beam1@BunchTurn@2023_04_06@21_34_59_181.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2456_Beam1@BunchTurn@2023_04_06@21_34_59_181-1_6600/bunchid2456_Beam1@BunchTurn@2023_04_06@21_34_59_181.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid1016_Beam1@BunchTurn@2023_04_06@21_39_57_193-1_6600/bunchid1016_Beam1@BunchTurn@2023_04_06@21_39_57_193.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2029_Beam1@BunchTurn@2023_04_06@21_39_57_193-1_6600/bunchid2029_Beam1@BunchTurn@2023_04_06@21_39_57_193.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2456_Beam1@BunchTurn@2023_04_06@21_39_57_193-1_6600/bunchid2456_Beam1@BunchTurn@2023_04_06@21_39_57_193.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid1016_Beam1@BunchTurn@2023_04_06@21_42_32_413-1_6600/bunchid1016_Beam1@BunchTurn@2023_04_06@21_42_32_413.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2029_Beam1@BunchTurn@2023_04_06@21_42_32_413-1_6600/bunchid2029_Beam1@BunchTurn@2023_04_06@21_42_32_413.sdds,/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/LHCB1/Measurements/bunchid2456_Beam1@BunchTurn@2023_04_06@21_42_32_413-1_6600/bunchid2456_Beam1@BunchTurn@2023_04_06@21_42_32_413.sdds \
  --output=200cm_bbsrc \
  --algorithm=SUSSIX
```

## Measurements to re-analyse

### 200cm

- [x] Beam1: `lintrack/2023-04-06/LHCB1/Results/OnOffMom_2m_withAllKnobs_BK_bbsrc/`
- [ ] Beam2: `lintrack/2023-04-06/LHCB2/Results/BBsrc_200cm_Quick_Check`, not sure if on/off mom

### 120cm

- [ ] Beam1: `lintrack/2023-04-06/LHCB1/Results/1.2m_Knobs_noBK_OnMom_omc3/`, not sure if on/off mom
- [ ] Beam2: `lintrack/2023-04-06/LHCB2/Results/OMC3_120cm_on_off_momentum`, for sure on/off mom

### 60cm

- [ ] Beam1:
- [ ] Beam2:

### 30cm

- [ ] Beam1:
- [ ] Beam2:
