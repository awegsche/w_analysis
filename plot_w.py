from dataclasses import dataclass
import tfs
from pandas import DataFrame
from pathlib import Path

from matplotlib import pyplot as plt


plt.rcParams.update({
    "text.usetex": True,
    "font.family": "serif",
    "font.serif": "TeX Gyre Bonum",
    "font.sans-serif": "TeX Gyre Bonum",
    "font.monospace": "Fira Code",
    "mathtext.fontset": "stix",
    "text.latex.preamble": "\\usepackage{xcolor}\n",
})


MSIZE = 4
LWIDTH = 1


def main():
    plot_w("beam1/inj", "b1_inj_omc3.pdf")
    plot_w("beam1/after_correction_W", "b1_inj_bbsrc.pdf")
    plot_w("beam1/200cm_bbsrc", "b1_200cm_bbsrc.pdf", "/user/slops/data/LHC_DATA/OP_DATA/Betabeat/2023-04-06/models/LHCB1/2m_withAllKnobs_bbsrc/twiss_elements.dat")


@dataclass
class Chrom:
    SX: list
    SY: list

    WX: list
    ERRWX: list
    WXMDL: list

    WY: list
    ERRWY: list
    WYMDL: list

    #MDL: Dataframe 

    def __init__(self, SX, WX, ERRWX, SY, WY, ERRWY, WXMDL, WYMDL, MDL):
        self.SX = SX
        self.SY = SY
        self.WX = WX
        self.ERRWX = ERRWX
        self.WY = WY
        self.ERRWY = ERRWY
        self.WXMDL = WXMDL
        self.WYMDL = WYMDL
        self.MDL = MDL


def get_wx(path: str, model = str):

    root = Path(path)
    mdl = tfs.read_tfs(model, index="NAME") if model is not None else None

    if (root / "chrom_beta_x.tfs").exists():
        chromx = tfs.read_tfs(f"{root}/chrom_beta_x.tfs")
        chromy = tfs.read_tfs(f"{root}/chrom_beta_y.tfs")

        return Chrom(chromx["S"], chromx["WX"], chromx["ERRWX"], chromy["S"], chromy["WY"], chromy["ERRWY"], chromx["WXMDL"], chromy["WYMDL"], mdl)

    elif (root / "chrombetax.out").exists():
        chromx = tfs.read_tfs(f"{root}/chrombetax.out")
        chromy = tfs.read_tfs(f"{root}/chrombetay.out")

        return Chrom(chromx["S"], chromx["WX"], chromx["WXERR"], chromy["S"], chromy["WY"], chromy["WYERR"], chromx["WXM"], chromy["WYM"], mdl)

    else:
        raise FileNotFoundError


def plot_w(path: str, out: str, mdl: str = None):

    fig, [ax, ay] = plt.subplots(nrows=2, figsize=(7,5))

    chrom = get_wx(path, mdl)

    ax.errorbar(chrom.SX,
                chrom.WX,
                yerr=chrom.ERRWX,
                fmt=" o",
                markeredgecolor="#000050",
                label="$W_x$",
                markersize=MSIZE,
                linewidth=LWIDTH)

    ax.plot(chrom.SX, chrom.WXMDL, label="$W_x^{MDL}$")

    ay.errorbar(chrom.SY,
                chrom.WY,
                yerr=chrom.ERRWY,
                fmt=" o",
                markeredgecolor="#000050",
                label="$W_y$",
                markersize=MSIZE,
                linewidth=LWIDTH
                )
    ay.plot(chrom.SY, chrom.WYMDL, label="$W_y^{MDL}$")

    lim = 150
    ax.set_ylim(-10, lim)
    ay.set_ylim(-10, lim)

    ax.set_ylabel("$W_x$")
    ax.set_xticks([])
    ay.set_ylabel("$W_y$")
    ay.set_xlabel("$s\\; [m]$")
    ax.legend()

    for ip in range(1,9):
        print_point(ax, chrom.MDL, f"IP{ip}", lim=lim* 1.01)
        print_point(ay, chrom.MDL, f"IP{ip}", lim=lim* 1.01, no_label=True)

    fig.tight_layout()

    fig.savefig(f"plots/{out}")


def print_point(ax, model, key, name=None, lim=1.0, no_label=False):
    if model is None:
        return

    s = model.loc[key, "S"]
    if name is None: 
        name = key
    ax.axvline(x=s, dashes=(4, 2), linewidth=0.5, c='gray')
    if not no_label:
        ax.text(s, lim, name, horizontalalignment="center")

main()
