Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9991189F5C
	for <phone-devel@vger.kernel.org>; Mon,  6 Oct 2025 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739696; cv=none; b=uapqdo59stGNQlRAdUA2cQ9175umvJPB5ldg5aaU9AvHObc8t9CvDp8luy6awN1/nQvsMqxytHE9ZjBP45puwzZz3tnGc0WRuxkVFSt0k/6U7IspS9DNX92iwAVKTkzvjgJ8MrySNWNj6xxfab/B5xgnHPVHrhYDjt6j+RkX+RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739696; c=relaxed/simple;
	bh=duAc2kApOcrzELGVc8n03W0C90fIBHhNoQ9sigJvhUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRs0fsqgUVGCJcEApAsTVtqWoT7oCt0HehZ9b4N6W9TD3v/1Ei8f1n4Fd7TCSZC11LRIMOZAI0VVLom4uo/Efh7neDtoGSC5Xa2z7GE4ltKfzwU9hYYs7UJAxmcKoVenQr813Qtqywkf7A9im7MXY5GSbJNwgxXB/2r0K0LCMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzwbbIXf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzwbbIXf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NDfuN000970
	for <phone-devel@vger.kernel.org>; Mon, 6 Oct 2025 08:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+AyGyw7g91LrKhtzT1lOcVGVFnQeAKp4v87SLzSe/s=; b=VzwbbIXfT39YgAAN
	TXagW5xGCaNKK0Hk5yIuhFYZpQBHzxcVtQjP+VV4unIgjjU99hBy9QVPid2v1brh
	PHoSK6ElDtU9nWDnCqoQzLaNvNYK8FthuIhJEMivIH850nRa0ZqKz82LN9I7kmv3
	hgFiDtCnFF+3UkGAlRsacgCqn2b3ExaiswvHkVIZCaebRG5cMJ7s3OXnnmAAzxG/
	IJ8y+5/PEuQZOR760xHz/UpYaDi+qIM8ZeXEGSyvZ4+4SAyoi3nLfcjuzwk4j0rc
	ET0DZVsfys4yeJgHxszevrDm3KS2tZCob+HHB7XHpGMjy0Fc53921LcrhqVtRmEq
	ctvVfQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9duhds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Oct 2025 08:34:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-795ac54d6f8so9927556d6.1
        for <phone-devel@vger.kernel.org>; Mon, 06 Oct 2025 01:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759739692; x=1760344492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+AyGyw7g91LrKhtzT1lOcVGVFnQeAKp4v87SLzSe/s=;
        b=mUU48nBOG/BFIxI+lTSSAbZxdBd9QNXDp+mkFmrrYWhj6ZVlbUFztsKGdfwxTDyUeu
         M/Jh2yjPwK8vD4J0TvZlM8eOXM+tca/TPaN/ybP0fWzCAWhA8TEXOoInaK66Z0cKehUV
         CEz05k9KdVM1SxOd4oQ6vKGGZWQng/l6yJLEvm4zx6Vp//kX3Xgd+6QHXhi9ZKp++/gQ
         Y3aVC/J/UeUoppcM98+HMc5GP/ALpJ5l3tlVu65n9QQbLMSlrpBwsmrksgcBLm0Pnu9G
         Tx5Yy4TUmdju0dTGcyBaT+rQbbIYDlVNFTr77k/ViSIrl2Vjg5BhkCrqyBo57eBU1oEC
         sc+g==
X-Forwarded-Encrypted: i=1; AJvYcCWvrXRGI5UaviQQOoTjH1VIbWlE+gUtv4Q6EcYHvFfaRxt8mLzlSsJkhlqEd9rXGD+blRFGneYHxSY1Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCbEI6ZbzSDx00+hWEHSSyNX1ZANiHJPOjQP2ndf4G5io5+MJ
	ZINobKueTOtDfhLMpPBnlZpK7qE5e7VW9Eoi1s1gi7wDv+awT++SiFZf8wj2glOhYYaR4lnVStL
	pHrgyaBDGptGH33u/gxmSCeiGjzk1Z6p+UIMFoJVUPAQK4zt23S5g4GBaED864gHbMg==
X-Gm-Gg: ASbGncsnlYUb15RQswBSvFeC1B2uJaJMAmWqnAw5HN1uDeBB7FHTXuhpT4XR8nUc4/m
	wKDrYalirMLZH5Z21CCOlNkfqjDqEN4hEYpNfAsAP83acMEuVyzfphDcsb1AkVdgwh1sb0DPW6e
	cOVUIqEcv90G90303C4hdGfJk6uXe65TAgqwe9tIu0bx+9fAUdiALJlh8yy4r/nT00M8dVKPRBP
	VyPeuWY/ff4ZScTwYwRI5ORoCqk1+frM3pV7NLgzT99SA6vLrQiMZvSvDffWxMJb093A8Cdr6sS
	4vQeiRbU9M6KYMYf2+Gy6uM4CGRmmjIqxY3/NsSufgD0LmYVqQmYn1WYhak8x32K6ZqEdi13uR1
	ZNXjo7O1aMmPneUavrbX4gKdhIs8=
X-Received: by 2002:ac8:5712:0:b0:4d5:eedd:6886 with SMTP id d75a77b69052e-4e576b098d4mr94477521cf.12.1759739692563;
        Mon, 06 Oct 2025 01:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Dc8hXDvIBMoATO7JA3MoPnHgDi64F6dTa+hAP+KUePbJzhpUDskKW9E4qocXUk2IWutsVQ==
X-Received: by 2002:ac8:5712:0:b0:4d5:eedd:6886 with SMTP id d75a77b69052e-4e576b098d4mr94477391cf.12.1759739691941;
        Mon, 06 Oct 2025 01:34:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637ef848199sm8205315a12.21.2025.10.06.01.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:34:51 -0700 (PDT)
Message-ID: <52753b61-d02a-409f-a065-e637651ea023@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:34:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] arm64: dts: qcom: sdm845-lg-common: Add leds
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-4-b14cf9e9a928@postmarketos.org>
 <57774099-08f1-4ede-b992-19f220bf8059@oss.qualcomm.com>
 <7543e21dad1f6b3a5b5ab8af74c09415c3d8aff4@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7543e21dad1f6b3a5b5ab8af74c09415c3d8aff4@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e37f2e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8
 a=Gbw9aFdXAAAA:8 a=lENTY40Ogw1zqkBo4xMA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: _yoa9v78MBrl6YOgslJPxEYlrlnAWAVx
X-Proofpoint-ORIG-GUID: _yoa9v78MBrl6YOgslJPxEYlrlnAWAVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXzbRlbiWcJchV
 4I/ANj2rQHN9WWV4kVK+mDXiY0ottE8re4ZX9mUMPm+QWipb4bK/IALbx8xU1MnW4vhUYY2BNmI
 U/Kn47wFwxKmK0zjO89anugcjv/A7tkmiieFFR1mS5kKTl8fi5kxqkB8G+YQkrtmPKev5VXv8VJ
 srNO022ElKGCHM9iQYmS9Q5aWm9vpCz1hi3/k++6+wIyOBM8hen5YlX+OMEa5qHjljTMFItnAWQ
 vXELxh/8bIQwovzZKI2LhilgUZoX3fqOcIZOPwUQeSE6pFVFXIhC6mviq915d4MwjF2yRGNABjL
 Vp2ynsYvk8gczK+tuWvIsik8Yof0OJXnQFM6ZGdIq6a5yWl5YiKWxJHBktnCAnBXyWqLH+TzELh
 jTn42G9PTJko5J9zFwRdnmRl1av8Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 10/2/25 7:13 AM, Paul Sajna wrote:
> October 1, 2025 at 9:01 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
>>
>> On 9/29/25 7:05 AM, Paul Sajna wrote:
>>
>>>
>>> From: Amir Dahan <system64fumo@protonmail.com>
>>>  
>>>  Add the multicolor status led in the phone's notch
>>>  
>>>  Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
>>>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>>  ---
>>>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>  
>>>  diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>>  index 4c631df56f262ba9e730f6720abd94d374b14692..2a612922ecf7ce3f8a0734cb1a31a8a81efdb4f2 100644
>>>  --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>>  +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>>  @@ -6,6 +6,7 @@
>>>  */
>>>  
>>>  #include <dt-bindings/gpio/gpio.h>
>>>  +#include <dt-bindings/leds/common.h>
>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>  
>>>  @@ -504,6 +505,33 @@ &pm8998_resin {
>>>  status = "okay";
>>>  };
>>>  
>>>  +&pmi8998_lpg {
>>>  + status = "okay";
>>>
>> Could you read back register 0xd000+0x45 (LED_SRC_SEL) on downstream
>> and make sure the value matches upstream?
>>
>> A msm8998 kernel fork I have laying around on my computer always seems
>> to write '1' in there (which it claims corresponds to VPH_PWR as input)
>>
>> Konrad
>>
> 
> I need more explanation on how to do this please.

diff --git a/drivers/leds/leds-qpnp.c b/drivers/leds/leds-qpnp.c
index 8de71a8e621a..f6914abef562 100644
--- a/drivers/leds/leds-qpnp.c
+++ b/drivers/leds/leds-qpnp.c
@@ -1788,6 +1788,10 @@ static int qpnp_rgb_set(struct qpnp_led_data *led)
                }
        }
 
+       u32 val;
+       regmap_read(led->regmap, RGB_LED_SRC_SEL(led->base), &val);
+       pr_err("RGB_LED_SRC_SEL = 0x%x\n", val);
+
        led->rgb_cfg->pwm_cfg->blinking = false;
        qpnp_dump_regs(led, rgb_pwm_debug_regs, ARRAY_SIZE(rgb_pwm_debug_regs));

Konrad
