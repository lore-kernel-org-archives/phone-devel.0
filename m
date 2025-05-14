Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190471F3B97
	for <phone-devel@vger.kernel.org>; Wed, 14 May 2025 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204969; cv=none; b=fCeLlTaWANgtZmyxArvywKqolEOnGdaY3NBxXga8d2ZVuQ5kzZyV0bJADp6bmXmKSDSa8fc5xLkjvsDQ/KY3Gh5uTiFxTN3TOnNa9dmxOV5Q2FSPOYBqJa4nz8Gl1CuZ0t+GHr5meMK0O17+g9uczRodquXd4Zlzv3tjIN1tftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204969; c=relaxed/simple;
	bh=W2lPWkK0xtLvB6EVRo0hijyvktlOgtLlUSX5Erkw4Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzP0Xx5CxOj4tBpHBEJew6tz4hefMPxYTyjStlKs6id2lUlYbdzj8kR6Y2bD3E/Z/v97c3Pov5O2aSAJ2cRC3gr3gPVWtA2CHqIxRCy9r5IgyVGf/XRzJaQy35cFBq39iteNAawXS5xyx+Qe0767DXNkXYf0sSu7TsozIu7QKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkY7rKVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkY7rKVA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2WqBF009595
	for <phone-devel@vger.kernel.org>; Wed, 14 May 2025 06:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=; b=FkY7rKVAQBZQLgGs
	hhYD/mzVaCZ9Y52SZvnHOGxHF6AcOAp3ICdjiGOCzb6gUldH4k7bEu7OEWVwF++J
	U1objVR9edQ5PBMw91kobQbrTa7PmqtO+jGNbXJ4RKI7Ujo2KcWXN2QrdGFIxbPd
	JIFejx5Bq8I/PKX9fGnxLkFIvQ7PmUOOcaudB2v3SxFbC6j3c969KHmKpVarR3X6
	yEDKjkDNlfQbqBqXdLnZfZMlsKEL7b26HBn84gxIwAmjsN2lI04JIDwSbTXwuBaj
	dN9GfLwFA0nDJY0f6kBeqpl7i5zH2Y7yagE8FlII+liBhFsubUHdWo4IP/dKkWRr
	IPK3GQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr1n8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 14 May 2025 06:42:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so917076285a.0
        for <phone-devel@vger.kernel.org>; Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204965; x=1747809765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=;
        b=VpBG/wRY6qcVEXiauHQEe1qD0fitXMpIYituiC6HWRy1fH5bobbu9/cvPZQb+swbmA
         KPWGFpFB8X/xYVKCcwGA2YBm9r/7sjD/y1196WD0xS/K8OW9Arh+TCEIJxYx/YS/ffbb
         4MQfA0rdN56Bz+CXLeY/YKE2cUhd1RnnL/r/r5IxoCQFT93zzCTKYiQc4F9e4WSWEvOS
         z+zlpKFv8w2Y3PKmPJ84QUJWmuVEHQqO+Psb61mWhK89rjeugUA3zY9+yio7xdj1v9cS
         0IbDq4pj1zPWQJQMDs7eo8ISHC9doD3u5DS///qD8uEc5sLN2IchuJKOUnqzlROShE4L
         0CHw==
X-Forwarded-Encrypted: i=1; AJvYcCUXC+7BWS63sJ/pl5phQH+8/snzXzbpPRa+vT2BmFEM3uA2dF4CpfN1ff4pzByldGRMmZ2b/WQn/4ItBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPORPSh7/ztpoKwLVriUTKxShYSnH45SS5+jhcq5PvaebPol17
	Yig4ygPKleEbn3IhKCPKulZH7RqSs+EMsup8M15W7vbtDr3A+YRJUkBBOm1gQEjTjCBYvEez5OW
	elfDrxypR6CzP+/6TDd3t/Qn55KSlaL5KcqW/MqVMTyIx887Nq5g0YKnOf3hbqg==
X-Gm-Gg: ASbGncu2QgeFzIoOg6RPUnwxAHbH61gLgS7q3SQ0GqF1yANjOXQN/x0x7FdsbvGlqs3
	A449KQGYkOWM7gIoxXHTq8sDVDLhspsb6MTG6x0eRzzFiwuNrmyJTLWurlTwSwUQQCuA7CQuhdz
	fjnlE+DSjX7I5RxVwqsOtG4OFKj0+Fhk1gThE7Qk1FBU4eiB7+OUPCGN6dMmCjnsxA+mOsoypOA
	5KVHktWlZ4torzBQKdhSETR9o7dHSbAylBKlu7uBIZw57vLmOfDGlOnQYArZhOQSuw4qbsF1EQa
	e7qfM7MIaPz52oXUA0UuJEh+ox9JuvsJb1w/5TRvLkn9sIF95TDgblMTP7tPwg==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id af79cd13be357-7cd287def2fmr311050885a.1.1747204965038;
        Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/TX+EOyLGPx3RCZxzUdd7gY67Jbmj+T3fCNfY8HTMGXEWyH6YEm+X+YAuMYfMaxiKp8G7Lw==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id af79cd13be357-7cd287def2fmr311048785a.1.1747204964660;
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d0dbsm18271702f8f.88.2025.05.13.23.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Message-ID: <ee60c802-f4b6-4d0d-9c0d-b16ab732e6c5@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:42:42 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kzFICI1XJ6yrp0REVCqzaDvYJqgGm4BN
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68243b65 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=6H0WHjuAAAAA:8 a=WerGdG9rmgDbcAo0O2AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: kzFICI1XJ6yrp0REVCqzaDvYJqgGm4BN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfX+fikW8iEuBtW
 PO6H+fYz3Hgs1ZTamysq53nW2HJxDHCHwT4f0+IUGZcRU6dVEfa0QpIl5+zxWCrV3A7olffo6kv
 86Ph0aLn9kZ5pH77rFb4NH7pO2M2rnGdgD5av9LNU9/XKV3ayptjB43/G61/TNQUeUYUESkVkLw
 Lov5XaSrOHLyAA+8b/JrPYgkZMi3BCwAOcS7Vtf6YcRXhFslvttKQO74UlUiyzrHgiaGWXAcVdU
 /DvxAdKvrJpDnOXLSvAXnbmcLoqyHxYlN0e06FUX1PlNdeCVoi6CfqBskPSg/+PJccSF/UsKCdJ
 GtQKOJJJfexDPGCVlctWnsQ/yyLxK2YJpudFZZNW16cUkl0zZpVTvywST1qqBYba8Nq2m4TEZz0
 yiVeMTW/GNNsOzTIG0ZNU87HbyVQVUaYmYOT4rbhWuxDcK8v0ohd8lOt9b+RmgDwqVmQgnBm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057



On 5/7/25 09:01, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name. The QRB4210 RB2 gets its name set to "sm4250" as requested by
> Srinivas Kandagatla, and since no (known) UCM has been written yet this
> should not break anything.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b70b2a5031dfbf69024666f8a1049c263efcde0a..f0d83a843765d8dcdd51569e7cbc95eb72292497 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -16,7 +16,6 @@
>  #include "usb_offload_utils.h"
>  #include "sdw.h"
>  
> -#define DRIVER_NAME		"sm8250"
>  #define MI2S_BCLK_RATE		1536000
>  
>  struct sm8250_snd_data {
> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	card->driver_name = DRIVER_NAME;
> +	card->driver_name = of_device_get_match_data(dev);
>  	sm8250_add_be_ops(card);
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
>  static const struct of_device_id snd_sm8250_dt_match[] = {
> -	{.compatible = "qcom,sm8250-sndcard"},
> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>  	{}
>  };
>  
> 

