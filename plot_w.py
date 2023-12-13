from dataclasses import dataclass
import tfs
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
    plot_w("beam1/200cm_bbsrc", "b1_200cm_bbsrc.pdf")


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

    def __init__(self, SX, WX, ERRWX, SY, WY, ERRWY, WXMDL, WYMDL):
        self.SX = SX
        self.SY = SY
        self.WX = WX
        self.ERRWX = ERRWX
        self.WY = WY
        self.ERRWY = ERRWY
        self.WXMDL = WXMDL
        self.WYMDL = WYMDL


def get_wx(path: str):

    root = Path(path)

    if (root / "chrom_beta_x.tfs").exists():
        chromx = tfs.read_tfs(f"{root}/chrom_beta_x.tfs")
        chromy = tfs.read_tfs(f"{root}/chrom_beta_y.tfs")

        return Chrom(chromx["S"], chromx["WX"], chromx["ERRWX"], chromy["S"], chromy["WY"], chromy["ERRWY"], chromx["WXMDL"], chromy["WYMDL"])

    elif (root / "chrombetax.out").exists():
        chromx = tfs.read_tfs(f"{root}/chrombetax.out")
        chromy = tfs.read_tfs(f"{root}/chrombetay.out")

        return Chrom(chromx["S"], chromx["WX"], chromx["WXERR"], chromy["S"], chromy["WY"], chromy["WYERR"], chromx["WXM"], chromy["WYM"])

    else:
        raise FileNotFoundError


def plot_w(path: str, out: str):

    fig, [ax, ay] = plt.subplots(nrows=2, figsize=(8,6))

    chrom = get_wx(path)

    ax.errorbar(chrom.SX,
                chrom.WX,
                yerr=chrom.ERRWX,
                fmt=" o",
                markeredgecolor="k",
                label="$W_x$",
                markersize=MSIZE,
                linewidth=LWIDTH)

    ax.plot(chrom.SX, chrom.WXMDL, label="$W_x^{MDL}$")

    ay.errorbar(chrom.SY,
                chrom.WY,
                yerr=chrom.ERRWY,
                fmt=" o",
                markeredgecolor="k",
                label="$W_y$",
                markersize=MSIZE,
                linewidth=LWIDTH
                )
    ay.plot(chrom.SY, chrom.WYMDL, label="$W_y^{MDL}$")

    ax.set_ylim(0, 100)
    ay.set_ylim(0, 100)

    ax.set_ylabel("$W_x$")
    ax.set_xticks([])
    ay.set_ylabel("$W_y$")
    ay.set_xlabel("$s\\; [m]$")
    ax.legend()


    fig.tight_layout()

    fig.savefig(out)


main()
