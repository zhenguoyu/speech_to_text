from funasr import AutoModel
from funasr.utils.postprocess_utils import rich_transcription_postprocess
import argparse

model_dir = "iic/SenseVoiceSmall"

parser = argparse.ArgumentParser()

parser.add_argument("-f", "--file", help="filename")  # 文件参数

args = parser.parse_args()
audio_file = args.file

if audio_file == "":
    quit("audio file is required")

model = AutoModel(
    model=model_dir,
    vad_model="fsmn-vad",
    vad_kwargs={"max_single_segment_time": 30000},
    device="cuda:0",
)

print("正在解析文件%s" % audio_file)
# zh
res = model.generate(
    input=audio_file,
    cache={},
    language="auto",  # "zn", "en", "yue", "ja", "ko", "nospeech"
    use_itn=True,
    batch_size_s=60,
    merge_vad=True,  #
    merge_length_s=15,
)
text = rich_transcription_postprocess(res[0]["text"])
print(text)