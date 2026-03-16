Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA637CD3D
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660973; cv=none; b=N7oEkY80zBo0v0zZ89oHI26FtpRQezvDndVos07CBUgQyd9sdzPbzptlZuOwOfUOV88jufFAY24ZCR0dWUX3n1DGkzP1/qKVmtmWw6mI644JwWAfYJStCwXUFRXmgXlqp9BVr92ddrezBieL4H3TEhebCk4CmZs1JHj6R/CiEF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660973; c=relaxed/simple;
	bh=8FwFRyaHE17f2syED6gekJanvTHmxZfOiXjWXeA8/o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7NQulVpURTu5c80+CuBRll43AMhb34llrzgWCYAQiPXloyqVUhTbAYpKVJqBLfO+HihBJgZ++dL99CdK2xl3nBLb17K47PYQo2vbTID3Tp3/KhXfMrFGYLPqCHc7aQlNFmZmMGaPJyMkukrVBmQRrkQ8kLW9IJZ1YLA6ek+BSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlp0uamW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr/oDIxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlp0uamW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr/oDIxU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64cfA2672154
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=; b=hlp0uamWMev9OyoB
	o0tQQONbuz2tkrVmFz13Gd4x912ovMoiIcyJuTlGeCUPF7m3UudypJVXUvi97/Wy
	T+mi+oTVwhPQXI+NlAQ3AD+DfHrDrumAPQpK1iphK1HvTQas/dAj5/7vP2BjN9ga
	zhspsejeDWSPDAXgIlvz1+IMkgdyHUbMzhn7lfoL034Yu6VVtpBQBFExGzYZAVru
	uht8A4cMm2t3AqzzsfH5PCs8p5cTPQ6FRXjg9D9cK3eJMxoB8EV6JrIDtB+tkY1z
	bBFn0zk7h7Wo9JRt2ZeKLs4cG4s0A7NidVhuttAms6tq9hnU16NO0Am10FRIvBbK
	aPNtvg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xngbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:36:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a04e9d4faso35971376d6.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773660969; x=1774265769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=;
        b=Hr/oDIxUJzXnJn1i2Jg7OknNknlNpaewSjP88KmqrSK+cEA94wik/BC9OdyAHGPeJe
         wh5xJI2xIkMwFg4Zz4zv0awgaZSS965382SSqKbi4WtCYVdnNJ5iuhCbMbUsg46EnjQJ
         WBoX2JAnqL+6ycl8YK5wFHufL5Ia5tumhgnddii2HAUsegLyZ2ufQVVhhPffSyBnNd0i
         gpKUCpNhII7Jb40PtXRGSAm6/cbn45owaeCzHf4zpopCXJseI+wx8RCxfHOCHZiojDls
         yhDGhIH4jGSqMA9/6z58mjIAbTh/cx4y25iUqi9q/fcscULg0iaC2CkTiGqwJeI/1R5L
         gRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660969; x=1774265769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=;
        b=NPLY0N+MQ1GqEydopZaBPbXWcEKaaCFWhCrkevA1Mnb7HX0WJzhDgjK679CB4+ewL4
         R3LqBKGTCt1BQPO50uJfBbHJyTjbI9xayVyxSsxJRZbKRvk2pLlu083tYsRRsiKfLQqK
         MDCQ15W3nAD3vKlHVBtyrE5fnXy3aFKn0Z4qdL86VcIad/1W7qKwpnCjkkZah2ZWQRaT
         LeqGQ5jz83cAZCdbAyU4IoYrLYaBPz/Dbqm1AVOGExQiUWPawcrJjW5pPXvgsc5Rsk3n
         IjGo31xBXVr/EtbN/vCQLdXXfJuB0tfSdpAfLUz8pf4Xopo4m+8UFcllRXzimITV7cYM
         xS8w==
X-Forwarded-Encrypted: i=1; AJvYcCU7XvvzQZU/J7yBdftnq7jEq2rWueOMgnK+b9jbHXfIo/F2XbrU8Py3RGsHteAbtwVJBXvU8TSVb6dXxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpiWbh834aojepl0IqgXL9XxudraMrQt+4zWb1KGKcPLBq4w+
	OTONTP7c0EXet9I0w/UKAEO/7FVp0k9sFWGVP5POPLkB7iMEyFWVXQyh0QQxm33vGY9BiXfH24V
	ba3of6hB2PPgVOGD9HyCsovmBsmA4PvvrnHOQdsWnQfzDSSaRErfQ2kFesr2pDpN9TA==
X-Gm-Gg: ATEYQzxIxX2spJr37KoDuKoi6iHd0fWSH6+t5im7h1ebkXtlz0+vNWg09H5MWeKhUsD
	5y6y73GTwzTwhLgNV6hDbFoBhXEsjelOul+rPsD8nUer+eczt6HXJNE21CzIaeI3RDVNQKMc1KK
	pDrvzq7bP5iJyCOoSWyqDaR1/6JzPN/oWFVvg/plnlzwKL7Memx5aOnQepgBxQWzLhZqIE7EjlB
	FNlyI5FG+d3tzDlYfre8JwZCdq16rpIBKLtni0bXxjlkZ20NqH7LkTRcFsAhfMxhVYL3K/rmkEL
	QpsDnYMAcwIvLeMB72QHjrZeXQzDTLDhCywzChdYf47EoNHqby7nHUE3DTT4gTOhh0XmLxkDCWr
	QBdj7z1YrydEwT9xqsOba2Qk58mPq6n7IrKGm8jzWMPDCJd24plkewnOWV2BjvIhO/ulsg0/J0Q
	IhMmY=
X-Received: by 2002:a05:6214:6119:b0:89a:5042:172 with SMTP id 6a1803df08f44-89a81992936mr108497336d6.0.1773660969072;
        Mon, 16 Mar 2026 04:36:09 -0700 (PDT)
X-Received: by 2002:a05:6214:6119:b0:89a:5042:172 with SMTP id 6a1803df08f44-89a81992936mr108497056d6.0.1773660968490;
        Mon, 16 Mar 2026 04:36:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97a6d8986esm288053966b.1.2026.03.16.04.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:36:07 -0700 (PDT)
Message-ID: <b1edb0ef-ba17-4add-871b-0903912a4ed1@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:36:05 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4OCBTYWx0ZWRfX/UUdBDl1jFkj
 ptakbTkMIbw1eM/9PO9VDRBBrrVXXSbYDGzsLM3if/qAICxWtj8bT8PY8gkQqiKvKQvxAGFlDE0
 QML6buPXE0/DEfTMSVBn2savAqlpuvJNCFHfm6F5FLe/4x9j8yY5Z3wF0yxo7KbaMz9QlDxOwfs
 vq0JgNxTxSnE0i2IWC9H29NkqmM/IEzP0wF9ePh2ldi3TB8kZv4L8P+RZfAERGd9uDHJy2AL4ZB
 ezHC6/QYsqsurkzD7DSxfGAcXtdJ3ovzJle2o1pQ9QEFnJtSs1JMuxKqS8Eetbzoj5v5X7aGOHR
 ToVfPNr8MBrgOkuhxs0Y/52X8zmwSKeISpb2nTw03d5rlsVvmnyyFlbHfvV/LGbSeE3ObIh4fIc
 2jM1fY+C9swq+aFfO6YUDJe5Wy3VQ5p/vayuVRoek5kZZ30EpO4lX1beq+jloy5Ji3BGjhTX3Yy
 DQ81BxyEJmoLGOeW/iA==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7eb2a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=1NpoCAVN7wpv3VHWicgA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: VSbNcgX5To8Y3ZK1wUhbwerovhuGJ8nl
X-Proofpoint-GUID: VSbNcgX5To8Y3ZK1wUhbwerovhuGJ8nl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160088

On 3/6/26 2:48 PM, Luca Weiss wrote:
> Add a node for the GX clock controller, which provides a power domain to
> consumers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
