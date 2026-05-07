Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581E39DBC2
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142679; cv=none; b=Zz71ZGdWee/t4D/cyUEMX305RWCczi9Zl6J3scwCa7zvLCDQ8JiZqSQhZUVZzn0H+CmVh9mKoAvDjjWmSll7PNlgU8Es1cyGqAg9OSpY4hR1Qej0pb+9dXPiYZy8RIfcFXjh6zDmjXaGI33PbC71SQFi0RfTNXqA5pes0Bo89GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142679; c=relaxed/simple;
	bh=QS+xgoVpj05u0kN4fcEBZA7FdHDEHzpoDC0VDQZG2Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5PiIU8JtaiYQqIutnq5wFst3b4TGIh9ylVyjnAe2/AlbVm35xPblSsPeCO3/DQjucbVCfubwXbpm0yt2zeWpc5f0264VU4mMK0oLRo11tNbnLhZRs5dQSkxA41CnG3L0zAC419CM/kUVPwDYtP+VFad8R/ehcgU7D0j/Ct3fV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhXHcaXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQeS+DBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhXHcaXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQeS+DBd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64759h8J3924960
	for <phone-devel@vger.kernel.org>; Thu, 7 May 2026 08:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=; b=BhXHcaXiPBfofdoq
	lDzcH23JLjPWu2ruIVMlHF1l/fJ10xI4Bg+54JTCkn0ZX/ww/dABbaLNxWIZ0irX
	kvoLZSBKRCNi7wrzRp0PNFfaMMUgmfjEK76lXTt7oar8vCQBEakBwRl673VDAosa
	Q8/EO1/FyuEgcbMDhmjybOKy1MWbWzjq47SkaVuCeNEGEu4B0PbDsOjDwtZX5B6y
	+PzKMs1cUeZm1dbR6wlYeB5ojBSmM5yw9j5eHP7dT5OdBp43h12WTU01TBqFIYaZ
	ShmgZi9jTx5WAAOoc6qQdZ1bo+l2kmqT7wGgxwwHsburVoKs1yb5dSqdxHMAnBlL
	GAX0Fw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88a7jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 08:31:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6312431089aso171065137.0
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778142673; x=1778747473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=;
        b=kQeS+DBdan8AA77aWYPbUHg6xR0Kd+iTY5p2avh21D+xQV5U6RwM3QN/9sR8DjvC/i
         zKiZtMBeP6CeVjUrrRM0+gIhySuFzaH/G4DtYEq4oz/TAE82BAGvSlRProA9w9Zj6/j9
         YEhhpQloZAthK+89UY0a4hhFG8IOOdc2PY+Zku9PnRcZjattvkk1NYAL3TG6iFuzgGGa
         EdFWj36X3GBZuBQuG6bfiW35fJooZkZm4fDaT2AGq3SygYlUHSqmGHqkMPAgA5TGti7i
         6ADiahUHHYMiEY1O8HCKf5rFmN6BGmZMsuE5b0FITWnA3Do452RoUfCFTQw4KxmONCkG
         yUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142673; x=1778747473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=;
        b=CiBo6p4RBw1tuDVfGnS6ohqUdoGrxAEKv6G5K65LzzuFnuUoJCChQPdcavBrWHrylF
         8KUNVDMo1jZ5uQ4VmtYnVlTsPoqjv6Z/w1fBbfPT9TBn1RaiOuLpQ5ZuHrhwrB4cj6LM
         y+blSwoLSJHFUD3oZDmic+cvf8OjYHI9H1Gl4UoUF7WG61QLUOZBv31WtcgKO/xo/cy2
         9yuAMJcB8CUB4nqQr2ok8snZfrOcWkSI/3UgwFODMzztoTsIPGMu3YGwWY+XVdKOawyK
         fKxq4a00FrGccST6yExHXV8bE+eWZ3FZq1vHemRSOsupEdOQgijikMWN4RoQCOTav7eD
         Rfsg==
X-Forwarded-Encrypted: i=1; AFNElJ8zQxFJCRqftObVGZe5b475FtBqmcg+mZUXc2P/PsLSBx2n9qjhmqQdDKEdJwVzKxPim+z58ginvshxWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylvcmMZodGzO1byMH7pClnUhFaBfXupOYP0A7yC0zUBvfGxvoY
	qqGsscN/BGtCNojZ+RXpopCJlGSOMDFVpm75AMaY102dGSLXKJjpv3paIWkq+LYetPUGOzyB2kC
	tB9C/p0WFff9bN6Y55d+IEnaph4AgIHE19O085I6v+xj1n4Dr43PwxywNPzfCvn9I4Q==
X-Gm-Gg: AeBDievrfWfGt5EAgr0VmWjlT9OkZEasASAXxM0VYzHtq3C2zVrvNnYp1dtqUq6VFBo
	xIbd7+7kkZViho3xVXN/B9ddmJq25uBPT8yCsmzAtQDaaNadaOEWqodln49Bhe91Fj65DGHCYwd
	cTRgZRnggbcSE3nmGTLCYy4XsiM1r+Xpl7XBf2pqZYb9/qvQ4OGNjpKffOaEM7yiQTCwg5E8m7d
	doCORD845jQIVHvPPgXODNdmGp/Ht97qT4DeYAg2ig8sTMJIjN6pPRPE8jZX2dnVOhnqS1sYs4K
	cSE3TS6aLZM+OiQwIds4X+OBiLl+AVKNC/hb6IKv9FkKgclGAumneXLKoASL49DUAghUW2QCH0z
	HzHdMiSQQQWYTsPUbnJpp7zOEYqRFePALUMT0RUtVFvrh/+4qwZuznlEpvOg=
X-Received: by 2002:a05:6102:26c3:b0:62e:1ae1:cd6f with SMTP id ada2fe7eead31-63115d83748mr644461137.3.1778142673195;
        Thu, 07 May 2026 01:31:13 -0700 (PDT)
X-Received: by 2002:a05:6102:26c3:b0:62e:1ae1:cd6f with SMTP id ada2fe7eead31-63115d83748mr644457137.3.1778142672825;
        Thu, 07 May 2026 01:31:12 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bc833742a54sm53375366b.32.2026.05.07.01.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:31:12 -0700 (PDT)
Message-ID: <af0d5cd5-4d4d-4cf1-a347-4f40c595d07d@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:31:10 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: qcom: qdsp6: q6routing: add Senary MI2S
 ports
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-3-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NiRSKMgB1iAerdlVd6864IzRphZ57w9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4MiBTYWx0ZWRfXzHHdtQTiCWua
 uJ4I1HZy9US/33ql+u5HXOkeJLwl6W++25BwL1TeFn5IUrgi1JG+KCo8RPKUSLLDjve7yuWt08/
 vRC2ZGfSFNdKftSpNgPDTr6PKIHCAAGT4FiGh7iYcpXp8CoL0Pqi1G8l6OZ2gPdml779i7QquG8
 SvZMz/3EGMHqdiV+3VDqhvanEa2yGMrhMvRW8/sdA3eSQurbydET6h1xaPbJNhEzUEw5csc21HY
 cUNECAyHSW6n3y0hm8T6NQWmW/FSj5laIOnzmRAIQmVsmlPsdoU1FPDjF9D0d1azj/XeT1/+uuu
 P9sh43UKjY6egUT8pCbk1EsJvZrZ+TeQEmeCLsJ9crZpNHDmw/xhWYJdsPiVAvU12wt3TmDZDjU
 MpaUul+LJ/xCtt3U0QElNxPMZUYy2Y0Ms2Q/QoeTp1Q8YMuzAY25J5732u9UTrIgszrZ9oF3uS0
 8pI5c7cuLoRo7w5Ssog==
X-Proofpoint-GUID: NiRSKMgB1iAerdlVd6864IzRphZ57w9L
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc4dd2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cc8_7rZf7ZdJLD7Cf0wA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070082

On 5/6/26 8:33 PM, Val Packett wrote:
> This commit adds support for senary MI2S mixers.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/qdsp6/q6routing.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 7386226046fa..55119cc33d95 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -68,6 +68,7 @@
>  	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
>  	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
>  	{ mix_name, "QUIN_MI2S_TX", "QUIN_MI2S_TX" },	\
> +	{ mix_name, "SEN_MI2S_TX", "SEN_MI2S_TX" },	\
>  	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
>  	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
>  	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
> @@ -145,6 +146,9 @@
>  	SOC_SINGLE_EXT("QUIN_MI2S_TX", QUINARY_MI2S_TX,			\
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("SEN_MI2S_TX", SENARY_MI2S_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
>  	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),				\
> @@ -535,6 +539,9 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
>  static const struct snd_kcontrol_new quinary_mi2s_rx_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(QUINARY_MI2S_RX) };
>  
> +static const struct snd_kcontrol_new senary_mi2s_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(SENARY_MI2S_RX) };
> +
>  static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
>  
> @@ -777,6 +784,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>  	SND_SOC_DAPM_MIXER("QUIN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>  			   quinary_mi2s_rx_mixer_controls,
>  			   ARRAY_SIZE(quinary_mi2s_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("SEN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   senary_mi2s_rx_mixer_controls,
> +			   ARRAY_SIZE(senary_mi2s_rx_mixer_controls)),
>  	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>  			   tertiary_mi2s_rx_mixer_controls,
>  			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
> @@ -969,6 +979,7 @@ static const struct snd_soc_dapm_route intercon[] = {
>  	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_6_RX Audio Mixer", "SLIMBUS_6_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("QUAT_MI2S_RX Audio Mixer", "QUAT_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("QUIN_MI2S_RX Audio Mixer", "QUIN_MI2S_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("SEN_MI2S_RX Audio Mixer", "SEN_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),

