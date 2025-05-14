Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96CC202983
	for <phone-devel@vger.kernel.org>; Wed, 14 May 2025 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205018; cv=none; b=KmElz6K3Jx3yNOPMUi7q+FD9N71XwsgLvrcpJa1FDjDvbtPViKE8/co2PZ0LKC17t465ezcHzG6xv1Pm/QeltzJd0tJQndE7fc6X/Kb27Ck0AGzHhGoh9s6GX7Ls36OYrS5JM9DWr7W5REOJfabcaU8NXarLkZ1Wt56I8944p0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205018; c=relaxed/simple;
	bh=t6oieiC6PkmHUBT5J/m/ariSEMtMKZPl7YTPtb1Qy+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgnEffVTmKbZ3+g5K383olWghujs1jDjem+qkj3pJeSc91+fXE1rSuLorzHOUgFw2f58tqACSQiYoaK2/Bst0fgi1Ro3nv9/ibj/xTOMdy6howwrVblbzu79f2ZyvAgBd9xLgi9VgwTxt63lI1ngCWeBUCRErFf+f7ebNjCS9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODUBxBGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODUBxBGC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DMxhiG015156
	for <phone-devel@vger.kernel.org>; Wed, 14 May 2025 06:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=; b=ODUBxBGC3ip4iDDR
	qArtlQ7am/X45/1LBoNrBWnK6VRqXHKfPncnRFigXBAG6d4mfQJaTMHu09duID8C
	qNFrL0A0+n28pd5X3ynfKJIVjOaJ7z3m5yrEloSiUecOrm3otoBJuSVQS2S2wyTD
	E5DSypKc3cxiGgWB2DNOrNYYVE+zPpHLkocgDKadNoc290V+JFExWLGjOnES8FRt
	Yeu0y+mQoGjmcEgLesJdOAov1Hl5ki6SKEDa2Td7T03w6V2ltAwA8HBxIW53k4Sh
	Ndlv8176VxptKF1xb5cnLe57g3qXX93y/ECF02ewYMWYVqWcxRwHWvqES91pnsme
	t5C5iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr9nsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 14 May 2025 06:43:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so2114787285a.3
        for <phone-devel@vger.kernel.org>; Tue, 13 May 2025 23:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205014; x=1747809814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=;
        b=MhuRKVxCSFaHC720SFt/flg3kYrt7EzIiacMEpD6arbAc85bERZTThhVcLAlEbxz5Y
         CnjDZBwbiGWKSjMnHeDKE7ooVaY+guxMPSfXIKw9UkyJhPhMzmN8hWUYWYfGbO841A4G
         bT2wnwC9RU2b2njXjhrTlC12DrklSmJD5eRV3BYRiWoiym6tdW5SY96MC/t7p7Xuo1nk
         +7pmDqQ41XF/5J0g/qk54r1QzkR7gmQFxFTba0rPq2a62CP58pI7l1/Vcq7cCfBmLVoH
         cAbhyOKLK6PzIphbjbnIHRbxweQclLCJHCSbhqE9b6jaTDNcz+zagMsa9rM92Ufsmfk1
         AG/A==
X-Forwarded-Encrypted: i=1; AJvYcCUmPCBlQSE0gS05iCUldd42vl3/A1L0wP/v7ETz+2AGvuFcq6pr/v6jnUCU0B50SPXyKdT3PMfWSARB0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSewhPfYY+5Ny6Armi6O1RgX81rAu60ifKlpoJJRwDwpU1OJv+
	gADjyewOipAjidYR+XzKICTr9+UfI1JoyVTx/5nO2bQhvRfzXxkyMAfi7V/4RgPi6NA8NetPyvg
	T+780SpftV5Ebj5efEtwLaJg2CjIYMNs4y8BVPaLG/i8xP+gH/vGQfGDBB8NX9Q==
X-Gm-Gg: ASbGnctDkjfmlI0MOGYTX+5m+flyZYXWV7dvKtX5hOSM4mrujTQhqUYaQzO0vwiAC2I
	FwgaNtKV+Nswpbt1Yuop/HL+4ChoD1X+JasQ1Ppuaxi5Dc1a1dfBSZtP6lvgP+UNm/EiuhpWbQZ
	1nHPRovsfjAkQSWbXm3268ly+1AQoQsj2fhE1HN6QM+B6QvyVXSJiaRoWd52eB97QYyZGHurU4Q
	tZZ5wBXjxQkl6917RA12ts79R1AS5KqTQT0NLExmnOyO4lZEq5J3fhlidZsJACRCxxQbxPho/vw
	oFXTXehbvn6exhcQWWqsvVk9FosEqW6eGIeBV73BmzghY1h7QnLJb9LoffnLng==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287540985a.29.1747205014570;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCYe0F7XxHWYbhu7NVkdrepacB2uWQjdlsK87LfnyU0uT99TRX1IkmjHkIXO+a5nsoJ1a2jw==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287539785a.29.1747205014272;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm18334688f8f.5.2025.05.13.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:43:33 -0700 (PDT)
Message-ID: <bd36e7e3-480a-4876-98b9-73af8298ff50@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:43:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IQGTyISL3KPxFDYiqxpDw4tcS4IvFBNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfXy1yQGC73w+lY
 vvh06tjWuLmUYeNpHtEc4EU3uIWslQSgHzL8GI/YtU4TOWgzk+2ymWZUfR0gcPcBOk6O4ghsyo1
 wJ3xeOrxCIrqXodlolcfM3QARIdiZ5XlKWJDPkSWEVPjmUTIEZ+90Y5i9Y4Ehs6PG57zthbDvjJ
 TOp4NcgjEeRHEGH66ZgUM/bn0m3skJYnpfPLjOZZg0wZCSvlwXRvfc9GRT0Uh+eCboFXkHcfv3y
 o0fY81m2JsSRxNnYAMvpd+ox6TIY3zGU12sz72KL8mhupVkocj5U/1dY6/jVSJ4QYiK6eVRkJ2t
 uUh2YqwEmgATAxExkPowAWSpo+5JpQGqayepdb3An3dQVNjR/LsSmh4y3LtFL8iUJTuaL3mUTkR
 b/hO2xRxUWd5bZvZPYrvcSifisVxjIL7J1XMEVBqzf3xrvlUjmWI+fXCJY+zns2F3KCOpFme
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68243b97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=uaetQlgIYQjjGCg3SJwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: IQGTyISL3KPxFDYiqxpDw4tcS4IvFBNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057



On 5/7/25 09:01, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -25,6 +25,7 @@ struct sm8250_snd_data {
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack usb_offload_jack;
>  	bool usb_offload_jack_setup;
> +	struct snd_soc_jack dp_jack;
>  	bool jack_setup;
>  };
>  
> @@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	int ret;
>  
> -	if (cpu_dai->id == USB_RX)
> -		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> -						      &data->usb_offload_jack_setup);
> -	else
> -		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> -	return ret;
> +	switch (cpu_dai->id) {
> +	case DISPLAY_PORT_RX:
> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
> +	case USB_RX:
> +		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> +						       &data->usb_offload_jack_setup);
> +	default:
> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +	}
>  }
>  
>  static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
> 

