import pathlib
import ruamel.yaml
ryaml = ruamel.yaml.YAML()

from cwlformat.explode import explode, CWLProcess

def explode_cwl_py(cwlfile, outname):
    fp = pathlib.Path(cwlfile).absolute()
    as_dict = ryaml.load(fp.read_text())
    fp_out = pathlib.Path(outname).absolute()
    for n, exploded in enumerate(explode(CWLProcess(as_dict, fp_out))):
        exploded.save()
