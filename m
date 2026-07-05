Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C43542D4;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282063; cv=none; b=mLAU2mPGo/M8E6CHdvkHB1xX6Tj+7FtpV/htSi2/E4dyLy6pHs1wuJKPga+BmMpD0G2KeDu15+K7EZX41xavEQzgGham/trCy5XNtEqNHTdkXhW8CLsbFUxYRXxaeJDetSz+PEqURpdrNWvA0tdIz1SZcm3DcfjniDa/VT+fQYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282063; c=relaxed/simple;
	bh=iGGizjuK5jMCtSmXxGVcCB3WlO9yS2ffaGBIfOU8XbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k61W3JFXmOlOwEOQ7sYdMuUW1dMhU5oUfR2Flx7lMgjcGQAqFDzsFDNg87aR/DGf1Fs2D/p8wf9kw18Z2H7MY0dHYG0mPRbFXJvU2FaAa5hm3W0cAh5EpWBgL+QpMu/L98rww8YK+JZXL1n7Z5bH21kmIrzQ/z7Lp8A4mllNenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx7orqA3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cx7orqA3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D9A1C2BCF4;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783282063;
	bh=iGGizjuK5jMCtSmXxGVcCB3WlO9yS2ffaGBIfOU8XbM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Cx7orqA3vDQz45sO5Js5nEls0ABYsrO2l+8lN0LnkVnQTzyl4zSP9QPFDstG8JbuV
	 uDXfugJCa0QYFEebHEy9ZjMMYvcQCwvfUg1hW+Wuc+KIUIBNERpJtd5tWmAukbbUX/
	 C+Ql7TETL/1PJ5V+1ZsWNB8WHGE8DO6cvuAzTimN7O/GOm6C609afW9qumTUVpcZC4
	 o4w8zcMCl9BwO87LUB853ojh7Bmzvs6YsyMr+JtvqWhtYhDeGpaYpUuEEMh1Wpoiq7
	 w6bai66ZHaxHpq325MPzfOFKQhkFLGSMqvxnwP3ptz6dSljUHJcToqjA92AwdrytS9
	 iTLBeLqnZIH+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4990AC44501;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Jul 2026 22:06:52 +0200
Subject: [PATCH RFC 2/6] ASoC: qcom: sdm845: use DSP_A format for TDM codec
 DAIs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
In-Reply-To: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vLuqZQgNHynl7n+YwN094veUqydvvq72pur4s+x3Vjc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqSrmMxsJh2TZYCYImKM3dHEGZnqqVMKQa7xm8k
 +EsJXe5/e6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakq5jAAKCRBgAj/E00kg
 cu5YD/9coSUo9sEfrRl7BuTXjjUjyo6d/q5YE4/AdR/0f6I/p12/Wu4dXZhbe9w+mrshAkgLJXo
 1P/2j+q8YGWgjNrAyMTu2D6pYZm85898pKeMy/sAFbUiHgDdBPKLR/8Q0PMEOS2rUx3VMxS9JIn
 d16yKluhPGQiHd72gamG+RWfd1N3UPFsAjWm8MzvQGnUtYfK5x1lSaZoG7BDbFV+N457ERUW7Mw
 zl8AdJpczy5AGWpuNJMHrqIQnwGOUPL1VbssZpG3HpAQrvSj5Ha4U3jadxlbwkN1v/li7vKSJ9J
 YxnTC3XprGquEKFQpvDkQ9W2LcGxlBAtrTKnKuC/MegNX3T4elKbCkimBnkx6qRWSu9b1eIkJo6
 u9/Wpq9dPnk10zeztrs8XUMy78W8DHSr606PtgOqEjXLSzQSAqL6pwZTuNJLtso/frI86YynhMg
 gELUdhO6eVPOl5GuqTk2zycaheo9FCdX4q+68vul2emYgGdBpOJqRJ6ZiNIwVoJ0ZfWtMNmyxBf
 Zh8BRQJMxYM8Jl4yCiM6547ZK2ml9LLL+78nqesjNUvlZk6g4Fokp7EcQZAHtmZI6q1M8WzxguK
 O5hQtVBA3/F651ePhYjeOzLMMZ6LNVQhJrqIzvGEeGVAg0TbvfgihXVZH7kkpnYIGThP1LolLMF
 oDNsiDG1ycIoOQw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Before the DSP_B only worked because the only close-to-mainline consumer
cs35l36 codec was patched to map both DSP_A and DSP_B to the same
hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
Use the right codec (DSP_A) which works as expected.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index edd2cc7a1c74f..9de3282bda4be 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -380,17 +380,17 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 	case QUATERNARY_TDM_RX_0:
 	case QUATERNARY_TDM_TX_0:
 		if (++(data->quat_tdm_clk_count) == 1) {
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 
-		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_A;
 
 		for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 			if (!strcmp(codec_dai->component->name_prefix,
 				    "Left")) {
 				ret = snd_soc_dai_set_fmt(
 						codec_dai, codec_dai_fmt);
 				if (ret < 0) {

-- 
2.53.0


