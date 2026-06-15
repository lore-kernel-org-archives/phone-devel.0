Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5263E5ED5
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525384; cv=none; b=mn/vgBZrtsfSjgzI76/FCnOOAgXS08tH52IWXW0m5OGqHu+pFBHCLpyGDoIzqpOdXK4FnI4GipX/8hLh+yJmV7X56ZDQu6JmTbMHhupk2KyN0sac67eB9TV+5oRB2AuKdIs2a4ltYTo3tntAVxgP4/L6cx5VZ4jDbBTQ1rNcUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525384; c=relaxed/simple;
	bh=XtO4iL05RYNP4mvns6ypWCaRum1PPnfMKppbq+fRd14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWDQLzxHysbxsZc7maKRddc/OH6aBxLW18rHd1FrE1DsWStH356sHgunFTWBQydZjVZdH/PefgqEBLxNLBaAMMKz2zUTfezc1w4RxSrqkwe5pnkvu+sZR++WWBz08ZWrUaCFFHTRnsyaQWvrmA6s3G4j1Cim2znCSpDxSBTvMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YC9mLsns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Z+OMh7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YC9mLsns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Z+OMh7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApRIm3957890
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=; b=YC9mLsnsBWNLnUza
	35EprpEWuy4EUuPlGtPkw2oBFoFTHspuHoZZGLy+poR1XlrffUCaYeFhv2D786qt
	JgdMWOwo468rj5TzwhTugvM9yKS+3YDCasvScg852S2ZnDRoWSqwGIB4eqaFWODO
	XDdyu+aTtiH831iXuaIyCxqvqqbGCWdLolI2FydcVPag53wvAizQq7WW2PuRxtmo
	gHWeNmkzmjl3v1d+zdnrhY7OVQuBEgL39gsyAHamPqa1M2FBcigBsJENm1OWDdjq
	wFf//cIKuiCyylcFpa/CoWNwaZnvY/bT5N6mkuJ/aeQ4QELgQyKtsBxRs/47SMmd
	CKe9zA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter00jp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 12:09:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178ac43d27so8521331cf.0
        for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525381; x=1782130181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=;
        b=V6Z+OMh7/NyoXjM1PVtEKa6yg5DPvkI7C8RcgVxnO+0Myn5YE1QCUEkObbQtvnW7D/
         CQnip+0hmnJzrTDt/kyUi7i5rKm+3p3mSPrO+163zxWV8RhdH7/1vc/JXKaVSUHNqyYb
         o0ehtmrVDBuJipeNg5opJmperr7tQtD3++0bxKQOcnkD0KDSkCZUIF24KvsIiyHALQTj
         A/JIt4KNH0i/WrUUZb53Ddpm9/KJuU1CZS/poRiphNdmog0UfKzWw9E8kZnlhXIUFN5q
         JwYLXQ1Z2EtfqtItlcz5kV5yPMYNFny4B28XiERm8Ihp2v0CJFihcCqKVcakWnpoVkbB
         8efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525381; x=1782130181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=;
        b=AVaEEzcQFdokGyZhE5VMgAdZDq9HuYcEHzeQuz4AhRoPoJHOzhGK6W0kgiv5+eIMEj
         BlCPV9AwAe4LVtdqv5tIR2ZHEhAt63vAaSnSu0RbRli/nv03DM462BMJAO3cSMzHqcFh
         BQg2hqDs8GTndVcGkdIH7hcyAuHr9MNnsJvEoHlnnlDtbruXk2LMRTKbJm8R6ABaxNff
         S70JzkMTr/V8+g6GyLZdg4zEB9bBRDL8HNOV3knRPn81vMUHDMWSN36IouFXtt1lmzlR
         uNBHbmqxOAZ4mfBTZQ5Ared3MtkG6X8yMVgSJZkAAkyViFM2vl2Broc+sn0Pi93PN3DB
         xmTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BdmjGJqDxpAJa79y9qn2iV0q6uNWifmvgORhtXVCwsHP77Y9jD6wka8Z69Y5cqgIJQASNZAbDMdp95w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7HTu+Xv2mpKt68WofW9LFVCjuT0xIyuVJBA87RLSFCUK47jur
	zUPBavCS6FLCvT+IajfQ/wa5hMAwp/RmaIaMmTPlFUpeblf7nvMhZ6+V+BNCMEwx9PVvgLDmc5k
	lF9JrGwb59AJVZx/ajI599s44l+f4ve/eCRxU6o/TqlFATa0xFrctvsMDwL3mmQZa9Q==
X-Gm-Gg: Acq92OE7/qKyAQ5vxSavWI6G7RLxxkYgs6mF8zOi01cdBoAWjSe2i4nYFYtbl+m05L+
	FDlx7zhzaF3UObrlKhD6AlKMqo6XNMbrx+WLDw47pBzOgkuH9ETaUzX1ur5GtL6n7fatLsmHuWT
	N04hSghuxFgHRzMEpEyOdh64cJGEr9h1RbGLVJqYK+Zk2P5FJk4tt7IXhTkl3lkha+MXMfNH8vT
	+AfggP0nNyS2rPqIQ46Nm4+MpnbFAZ5+iLrZpO5WcrGxCRVQaMANIFidTpCVj5/gXKu9FEx2HUP
	vUKeqCjWSCK1dufV3m7qSyopC7RH/0hqIjSAX569u3ae7jALR5ZSsR39hecuBr6wAHbyTL8MO9U
	YZUtcnRuQ9tgxKwLUpDAZvW865IJNb0s2CP/AtH2B5JqSDQ==
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1284101685a.3.1781525381221;
        Mon, 15 Jun 2026 05:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1284095285a.3.1781525380675;
        Mon, 15 Jun 2026 05:09:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm3452000a12.23.2026.06.15.05.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:09:39 -0700 (PDT)
Message-ID: <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:09:36 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IyRoqOmDK6pguyLel_BHQayjRE1pd9CT
X-Proofpoint-GUID: IyRoqOmDK6pguyLel_BHQayjRE1pd9CT
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2feb86 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=VS-BQLoWTPCgKDwiL6sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX8ONmf6wyriwl
 +rfjnG5RDetk7Z0GaN9Uy4yAwVK8tfrfkGWJE/KHtUF5Dxk54p1mhx2sAPRL2Deb3Zg1XK4bR62
 q5wnGFgXwsp/uLO4kW4/H5L2k6P4H3SQcP0IEkM+/ppEetFwpBl86rijICvzbzl7N+c1+NoUHTH
 G4QlYogvG8yU5CJK6XtcBbJFjYdk8vG3SAXnwhvs8y8/AhnEe8qo/TGcQkPMo/VEmTUEDWlaCS4
 Zoq71x6aehj8W4i5HOcqMLxWG/HQTgvKOpMZb692asp+5c9iugS9GUFQ1vXSBq6COIUQo7Dff3W
 D1TvgYJ+Myp56qWALy4E28aUzFfl9OVxdqGLEhjxSdYrNXF7ZLNji5bgfuVB8ijk1w7R2N3CTSv
 MBzNP0mVDfvoR07phoYr8wXxqlg6aa4TuEHkrM8tP6tcVKR0p7t98Oq8mF5wDlIIWINx5UP/KjJ
 9FStcCqtaZqydx7siSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX+nGZ3lU43iYT
 kK2mM3J5S0YgxNWGGjxoxPSRfUkw2h+4qPL815ozGHZlwpU6fuTcdgmNGW+Jt0g9C9xdwDapzEj
 YVXbKHJcWqGlGYuJ/1HFrDJmy9ecIDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150127

On 6/12/26 3:46 PM, Luca Weiss wrote:
> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>> As documented in the "Devicetree Sources (DTS) Coding Style" document,
>> pinctrl subnodes should be sorted by the pins property. Do this once for
>> kodiak.dtsi so that future additions can be added at the right places.
>>
>> No functional change intended, verified with dtx_diff.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615..62daef726d32 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> 
> <snip>
> 
>> +			qup_uart12_cts: qup-uart12-cts-state {
>> +				pins = "gpio48";
>> +				function = "qup14";
>> +			};
>> +
>> +			qup_uart12_rts: qup-uart12-rts-state {
>> +				pins = "gpio49";
>> +				function = "qup14";
>> +			};
>> +
>> +			qup_uart12_tx: qup-uart12-tx-state {
>> +				pins = "gpio50";
>> +				function = "qup14";
>> +			};
>>
>> I understand and support the intention to keep this change non-functional,
>> but this pad "gpio50" is for qup16 also, right?
> 
> According to my QCM6490 data sheet, GPIO_50 has these functions:
> * UART for qup14 (OK)
> * SPI for qup14 (OK)
> * SPI for qup16 (no pinctrl)

"no pinctrl" meaning "not defined in the upstream dt as of today"?


> 
>>
>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
>> for qup16 function, I find all of these are missing on the original list.
> 
> GPIO_54:
> * UART qup15 (OK)
> * SPI qup15 (OK)
> * SPI qup14 (no pinctrl)
> 
> GPIO_55:
> * UART qup15 (OK)
> * SPI qup15 (OK)
> * SPI qup14 (no pinctrl)
> 
> GPIO_62:
> * UART qup17 (OK)
> * SPI qup17 (OK)
> * SPI qup16 (no pinctrl)
> 
> GPIO_63:
> * UART qup16 (?)
> * SPI qup16 (lane 3) (?)
> * SPI qup16 (lane 5) (?)
> 
> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
> then SPI qup16 ??

GPIO63:

QUP1_SE6 SPI_CS2
QUP1_SE7 UART_RX/SPI_CS0

Konrad

