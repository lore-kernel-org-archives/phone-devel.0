Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08AE27CCE0
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060835; cv=none; b=n3gIgbbHswnsECdGoMP4fCIBRHxtsvjm+hpI+Zu8zJsRbPyqq0gv7Jld0bZI9S1IhntZde7lJZQq3Rs1xON3/+BR8hwe2q0Bn+gbazNqekjoUlNLu6qTrIHhvk4PVz7fNOrjTNUuWlJTn3G19fWrnvPBK0ThQE2RBh7qqMugstM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060835; c=relaxed/simple;
	bh=d8fUD0GwNl3eQlx1UFx2hHaWYhidac1WTkAaDtJFttU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAfUkTVC0thTaTzn64+Pm8LbWpbPZ8TfIPiaj3whEGvcic6W6p+2cmHTeQI52OgsZacsX0nBZvPe2c5gEaN3Abvd90Z1asWhsSy2Pc6yXZ2W7QU+C4DdEEz9+bf9F2TmsHKGucqyy8JbpT+b92+mGoMfn1AQn6efvyywFAJ90V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/ST1sZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bw6oxXO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/ST1sZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bw6oxXO/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297Q13q2640321
	for <phone-devel@vger.kernel.org>; Mon, 9 Mar 2026 12:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4lbYf0YIavx0jJvnEi2wW1bWsFrtVER0kzAV3sZcI0=; b=c/ST1sZQKL0tp4lE
	fiIoZ8eJcor8UDTkES0vyVybknPn5dXieJEAiDocQXWd14pbMXz7mxGeYChpNyQj
	v8Jw2X7NFoPuFOWXZRn3Z/M+NqzroeTrU1pLRyFMWhe0U3/tSEIHCJOz82OulN0W
	3q9aJMWbW0ZjCUZzq3mWA9akUD6evQYl7qwV6EsP+5Mx7xZSetGg3WvHujB8Y9t5
	zI/NPghLgPQENu694LlZNz5uG/snFg48j7e2Z9XOP/JMDxa0SJ2bTaDdu3Ej+nyk
	rMBEX4b6rvDZ+iR2IObQwAFi2A7AxDUpnhPIKCXX+l1LRQTDewvF6Sz48nlK0+6D
	zqZ+bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qews26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 12:53:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd90958f24so15280285a.1
        for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 05:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060832; x=1773665632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4lbYf0YIavx0jJvnEi2wW1bWsFrtVER0kzAV3sZcI0=;
        b=bw6oxXO/LQuBx/JzoAaD+3JFqmAJf9RFAUoF4gCtxVEPcarjWsibZVydmWkO8tq8sz
         l7u9c/aG75l7vgJjYnTx84wko/5Pp7WvmqZ4WMgfd5YT2uM0TWMwuKvOI4Ww+KebBMcS
         uLAsF809creTnYSKZzWQYRbbtOsxNx/8uk7pLRfkg9uRvKnCcPejmlYeB0Vesdn2Kagm
         shLPq32NqcJWhOC7VHnAQdMnISfe+gVXBnUBF5xVXeNdjc9uH4euf/iLs/v23UGVGYE9
         IIxowS8LsDeuZfsDOEfpoFptuQZ7Vp+HzO+eHNJ/If/FAjek8P1gVNv7NQpX0JxvYUIY
         tQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060832; x=1773665632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4lbYf0YIavx0jJvnEi2wW1bWsFrtVER0kzAV3sZcI0=;
        b=Id9cg9gimBnq6Oiif/2FLBQd88YXYyAWPVCcfcdW50HOtjVj1bqmKRLkaEqZVmYD4R
         VO5m/7HaXoIqZQ8zAjuexszvJMmFailAPfPaLdE0NmnKW3zgGCsGM+1Y1S06S3kWwHQq
         l245y93COXopxPnjMYXu23KNby0HtwuzW8xt2V01wjkVBm7zSms4oMd4/hR4jDiilA3s
         tArJfLhp/NvbCgm/Y4Y3EBs1Xc9cCIO6JTIEgYQQKfme7L37wij7pTo6wwwivl2UaiKA
         e3lXOqPnfLOQCuq5YQPv/yQ5fAtD9OMSV/4ybpncnB+BXBghFMmtJnjKJs0XhZqLjsxW
         w/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXnql2xeNlI7vJAW/V0t6KAaGFiuCWCpyWQ3ddBJgV/GosM0EgAzyjSlvw2KO8L5C04pjEhVuTrNFSfvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyu13ny1w3QiAWo9986YvwA2+xwWYnrtT1EnIR2dp+sjbmdzmM
	S6Z9w/qETpp7k3vpJO6UjpK63PFpmRf3Pr4NXYnmHnCrxbzfRQcET3wH1Fg7YX+pcixI0S925tp
	CmYQ+SGJlgRuTUU6MmGUZ7Iag9pD70DsCzFC+fLmHusBBxk2aQmrIXF7ykJRBXUEPMw==
X-Gm-Gg: ATEYQzwtsNgRf4sYUEYK7rxYq8UeLkfHEQl0TexKdT//wOVOV5GNqSbe4rdGypfPG6e
	uxyQKRYcz6SYmAcIpe2reYaO/lUu0E3Xu/2D8uOxbJ/0pJuoIYL9JPd60jIi0typOpWT47UXf67
	gnw5umuNc1ku5AyXZuNaGxi90eevsoox025U2Jt9nU8xUCkEzTuJz0xGmJFcLHzUSZ2JMRhIrF+
	FZEykPcI3LNsSHzZxUJqhaSR0sGVmn04laNEcg/+TE9dX3eeohekCyNG9rGKwKRlM4R6dQSchiK
	CVVcc3uP4xJ/NYmon/2EaTCV+Cs0LsWmRRKwmr2G0xn07mOu7d0NxQV1LjejV66DYAvRjTVKKZp
	LauObkLndO/G7s9J6r3eclwDecpcNkSK+peF6N6kKaaaSITsOvE9N2N0thpvImaelOGYD6izDnl
	Ai2tY=
X-Received: by 2002:a05:620a:28c6:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd6d4a4270mr1053858685a.9.1773060831966;
        Mon, 09 Mar 2026 05:53:51 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd6d4a4270mr1053856185a.9.1773060831557;
        Mon, 09 Mar 2026 05:53:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e3dsm368349066b.36.2026.03.09.05.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:53:50 -0700 (PDT)
Message-ID: <07b552b4-ecdb-4877-8b45-fcaa6792aee4@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:53:48 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Redmi Go
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g19MUpF-Bb81yslf_vud4wpPP_Euh2nC
X-Proofpoint-GUID: g19MUpF-Bb81yslf_vud4wpPP_Euh2nC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExOCBTYWx0ZWRfX//aGta1iSAGM
 R5xWcFl98G4E3x0hnTl5qjmjlinOfk4755c0dhUku33KdS1LnWivA6dOdymwmSbds1YVUC1mBLb
 SobM74txALR2zMFo1pogbKHHp1NZmRRLOadG63Cj4zLy8jjnGRH9yZ/bInDbM9IXS5u07opcqBj
 zFy4pqaWJ3HZtXKc3M/sahyvvWN1HDCx8VG2MJ91YEYLsD37I+ZqRfpIbVWiJ1Ruy/Z2fMO+hum
 zEvLUVRjz7RsWcBuiy4tZok0DkBsYD5XDd4KTGpLIMSS9O4dqJQJdh4O2LiRG/L+1qhaQFrLknc
 TymOxVivtCsfGU0Z9MyZOs89KklMD0GozqC4LoIZAMDYABFU7s9+H1trkWRM94uMPtzuIfpaaH4
 R6RQZeMZ+8k//rdIYTF3V12XQtxQVfk9tMuguIGkfS7RNVgnUVlpAaC49Ik24ueb270DpVoMHLW
 wUIBvFdn6FbfMK0+PXQ==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69aec2e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=UXQlu8LILUrf3dYBbyQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090118

On 3/5/26 6:28 PM, Barnabás Czémán wrote:
> Redmi Go (tiare) is like Redmi 5A with small differences like charging,
> fuel gauge and different speaker codec.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                 |  1 +
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 27 +++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 20e161e843ed..a74598cf0b47 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-tiare.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
> new file mode 100644
> index 000000000000..c3a74530c34c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Barnabas Czeman
> + */
> +
> +/dts-v1/;
> +
> +#include "msm8917-xiaomi-riva-common.dtsi"
> +
> +/ {
> +	model = "Xiaomi Redmi Go (tiare)";
> +	compatible = "xiaomi,tiare", "qcom,msm8917";
> +
> +	qcom,board-id = <0x1000b 1>;

Could you please double-check this? Riva and Rolex seem to have
properly different values there, but this one mimics one of the
values for Rolex.

FWIW these values are almost never properly fused so I wouldn't be
surprised if this was a fail.

Konrad
