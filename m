Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84B2E2F00
	for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926422; cv=none; b=rAOzccfVCG7OR/D0Jmd33242B5SvflhW8bmEso6Na06F37YukW0P/JyaYv2/aE561Z4K9C1YDsXJcQxXIBuD+9JbFySZ8MTHBy9AR5Cw9lyF+589NxXisnBof3l3/2SkCXimWGVtnjcO4FvE08tiOIG6x77ItNrvLT6V9fcAn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926422; c=relaxed/simple;
	bh=Aqqj3hsO/jmsuYDF6kyqSVHKYE8WRUcDj2uljG5/E5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEDHgD07E4gkExmZsVRqCnlb3D88hynACdudpYHR0llRLtyiEoJJfaSRYHFFurv4AEPkv++Zr5Qt7K9DlFP7wzhzKToDDANA2rTEONAaXFPSfG8u9KUxELF/DVYJm7uKYBVNjpJtQ+cl8PtJqcTSjBNVXZgd48R7ywKwhG7yLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNwCkZkp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNwCkZkp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EGLvIp025059
	for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 18:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9f2szhxgh+UZzFbgJJqLUrD7R/OLDcb6sr57j8zYA/w=; b=dNwCkZkpjatgIpTX
	yc9WY1d3XBNraP9LJazRkT0bNo/umaWQ/Kt7NBKrU7hC2W2HpSp5UZ39XZU1xDC7
	uLnlI8g+Wybe4iv9Co8/BhNIPl2EOcFnIvhfihryEWx/5rPkIPgimQaZCj/yLbwF
	zbL/UXZGNBUEx8T0z/s4eQqY1cWQUYH46rIRfuBpRrfV5J/vfnaVQBYnmxr9bdg5
	OlkM96FB6ZHM7RiZ1gUtkVs2KggXyWiDz1MfRuonMSqaBokH6NYDW72cxiodto53
	UetzdFD/L926Gn80ssXwp3TFXDdJADZSnUnrpcgRpNnal7sZ2s7PA5+GhvHyRhD0
	m+cvBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8wen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 18:40:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so77130885a.3
        for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 11:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749926418; x=1750531218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9f2szhxgh+UZzFbgJJqLUrD7R/OLDcb6sr57j8zYA/w=;
        b=nZsbeO7jNA0aRxXIDl1Y1WMIcVTCYNalxpmTFOwu085W76KAguQEcBw4kXwdAvOJYY
         AUFiKizqs4HV5us253PiUsNr8z6hw1NdSVq+jOjy+AxAvinaNJ7Pz9TBjNi96jGfJ9Lj
         Ptm10y3fUfZ/N9yjmJ8LnMQRi4KUq0VOIQVdncskpIBT7HD6rLl+yDayXuIv9EEBm8zV
         UEYVtb9uzNd9WC4cdSjYOW2Q/bS0uMWDDDmndd4I0wDpammtY5hqvQ9NsBqnKaneOUYP
         IeAF1C1edIFhTum52WPiMO6u9UDTxwYX3UDWrWEuEYm0xFO9hOMy9AN2DlpxI4QjPmgx
         wAGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZR3Dj+2tQ9GiIxUkzeDWGRgNBlOnnE19RVVEa1Cb/UJcbFn7jM//nt6fT1SId+lGF5gggHyCKq3rSBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEPa0FeuA/7CQ0Dbdv9QAFcBX1yfTA4VGqad8FinjAwTZK/WM
	igQ2dEr+jWN2LnWrGK8DhNNZFNj9ZwGAg6+5iOLR0O0pu2/t4HTa2S+TnirwvB70qXqdO4W0zv4
	F1Guc4X0Jrl4K3LFdoIFkucVkIP41lFx63AI51MSPQfnLBtcULsiPtjILswi9CY8zIA==
X-Gm-Gg: ASbGnctr29dAgJxYjIOFAj9LhCGrJSW/sy5ln1AlpHhYDr70yYE+NzUv8Pg8EZ65NHA
	IkfuXYTsg5txMCGOuDIQA5xuaW2LJ1beIAu6j5lcAX+8QovKJLUa6KY4P1nDfw5eTrjAHqLzPhv
	KiIov6/mcesJaiqU2p4wjYgy/3Bqk4TjJwepNiTHRlUOgTsSfoNr8TwNuTO3FWmi6N9N4pKcOJp
	vRtAsHq+gHiRJMgqvaSweVpSv8kCKaacrlLFGV4ykXi4U10W39JPxk2IQEo9qWRHOW9d6A0YXex
	FzVhb59WVxWlzSwEPn8oHlFFCbOl0e52RvZuXYcs5Rs6KXEI/77z1lfCRc6uz8NgCKMSec/bP7n
	pYUQ=
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr25772906d6.0.1749926418568;
        Sat, 14 Jun 2025 11:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFetMRfEEm8RJ8Ih0K2X0btyshx3cpumCJLSlApuu2heJsTbu/I1n9XNsB3b+VBct2vH6NE+A==
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr25772686d6.0.1749926418150;
        Sat, 14 Jun 2025 11:40:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe7e0sm343611966b.76.2025.06.14.11.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:40:17 -0700 (PDT)
Message-ID: <9a5130bf-dc1d-47de-9dc2-f2eab4faea17@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:40:15 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8976: Make blsp_dma
 controlled-remotely
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
 <20250613-bqx5plus-v1-1-2bc2d43707a6@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613-bqx5plus-v1-1-2bc2d43707a6@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NyBTYWx0ZWRfX2pS1PonHsw3f
 1En/XiKn34nF8rMJvSfLDVTMXuPeJnqfYeE7HvyNDhgywqMeywwdprfE/TJY4CR9kzykTVn8rcr
 M4sbad3oLABY/mrxZPwTN8+xAYZ+5ioWBT0NSDUTJy1Qe4n+yLcA7QaZA/73IBV4H7rTDEZ6HXZ
 MbbboopiGW2UF/uwUaNlOmGz0IbR11paBc4bWpmFVQB5EeXUc6Ike13AmlaMNfeRA5ZiLormDGn
 LKN+2xqZStLs5exsmBTjewAZngkTk3DW1LzX5Jd87wi48nWVwG6HDReSMwLHAepQfV/Y1GHBUhw
 z12DnKw/EVVHdsvp2KhG+8TymxQ/3Z6P+M1n+8RmUg+bmjsL7DsKTqgbl1dfhai61/p3vCNxUGW
 iSiBBVPuUh11aU8ooT9hoeXGk5ostwMOOFTwfqfzf1XvccCDFKp1qchG/HlY0a2hL85DsZ+f
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dc213 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=HDjIzE35AAAA:8
 a=EUspDBNiAAAA:8 a=FqsyDp_bju1yIiuMhToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-ORIG-GUID: tNWmcnllkngas7NZyv5uF6MGd1nc-Tyz
X-Proofpoint-GUID: tNWmcnllkngas7NZyv5uF6MGd1nc-Tyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=915 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140157

On 6/13/25 12:37 AM, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> The blsp_dma controller is shared between the different subsystems,
> which is why it is already initialized by the firmware. We should not
> reinitialize it from Linux to avoid potential other users of the DMA
> engine to misbehave.
> 
> In mainline this can be described using the "qcom,controlled-remotely"
> property. In the downstream/vendor kernel from Qualcomm there is an
> opposite "qcom,managed-locally" property. This property is *not* set
> for the qcom,sps-dma@7884000 and qcom,sps-dma@7ac4000 [1] so adding
> "qcom,controlled-remotely" upstream matches the behavior of the
> downstream/vendor kernel.
> 
> Adding this fixes booting Longcheer L9360.
> 
> [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.3.7.c26/arch/arm/boot/dts/qcom/msm8976.dtsi#L1149-1163
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Fixes: 0484d3ce0902 ("arm64: dts: qcom: Add DTS for MSM8976 and MSM8956 SoCs")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
