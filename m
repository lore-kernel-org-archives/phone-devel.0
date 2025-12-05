Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FBB30B50B
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930923; cv=none; b=OV4YetOSoy9vcCftNWLJXVdiko2wKPz5v/UJLcHQ/V+mTqZk9zNN8nwVvH8gr3zkyHUVCej+JdeqD32gIt9ktk1HHB1HW6ExxFMvEPHhYSUn5dRJcEoFJkr9zy7n579x2qv4wyvz4aCujIrYldqsuug+D9hJkVIxJdjpRTCUFy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930923; c=relaxed/simple;
	bh=iEjCX0WHvNRwQiv5u6ptP9GiNTVvzPOsit4qqiCgU8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/yDy0bQBG+ULhGV1Sr2u/vMhveXaAjiLUM8LLIHnNSkH1scIWnkIJGfEETTAjEIhcrkVmqiSzw8u79ccuZxBidsfgOkuL3rY5qS/9PCaoolbg1YqMwC2CkGD446Xv4rqy6Oe+NJWFGbEVDZobEJicbOcJQt578JyaYc4DGtcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHVXjdxt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5t6SJOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHVXjdxt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5t6SJOX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5544pC3526444
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 10:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulmvaoJGk+Z3nIb1FPpkW4+qcx3Dy89ZRzvOxAdw7PU=; b=MHVXjdxtVtqHeWZB
	M0LIYgr9eiImIt1YUJCONbcdm9JL4ICOA2dFVocx0rYqBHVU32EkBpD1gqypWKYd
	OX2M+Qe/uYKaXkbYhuyWhI6ZgYVvHoRYu3xVZN+A+fpEXWfePGBer7ilhoN5rn+q
	MUNVlqxW1SLhAVOlpfR/2zGPlS7VTWdjZjrvlw+hH/3Bl9DLeJNuhR6IKL1eXtED
	KhXA6YyWWNHxkRN9soCOxW/0y7jr5wh1zgngtGg1U+SDJiTnS7CD4RAlzUCPSv0h
	ws590kjHozYRWmVcA247bES685gb5TPTEAimnFs/hw2JENuuh+3Fia77M/IymqN1
	qt2l/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvgveh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 10:35:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so6067441cf.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764930914; x=1765535714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulmvaoJGk+Z3nIb1FPpkW4+qcx3Dy89ZRzvOxAdw7PU=;
        b=c5t6SJOXdM9DOek073FbFG8nqN8O/E+KXMcC68exp3W6dXP97cptruOABhPQLJh2Ea
         0qBIj+xqz8b9Ky3SwWbBFBQzjM8sm+aLWXc9fQPIsRuOlxvwnTLcYm/dgmUEz3/lVpFd
         EBORYdE/bNxVi8GjbSzVgOeTSxYtc0FGPQPZhL/ycZWpfb77em5xskgJDxEFmuyvppXM
         2mGGr/8KXP7glKQ517jfqcoPjOjS+zw1mQzIyCTIDQ1TdrOgHii8tz/QQDJJSvC5Ysn0
         m7OrGFE7E5Di3uNfYZY4iNKnzTdAJdm61s7rztYI9dmSE3cuu8IsyUTx+Qh1J/fLyI3/
         QJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930914; x=1765535714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulmvaoJGk+Z3nIb1FPpkW4+qcx3Dy89ZRzvOxAdw7PU=;
        b=jbkVuQV4adZcpJNEVwAI+h/pTcCvTvC/48qAZyxOFkNd8K/KPBmtvV7oQgkZkCCMQg
         wGtEqiQ4GS0zmNdKI4gMHO7xNVDhJHhxPnr7bcY6uZmgAsjsAsPInx1J7Li8B3uuni9K
         5hwRJHWcmfGColcLbhtnO9oiauJX3KF4VLcq94XSRFkOzPB1Jq4rvd5/6+VhY0Xd5zzD
         kUmdSkynHbdhV+aRKQ93XttxmTrBO5HWAuEjKq4DtXYR5SeAzzRkJuWDwNaDBTqPeHbQ
         Zpe2QSI9lLm8Z5AES1YliqoB4XS3Y8Ir/csvIZMqOah1A+wbBRRPvrcqhsstZJ2t56/c
         W0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX/pqRHgW301W/QOj5PSzb+k7Dhu5i7QOOvX/8dXQL+oQzrPs9G07rJsnx1CYRQdAxW3rBMqoet/C/MIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpXSazWWRNuqk9+YMkCt9BFKKqPrrbxMlKmxmmtVRWW+WAXpK7
	9QyzC5xU7hxYQdF8mbvC+qoOHNfSkbwVKZ8/fBIgkTE6DT/vQfkDcEtzaae2SkY4rzvQIG7o8LV
	dxZTYFmDkqbjpbmhz9uptRpKr2AeSvHRiBS3MvBZPL68wFLHFqV7gAbFz7MrAIc6tSw==
X-Gm-Gg: ASbGncuLTaAUYR7/eyeDZMYLEVmyVhR6StsGQhZcdo5eKlqmMXHDaUwWVi9Z/o9Xn9y
	IK4Z0+Lk9bMe8kSddiQxh4YL3fkqFOUFHo5+piLaqrh8zC/pjniNhYFbEHtg2KrJLbEcnlEvBbJ
	MOBOmsClsHL4mIYjUsLgmsPq4Wd2cbBEluRbl4E+J4oPySlh7wr16IeKv0GXuj7UyPKafGCVgPn
	MMmSYzh4oXrr+PwdkZe/eHRS/gfZcY6fjEFMmJutznFd7Ll7Tb53xfX+wocORugTetC6XVng96S
	AANwq34zwA38+tcZtumOgYHp4gPs0H+jYiRGmqjza+Dcw/a7fwE0Ocgc3p+Sd8uhSoD8ETm4BAZ
	40C3CIxDYbVC0Ft5Q9J82N0Lpk9quh864C2WDAWnzk0OiyvE/llw+ZnNbloihDdsSRg==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f0174e90a6mr98778841cf.1.1764930914441;
        Fri, 05 Dec 2025 02:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfGsjnWMKGmrhFyJ1oVsKt96PNqbVZSMd9kS+e52FE/3ti3b5lmWx+ywE9mcyx5XE1O1F2+g==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f0174e90a6mr98778511cf.1.1764930913923;
        Fri, 05 Dec 2025 02:35:13 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975dcesm332867266b.34.2025.12.05.02.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:35:13 -0800 (PST)
Message-ID: <9b3f2adc-bd64-4f6f-8a40-9e2884e46782@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:35:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-10-80c1ffca8487@postmarketos.org>
 <84a17875-0542-47cf-ac4b-5af7bbdc5edf@oss.qualcomm.com>
 <7909626f3116fcb9feb25b77820a98da56e1283a@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7909626f3116fcb9feb25b77820a98da56e1283a@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NyBTYWx0ZWRfX85rVP7o3rdlT
 4JKU6UeuVyJ2WbWXfth73GH4MliY/Kqs2S5BaKaV+D4zcd+0jI7N1yDDJCAdTswGCxxCmLKA+xn
 mrYwoVVvPM1X7+PVGqk35ynTyeWOeXWsI7BaQM0+2gqGPB+A9pqxNazqS/bZKnMa9lDsqkxT0aI
 mu02s/WIfBXb8Xo+U5gMteN4bv9436SdAIOZ0YcsUHA5WMRoE+8I1uINfGhi+YCKljKf7PZymVO
 1vduQslYVXm8JjfCkcoLLguYsij8ZgL6d+sEUQiwi5ERbaSA1qvB5tbF9fOpoIu/0eA+Mk/ikcf
 hlyzOeE+ihsqhLGrmH2gvt84DVazKZ7dQQQ9w0iQbL/qLORNgiqblajTRLHmpLH46YE3IddEGH8
 HA3eNI6x16EQaHcYFMHrl3kOPHpOzQ==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932b563 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8
 a=T4PGsqDLbnwIIwvigI4A:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: c505fa9FASOZYDR-PW9MRwm4mLJA1KnB
X-Proofpoint-ORIG-GUID: c505fa9FASOZYDR-PW9MRwm4mLJA1KnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050077

On 12/4/25 7:47 PM, Paul Sajna wrote:
> December 4, 2025 at 12:50 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
>>
>> On 12/3/25 10:40 AM, Paul Sajna wrote:
>>
>>>
>>> These regulators are required for the LCD
>>>  
>>>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>>  ---
>>>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>  
>>>  diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>>  index 8b88f75b36af..cdaf84de5e6c 100644
>>>  --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>>  +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>>  @@ -56,10 +56,27 @@ zap-shader {
>>>  };
>>>  };
>>>  
>>>  +&ibb {
>>>  + regulator-min-microvolt = <5500000>;
>>>  + regulator-max-microvolt = <5700000>;
>>>
>> These ranges seem much more reasonable, although I would still
>> expect there's a single operational voltage - unless the panel driver
>> is supposed to call regulator_set_voltage() in some different power
>> modes?
>>
>> Konrad
>>
> 
> So min/max both 55? Or is there another property I should use?
> I wasn't sure if that would be physically hard for the regulator to maintain such precision, so I cross-referenced some other DTs in the qcom folder and found this 200mv allowance in one of the sony devices.

These regulators are very accurate - set it to 5.5

Konrad
