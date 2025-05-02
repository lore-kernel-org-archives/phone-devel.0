Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10BC23C4F4
	for <phone-devel@vger.kernel.org>; Fri,  2 May 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184012; cv=none; b=YX9QycLxRXO9XFfZfiSd8GFT4i4f6VkeZH+VCB8+xtNse7QesZ0fLPGut3zdqty4YcErE3SCcJzGKohSsMr8NTmg689xNbYuv7tGNhG28xZx3+kUUrL9IJ9hbO6+BjVROjzYCTJYNq+9hvIO1OsoEJ4s9HXxwsur6Fqz/93ueJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184012; c=relaxed/simple;
	bh=/47+sMA0JkyFBnR95B9nb3p/4mhJHYfJBzwuNp3cdaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKcyQx6aYWcUKmRSIQZtmeVOTojp5rHJyQL7FIT+gmGD/IVtbp7nxbxQrPe7J2uV5QuUe60Fq6tmWnMf2toTNY8NdBg6X4LVqSvzLSfWeBISLpQ3PzJkRaUgYN7JbQywpAhh/T5WAls7hw5H827w1LF6Qh1UfBps/benPX1z1J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk/jsNsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk/jsNsU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NWjA010441
	for <phone-devel@vger.kernel.org>; Fri, 2 May 2025 11:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1zoogZ0mW4AaQa7oJlvbkJUvuNkb6MBNOT54+2ShgI=; b=lk/jsNsUuvJn+oUC
	GUrJtP8ak2oQDXtsr3fqw3ytUMcaQATxpYZZQuaLM7TtfKTa4GQjwjIkkO4UXJWK
	XW8qMwUyc8y/PnUCV/YYfmXxe/k/EEsjJeayFdapxHnYk+sG5pqh5VPrAiMxckrd
	Z4tHWhFXS5vE4pl08Y0+1z/Pgg3Eq48idLLLP0jtfTcfbO7fVIpF+s697usd5eA0
	QNlhh4Ys+9pzC1eMIgenRcRnX50RQ40r97JqnI5rJvyV5pAkOXB6i25al8MbnsSE
	XeZ/H/P9wsdJqLh0dXGiu2fssuq8LexUWUiy0BQaRW7JUl12H/EhWUeH0/DPT7UL
	ug8a6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubr48u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 02 May 2025 11:06:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so228492785a.3
        for <phone-devel@vger.kernel.org>; Fri, 02 May 2025 04:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184009; x=1746788809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1zoogZ0mW4AaQa7oJlvbkJUvuNkb6MBNOT54+2ShgI=;
        b=S3XThn65Nel3Mhii7drwTXinJDdt61BkUQWqP3OBdqGqDPdZiVw2uEFNnB4ECmdmfT
         QHgbkhA5E9ngZ06yrgy4CCvc0ShT+ZII8La+bgwUp/Eh+TPDrP4Lk8m4FeL3xHp7L0Y0
         zNFNVreYVDz4QQx9BaeN8phBvzzaubwfB4Ed4mSLNns1LpNWIt8W8OWGRlrCsdHji6PS
         /hbFC9soH3vRmS+PWfIJAZ4f78Wxvx4KUBhC75RbFinVBZ+pNnq5ievsO6AgQCUDLg5D
         EQ/eXCpuhtd9mzqU13uzCMMbbj/7OLavjULY3ufn7UYNdaJ7HlOUcZ0hTxUqBQJRVA8z
         QRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMNqHgB6c0pVn+9+6+YMCn9jSIVhhab/ILyizM4utA9AbQ8lULG06HUjvkz7YtaQcvGvG6mLP0TfwmJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqctL/5L4tw2n9Ns+VTkbUzbK93ZjxuYJ+Pjgz+clIzofV0Kfo
	AcryH5oHiGwU7yyRiwGe+w5EbuET2CE/IYCqTkhZ52mq6MenJe3xwIeGhKJb3mUW7P/biSY/wFI
	ah8e2OhgEXAVQFZa2XqN3dfCUJG5mtqQInqURIN/zy68KDdmavAAnQdJ1vRM+cg==
X-Gm-Gg: ASbGnct7iEp3oMmhNUIsqUNzz/rrnmlsRHM4ugIeXgdhq4mk2ryA6rQqEXk9liv27G2
	YTsqHWn3et/CL2F+O5J6HDRJYXyeRSEJq6w+66RABfQvZby472+7id4FNYF5weHha3GG/1by54N
	0Llqsi4bBqVyvlaGqVw5fEsoAh2e+5kB81J9DNRhO6/mruCBfktzMofcRUwQEqH7gso6eNt23b3
	+4LDH4Mb1GezoE/4LDilf7aGTuyYVukcXhPkJqPWoqL8IVXSIrdVyiw7Wa3gMnHMu026CYtYGkS
	iFTXeU9wZBP/klX9phYrB4tbbSCzXc9FZqFrBA==
X-Received: by 2002:a05:620a:440c:b0:7ca:ca21:23d9 with SMTP id af79cd13be357-7cad5b1e908mr390997285a.7.1746184008908;
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxEfw/oGZXNbT+wq9xh4TIiYE0dP+RWQJIzPOf851X459NKI0wxZw1jeI309e25HlZlax9AQ==
X-Received: by 2002:a05:620a:440c:b0:7ca:ca21:23d9 with SMTP id af79cd13be357-7cad5b1e908mr390992385a.7.1746184008501;
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a099ae7afesm1820418f8f.47.2025.05.02.04.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
Message-ID: <0d094cec-0a2e-4e21-845f-977f3a77993d@oss.qualcomm.com>
Date: Fri, 2 May 2025 12:06:47 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        Srinivas Kandagatla <srini@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <aBNdCRk_fP2q1vxQ@srini-hackbase>
 <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FWo0mFMuWb6LSrBpkx8oGuCWLk2GTIW3
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6814a749 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=-0JhTq91CruwOFu3ng0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfX4g5u+P/U2V6W GednNVShx6Zr/pygku2UBdAqSWU+XzADnEedA2vYk4h7Srl9gsWZwVO78weVYY2XGNI82ZvOsiT BcyLTG0UykcIPlOntZb2uHvgDRs4TmxL5MMq6okvlwDMlVfw+jMTIkNa0iCsbF590TJPvnMvHmV
 uc3MMbsO6rXMvziP937JCuNIL4SfW/vW6qq/67c9Gj0jgxaAb24jyoAZOHxvGWvRh7kG8InxEPf BveBEbt9SU3l2Vx5nXL5L1vsyDE5MwP7C/km4d3x62yTJtiwGaTZhkh1Sz2H0TZqi7EyNxDf1/2 pnBFwJ7aYW1OzVPyEMTRFaVFiOrwt0mXhghD38hF9ITLu8wY4XV8QeIaY6Rm1F2mnw0CdJ2sCto
 4EIhNXX7N8I89W3tFo40TMTRW8UGdvbe3frRhE8OFdce6TlqKuDVXrmb6KualNmTfZo+J6hP
X-Proofpoint-ORIG-GUID: FWo0mFMuWb6LSrBpkx8oGuCWLk2GTIW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087

On 5/1/25 15:13, Luca Weiss wrote:
> Hi Srini,
> 
> Srinivas Kandagatla <srini@kernel.org> schreef op 1 mei 2025 13:37:45 CEST:
>> On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>>> SoCs. But user space ALSA UCM files depend on the card driver name which
>>> should be set per board/SoC.
>>>
>>> Allow such customization by using driver match data as sound card driver
>>> name.
>>>
>>> Also while we're already touching these lines, sort the compatibles
>>> alphabetically.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  sound/soc/qcom/sm8250.c | 9 ++++-----
>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>>> index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
>>> --- a/sound/soc/qcom/sm8250.c
>>> +++ b/sound/soc/qcom/sm8250.c
>>> @@ -16,7 +16,6 @@
>>>  #include "usb_offload_utils.h"
>>>  #include "sdw.h"
>>>  
>>> -#define DRIVER_NAME		"sm8250"
>>>  #define MI2S_BCLK_RATE		1536000
>>>  
>>>  struct sm8250_snd_data {
>>> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	card->driver_name = DRIVER_NAME;
>>> +	card->driver_name = of_device_get_match_data(dev);
>>>  	sm8250_add_be_ops(card);
>>>  	return devm_snd_soc_register_card(dev, card);
>>>  }
>>>  
>>>  static const struct of_device_id snd_sm8250_dt_match[] = {
>>> -	{.compatible = "qcom,sm8250-sndcard"},
>>> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
>>> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
>>> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
>>
>> sm4250 for rb2?
> 
> Since this name is visible to user space and used for picking the UCM config, I don't think it's a good idea to change it.
> 
It is not correct to pretend that rb2 is sm8250 for ucm cases, I agree previous code was
already doing this, Good thing is that we do not have a ucm written yet for RB2.

Lets fix this as you are already doing this for other compatibles.

--srini

> Regards
> Luca
> 
>>
>>> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>>> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>>>  	{}
>>>  };
>>>  
>>>
>>> -- 
>>> 2.49.0
>>>

