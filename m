Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38CF3C0600
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778185482; cv=none; b=LPdLYryLlHpdkpD8tVmMvF5swwqICoNJ86VXthmrhGoJm3qtXsJ/MCgJJxuo3Mx1pzQ2WcrU7rNEujTaIDOU7ilGq2WT0kwgDqBSvZmX/HnD25caP7JAJ9JWySAvwkqYRi+FYRE0FPgcZGNoJ8J8QJ6MwXHl5HibTN5IoyZ41Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778185482; c=relaxed/simple;
	bh=JRZm2Ns1rFRaewRm3nJEAljdQM8i4GiTMc7JyvrVgCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDsHvgJ9Q85Ire4++HD5zsMqcFphMZ1qdsoTit+hV0LjqDYn/1TuAh1PMG77ILSqj4IPLWwiwY8rwhT36I8/VfHXIqKpZ7vIPWpyTXjgHIM5X+ohm3fXDlBa1trO2wmKQf9yoTpbID9sFS9xi+cFC0HxhTNtS+UEKoZn/vqshKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Yypv7rjV; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Yypv7rjV"
Message-ID: <18040037-d0a8-4e1b-aa55-94071efe1025@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778185467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4NljBqDI6Si9hn9Tg0WOqKjA601x1O8EETSjpz0cuPM=;
	b=Yypv7rjVMjGNd9PlpsyJPp7GHAQS0V7hPWUd5RLbHM5llkcteBJA+CYllvdTrKQpXVX4IP
	+bbKLS7u8kfoe4Z/zYnTM0/nQzoThC9xgdtY7wgt4BIpuhAswjBCMkzEQCOVfKT9Nwa4DM
	zGq17z78aG4QXrZbDc+EAqQXmnuYSjkoLwJHhJ65wXht8E37RcjhEQ5BsswlAzJ4lxaI/T
	Scqlcg2WIoXuUwapBg/aybk3duRaaAzcAkKhliJQYxwgHvD/TkS/eGDmcixuMVRv7nuwwe
	LhkmziEOb9Q5znaZyzhc2WpW/Pu8Dyboq64tOlmy/RkYzPdIvizlwGHwOv3RpA==
Date: Thu, 7 May 2026 17:24:19 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/6] ASoC: qcom: sm8250: add TDM RX support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
 Luca Weiss <luca.weiss@fairphone.com>, Antoine Bernard <zalnir@proton.me>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-5-val@packett.cool>
 <6338e51d-da58-410e-b10a-4a565d467f1f@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <6338e51d-da58-410e-b10a-4a565d467f1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/7/26 5:51 AM, Srinivas Kandagatla wrote:
> On 5/6/26 8:33 PM, Val Packett wrote:
>> Add support for TDM RX DAIs which are used on some devices to send audio
>> data to speaker amplifiers. Channels are assigned based on the codec
>> DAI names for a quad-speaker setup such as on the xiaomi-pipa tablet.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   sound/soc/qcom/sm8250.c | 141 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>> index a675913da943..b64fd3970ba1 100644
>> --- a/sound/soc/qcom/sm8250.c
>> +++ b/sound/soc/qcom/sm8250.c
>> @@ -17,6 +17,10 @@
>>   #include "sdw.h"
>>   
>>   #define MI2S_BCLK_RATE		1536000
>> +#define TDM_BCLK_RATE		6144000
>> +#define NUM_TDM_SLOTS		8
>> +
>> +static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
> static const ?
ack
>>   struct sm8250_snd_data {
>>   	bool stream_prepared[AFE_PORT_MAX];
>> @@ -55,6 +59,89 @@ static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
>>   
>>   }
>>   
>> +static int sm8250_tdm_snd_hw_params(struct snd_pcm_substream *substream,
>> +					struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct snd_soc_dai *codec_dai;
>> +	unsigned int rx_mask;
>> +	int ret = 0, j;
>> +	int channels, slot_width;
>> +
>> +	switch (params_format(params)) {
>> +	case SNDRV_PCM_FORMAT_S16_LE:
>> +		slot_width = 16;
>> +		break;
> Any reason only S16?

The entire driver is "locked" to S16 since 89be3c15a58b ("ASoC: qcom: 
sm8250: explicitly set format in sm8250_be_hw_params_fixup()"). Which 
was due to compressed playback, according to that commit message.. But 
in reality there's also hardcoded MI2S_BCLK_RATE (so I did the same 
thing for TDM for now).

I cooould try unhardcoding that, but this kind of thing is really 
annoying to test with the whole combinatorial explosion of parameters x_x

>> +	default:
>> +		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
>> +				__func__, params_format(params));
>> +		return -EINVAL;
>> +	}
>> +
>> +	channels = params_channels(params);
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
> Please define the magic constants like 0x3 here.
>
>> +				8, slot_width);
>> +		if (ret < 0) {
>> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>> +					__func__, ret);
>> +			goto end;
>> +		}
>> +
>> +		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
>> +				channels, tdm_slot_offset);
>> +		if (ret < 0) {
>> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
>> +					__func__, ret);
>> +			goto end;
>> +		}
>> +	} else {
>> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
>> +				8, slot_width);
>> +		if (ret < 0) {
>> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>> +					__func__, ret);
>> +			goto end;
>> +		}
>> +
>> +		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
>> +				tdm_slot_offset, 0, NULL);
>> +		if (ret < 0) {
>> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
>> +					__func__, ret);
>> +			goto end;
>> +		}
>> +	}
>> +
>> +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
>> +		if (strstr(codec_dai->component->name_prefix, "PL")) {
> name prefix can be null.
ack
>> +			rx_mask = BIT(0);
>> +		} else if (strstr(codec_dai->component->name_prefix, "PR")) {
> name prefix comparision is fragile design, this will break very soon.
> and this is not a binding too.

Right, but how would one even define a binding when this is supposed to 
be(?) part of the sndcard and the prefixes themselves are set on codecs' 
own nodes..?

I just copied what's been done for sdm845 so far, even though it doesn't 
seem great to me either.

> This also raises question about the using this generic driver for such
> specific combination. Can these be made specific to compatible ?
Yeah, sure. I don't think we'll see other combinations in practice 
though, for 2 channels regular I2S is used, the only reason for TDM is 
to have 4 channels. Or more but I don't think any device has more than 
4. (And surely no one has 3..)
>> +			rx_mask = BIT(1);
>> +		} else if (strstr(codec_dai->component->name_prefix, "SL")) {
>> +			rx_mask = BIT(2);
>> +		} else if (strstr(codec_dai->component->name_prefix, "SR")) {
>> +			rx_mask = BIT(3);
>> +		} else {
>> +			rx_mask = 0;
>> +			dev_warn(rtd->dev, "%s: codec DAI name '%s' not recognized\n",
>> +				__func__, codec_dai->component->name_prefix);
>> +		}
>> +		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0, rx_mask,
>> +				NUM_TDM_SLOTS, slot_width);
>> +		if (ret < 0) {
> Can we handle -ENOSUPP?
By not erroring out here? Yeah
> [..]


Thanks,
~val

