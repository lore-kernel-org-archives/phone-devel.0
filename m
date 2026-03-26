Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6C348465
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518016; cv=none; b=nqUddiIHOjfByksBnn45jv6yeTHcBVHNbBqzSYYX/vRDKvlWVfc8th4qheonByZGaBf7/oRu44ynDHR7vJrMYchQAlNlf3qXoKJn111UdmfckLDKUHqmPR42GZKK4HUQjodRTtk3EWozYvKzWjqi9P07pOWlKu8FrrmX/p+qUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518016; c=relaxed/simple;
	bh=cIepne44jy0x2zDmcPWadh5Ql6TCY2pHBP38cCOEhhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhRmsaglz+E8u3aNwk8I7BCEn9/vMvqPBKsHQh1fMqW13R8/ucIq60hG2v826GjDR4QGxxF4k9cWDtkMqb1D3cQv9uxuIysB9do27y4Pri6oTxOcYSeJ8zjKNJ5DUwCBcoB1/wIfr/YKCb9yxLV6J5lIN/XB1Ind8NUJyUMxmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4q2i3cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNPli95R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4q2i3cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNPli95R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q61Nh41175792
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=; b=b4q2i3clmFLWLUal
	Fw9ajmi1yQdy0w3xl3tJimwEnMBh1MXHGgSBxql+fTAAkDJzrB2L9xRaVxP3hbUQ
	LrpgOeVS62PLtU8ag0E9FP6NQ/S6JdjnPLw7F+Av118rTWkuhZfKPlKG9CWExApH
	iXjkIFdScIL1unNnPdPxbqSS5MPLEN6gsuYKxr291SZ7TiFOcBDhbHIGAGXbqWm5
	8i5lKH/v4mZ48HSdUB7QE+HSF/uTVemzb3WquA2iwEAucOPiBttksnMTEP2mLwWp
	k26hIWziTGYqLQTMo2FT+7sxUZzSmwFRbZ4/40wLkE/Q3GXdjWfhxDRlvu2ZC1QL
	4WBX9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76t6s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:40:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd541c0edso3430826d6.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518014; x=1775122814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=CNPli95Ri1ZDalFJJWpVS6C3KvkNdkhblbnz0l33osZvNrRVYXzG23Emix95Z/6XxO
         SkmQjEakwBh1Thk9QnpYhXhjjZIUge50wUy3bTV3ddHaaVOb+g2E6wGLVrRvBDCkW36S
         PnPgIOkWevldPkOgSubob6fB/y/ql3a8WsJ36Bks9gAX/wVEijbxXwRIPrHwiL1XKlo2
         /+hm8keoQbFt5cqVTeyXcnHDXCjODlrIy98beX+mIeCaTqH+zZyW5bCGtaAh3NKikZlv
         UEWvST+MuNYQAaVgxk8tq6hsrSEwag1wPKQ/2EsGcHsmc6hfC/9s9OUdynjbl99B1HUl
         U1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518014; x=1775122814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=K6iI8VYIg6d7DIB1EqI6OQtgFpnhfxtnoXnMelM9KfYcuiPJDVYUs8jQiDG2OHLvb+
         xl3/3TRjWqUlLzuiqisIrkXP3t5qQJRzfdHWNsc37yyJDSIbr9nJBkIatztmDTUhGF0I
         R3ok9537TupHmikxRHvyJ8qD3y/0wimrjUqIhfrIft/leYo3+tOFb7AZStWlXy2lUTkI
         nVMmIh1qgYHUi3ftxaCeRayvZP8chUCMx75v8ioJWa4DnKynMyLMurOWeJ94OLnGBTGV
         hcY+mrvAwyn9csqSw6lHFtWNOicFzjw5xEpMB6k1VsZmcHVnnLLbSOMtwyiD8f5oZgwJ
         U9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWseG2UWLVddq2rWUrY2QM8N4OQf0PQGnXYI8PONve9UUGQRsNA7OWaJLXNEC8cX6GI7ERKTu2aOFoR6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHoKE/71QDZOXLClgm2SJ4/CMDUNP3n5OTkXKP30ZUzu348gxw
	wBszbpDgGa31gy+QyRZ4X+8hWhtrSEfZbOqvTJprD7Gzq8haC8EMzRbiotdk98glsAvVSg1F1hv
	7/eKdnv0e1ZXvqL90x4svwPO+i8ht++qpFjr1cr7/s8VqPV8VCnBW8pioJNYUTFI6Xg==
X-Gm-Gg: ATEYQzxDmVNOP/M/scaRgFoASGsfEKg4YvcX/4MkMhUX7o7hUrUwDNDjNw+J1QIndk/
	ax9uDK381tSimSiL6whicOZfyduSgfXy0OpEDZHS7Vrq2rPCw0xd2ITnCqUu9UwTsb/Xr2vMj15
	9ENMpeVWokZamVHpPWWZ3+tduTONPMRzBwFG3m494/vWa12s6EIhmGqmVb4z9MFfZe0wAV2M5cW
	wuEAiQJrejB696jsBOc6sJ9cLlD6F6+yJKFhVEnM6fZLXWeyA2R21ZcoTEAyNQMnRbkWIR0FQfs
	zDGFbHjTokfdTtG6SjoIBy01BwPjNJH4Wz2M78pyauY8zwAJaRAY0RjWR+Za9mv7GHJqs0QTWMj
	G4+FBu4gmf1kt69oX0fUTNovPHoMCUe5TNla4lOTZzSexBRxI8X1V3eqE4kg+UsNzvzNarOfFBg
	xqOQ8=
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673616d6.7.1774518013925;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673456d6.7.1774518013540;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20264ed6sm94765266b.20.2026.03.26.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:40:12 -0700 (PDT)
Message-ID: <834f159c-c1df-4738-898c-13e89df53957@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:40:09 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4fefe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6skNi_Mt2WqB1r5J5RAA:9 a=QEXdDO2ut3YA:10
 a=fFR93BqyA14A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 3DATusOYm3fVB2AuNKniYMzcqHzMTSqa
X-Proofpoint-GUID: 3DATusOYm3fVB2AuNKniYMzcqHzMTSqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX4ctQKmOZTEGq
 HDOT19LliOomxRNolYM5WEIx/sq9PsIq0XbVuXmpYYczMKB6+EQeJef9X3CCD+dRDEBVteStnxJ
 1zXzPIOj4od0r4IW3HtyI8oY18YMmB3QgN1NC7MzPI1bMgcAJw/+T5vn3VG6l7lVLsuWid4lRNl
 GrQmYGp1pt3S5XyULbhV3zQJUAgGmGO2Y/g74QysvP1FJSIbALxj/DDFuSkP/Nv5wFacQ/YZVR5
 3C1g1LKbAN2EWo6pw/spqhWZD0Pzk2hT/vKBO7DN0T1h6t2Qg2JcTFGfTZtjrMLXgtEqzdOWDVU
 mtSxe43/re9SyxrE1BNDV7hqgDDRU/As/STXhX1nTMFbf/WsPh0qYFAKoHgQucadiWVtxUjW06c
 0XQ/RO+lwWk66itwsQpmjzdI5rV6JBjzAOt28InbvqhrdqQVuLpxQZJfTZG8/P9bCzUKXVlD4nx
 /DTzjEVVZr8TesrkewA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
