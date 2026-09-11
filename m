Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7304247F2CA
	for <phone-devel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141452; cv=none; b=fkE94D33rE4LbAbZhZMDeTF2x+SZnJ+cG9FGAXMRlZlYSKQ75WGbzqcHjfiixeQ1m7rZmFigrs8UTBIv+jtubXEYfXEm93ud5zI1g7Qgu+JlLSsjriH/1LyrMr/0IqP8XPjGikG2fdPNIxfWGDsxsvREBkqlt91zxsg3Moz2tJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141452; c=relaxed/simple;
	bh=5rX9hvTS9mKTBg5ndn4tdrp9BOneSpV/KhbdJmbZSZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opc2f5L7u+BmREOvbxZl9K315yt9d4847DsT0xR3XaWsoL/ZoC484qj1ejTOSeAIXHnptXNaJEEx+hMmXc9+dj6olOnNepr1cwysLhOHLnjMxyKH4cppdL12ODkR+rWgp/t457pbehM0lEveRCIpN9FV5GlZJCAOdix5uywgK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOFmg6Df; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFGwSyml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOFmg6Df";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFGwSyml"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmWL13962438
	for <phone-devel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=; b=bOFmg6DfOzZ8hu62
	ht9ozoFEEXIZONOEmavQTDXyjm4WyzssQbnemWUg8la+WlAry4sg1J0ufCZCxBgi
	ndl0LL4jG4IJFWUbWNILJv837dZVkIewSsMbOdm8IPyDJiaw8OIe2fFwdMihTL5q
	vrKtq0+2mdPsAyw3Co6sh7mxsA9Zz/GvyM2w864AKvP9vb32aH7uRh0IU5H38JwI
	DuviOCQwdOr+GmbNNm2XUnWpXxU9ypblAqBnxZJJnEKT3vVoDyYX8Av/1tehIssz
	AEw3vO1A4VrpBSP1kTRW+krvLUvjenM5cTArYRWJQHtv5aPdBDZm31oZzTNSyU1y
	5eUemg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbhh5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d204b40aso28969e0c.1
        for <phone-devel@vger.kernel.org>; Fri, 11 Sep 2026 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141443; x=1789746243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=;
        b=gFGwSymlPXukZn4jccqTc3Uhfe2ZNQ9ik7t5smCeb5HLwdwCMHANG2ahmgtcONw81+
         pddK/UBrxVubjZzPSJi9DT/iCyzhtE93Dut426FmVwvXTXgI7o6Pe2Hb8s4DC4EKmHZ2
         FE4alxTDdfiW8M6XXbfkZv/fgbdMVhjz4x2NsRPXwj8M0iokkL9YgZWtJfDEUqGOQLuy
         rLWEV1WuGLCiPutD2JrTKmuqpHNpOgguHwHSJpS40L4UO3VnzExBanFy/rJtJR1EirAa
         ayMvEhT+M3W8QYFcw3AaiHKPtlz2pnA3CUSCmqZniidsqcKRP94dckAjEGLX1ixvhof5
         vunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141443; x=1789746243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=;
        b=NTNnb5lEqF/H0eFx/PL12rO/fI3529H7+a71t0PXQ91kgrXDXHgygMvvbrIZPopQsR
         bjqRABIyHafQ5LV0suVgSGL4TjAV5pG/nUv4A64BmdtlDxmxgjUqA1QHomyGdzJfQaVN
         ZvWuhBdbjo9Qj5oGsYzphHB2RWbw+8fLulHpnhpFmnv9xVAhJEmiEcyk9X2iRAVtxpMy
         zNvf2K8beIrDudExNbfmgYtbG1OQZunka368R58oP0zwVc0aoI9A8WUqzOvgjLJMChZd
         Wy1lvzRzNzv8W/kHrBVi1wcJCTlHeNBMZF4zSLm/rpIsMEWiiqDK5/0yBZlaVW+hThG8
         0Ogg==
X-Forwarded-Encrypted: i=1; AKwUvByPPQTA6KBFodUbJtnp7nq/rVscDVk7rCBlo8HtF9kWtLPxCGyqKMjgK2heZF6bIKXfCyiYA1XwD+Xb2w==@vger.kernel.org
X-Gm-Message-State: AFuF++k97Fib4B2LxJ0KcAJQ3wSqsCC6xNHdO0Sfyq4ll7xmfcMx6Z3R
	xbjSXXB6aHCkW+Ntig69JZRJaKW6MHn6o+uczI733qRd8J06BlM91kSdFACCymlHNH56vIDJ4Hn
	zwvkwV10JKcP1pHgGZdw0G5LFFY8mkKRTr99PtnZSfP2iOpmW6jCHYtDeaQtl1g6dfw==
X-Gm-Gg: AYBFou2n5du/KyfTeUyNqM+fygUhVi1raYWR4dAGRekGgXMlTCsZQ5dAAv+b6AZCs4e
	sVtGaJS1+U6gyBdLDEkt1rvD4V3frQYzoAM02SvP5bPZSHgzjNe06mIOZ+cZdBCQvgILKXA40fO
	mOiiE6hbjQUo9mDR9Ck63vdWbQWY8YKbQgZHFBfrzuWImg6FMa4dvj3oJe5VJH9YTjFI5bVxRKy
	OsyhTnAQZaw+PDd/niJAU4Gn2SB4sgp9iVL6gpbnRtLQr/sqTqRSXxcJwwWxweg5AQJPu+U/e12
	NL+okQFYbHk8nXyjipWhiT3okaxP3oxniblghQeYh1pb2PcXZWPBsVliNussul1LR+sTWh/rAD7
	xhy4vObKPuieaGEjYQS6bQA==
X-Received: by 2002:a05:6102:f9c:b0:795:250:3c56 with SMTP id ada2fe7eead31-7950250766cmr511030137.0.1789141442980;
        Fri, 11 Sep 2026 08:44:02 -0700 (PDT)
X-Received: by 2002:a05:6102:f9c:b0:795:250:3c56 with SMTP id ada2fe7eead31-7950250766cmr510990137.0.1789141442547;
        Fri, 11 Sep 2026 08:44:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296598e8b0sm100060466b.0.2026.09.11.08.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:44:01 -0700 (PDT)
Message-ID: <2fd56aef-6a03-4af5-898d-8a57e7034600@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:43:59 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
 <20260911-eswin-eph8621-v1-3-db447ff9e445@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-eswin-eph8621-v1-3-db447ff9e445@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2UtUoKt3WHVGmvfqazLyytM2W81W_Jjc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX1xKMHaPoO4hx
 bz4QBOQGq4Ja/sCBP8pZEKu8Sw7jJAz9rkdLh2BV2sQhI15mJYyEDgg/9ptgUEEm0+Y70mobv7S
 F+WMrKTs2msJJBSSDHj+X0+uMQmS/1HERCYQC8IoHVmENxVr51aLYPSjlZtpsvdHZX8pYWlO8as
 Izzw7HKAZ36fmgFBaypZpHhft9q0MoFWYnzfqTwM8XaxTYcPigUE8q/AHEnXURxmh9Yjb5uyXJt
 YMpOB8V0EhBJ1PhoS8/N2ohOs8gzGoBKS0f4BS/mZTVsvse+XdWheWh24rb67L2TKgtQV/7O88A
 0jGV5TJ93S+HzzJcrfyKVNOTwdow2HBiqo6+XA5utbhNFh5WgD1/K9wyZdiUEy8nzIBRwf+aJiY
 Y1wBr5HynNMBy229iea+w8R1YTZpJpvfRPO1OIrJGICowFZ4/iyzVXDPDsCzsxAgnZpqWrf9DNi
 W/ahK0XKx8hhIjUk4Ug==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa421c3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=T5nqnGCD1gggo4biR1sA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX4EK8/xoxqOdJ
 ta/sPmwNhw0CzvZFJi8foulK2Wr7dd68Sx/QTC7c8e++6YBb4NBV5AVbOM3Lk9cV5ScsYxHshE7
 iwdPAVDJ3oe17Lv4z3oAXuOq++sKDg8=
X-Proofpoint-ORIG-GUID: 2UtUoKt3WHVGmvfqazLyytM2W81W_Jjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110219

On 9/11/26 5:16 PM, Luca Weiss wrote:
> Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
> pinctrl state for the two GPIOs connected to the touchscreen.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
