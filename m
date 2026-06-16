Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BEA32F742
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617432; cv=none; b=skygDHM58YJgK41e4MGw9bFB4HmvCn4SYM3yXvheqAnyylTLXIyWcUsKcl2ddw3EQypUF0Bsu8GkhFmIYw3isg983yDEu8VfuM5ut1BW+rY6pSRsFpR5XXkfR0cPw5xerG+qIAfU1momEg2YhqxTSavRTne2x8PWLa2IejU3zlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617432; c=relaxed/simple;
	bh=bKV17d9tguID0LIesu8rxYoO2nZDE0Plv0lBRFnUe+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECjTFMPV5Gb+AN7aklIXav3B8z7EcsbiYk8AqFU/kyc2BIJ/rhFg5uMyirAlB9juj7xJzlGbJXOo5W489E50DauIb6tl8nSnAnmfW0ONAXXwTsST4EM2RK8vDNHiDFYkuShhVURCe5aawwUPjjgENXdmcT8MmCBs5QfzV47/CLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbZztLce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4iR8TOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbZztLce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4iR8TOz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACClw3455455
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=; b=bbZztLce5htqB+3O
	+w1Fo/2iUHCgOt/hWdZlXc5G4Qkhq8hGeyB4Yyu6TtF3S7Egt+gVq7wBbpT2nkGW
	Ec15ZJeh/EIj9vqjcF7udRq10ujntgMSuiv8UPGdXmTW5N2Fo2urgiU37quZnGNu
	z+SQSfXo7mByZkiJj6RKN4hk9uimRTrOfNWhVB7v/+UkBDtaeD+q9S4n31Crivo/
	ts9YRcjEbNeH9eQVAnGf1baKzyr9zkNUv0R9lZrYP/umcsoUyvkS4PbHJPHVxhhM
	rQ0AhQq4PD92Rz0qQhRbkzLA0g2sywlndUs7TmLKm3718/0hGf3nVZJLruVVPL2s
	fzMkRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkgyc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:43:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5198e72249dso1302891cf.0
        for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617429; x=1782222229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=;
        b=S4iR8TOzNkYPiPcwtuxxrpxzB9Jet88oDuKFRMlACWu+hwCMjes7whw3Z8ljAhE+zu
         2UoXT6wDoQbrd/qQ7s+5fOj43fv/KFd1lAGnzLLnGifI7XASFAu7gXDfY5q5xIRs6/TH
         lfdDBBYMo1N5fiucCKWx+sM8i/5ydE3wpn19jg4OH3PrNTv20YCer4++TDt2on3dVrVw
         7V4ZbMa6Va+2Xib0thpz2MnJeGtPf7d9LgpL/+5MdA9kDVYMOI0C1R1L7PLmM9i4R6nh
         WgKrFyYYSASYI2tLOA5PYAvuXUC3NIbrXnfuIpWNfK1rUxeDC4DWRWZtcYGbYR9PinMV
         0i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617429; x=1782222229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=;
        b=nSvK1VwDUJE0fB0P+BMH8JkgsU8RJHeARiBZ9Gv9TgqZGTkLlfhsTU5h3TZehQpMgp
         Ll0K7ZSAYRq7D7jzJPOKpwByUqyALn3FghxpSyILGfciXYSJVuGgapKv/2DnEepLkX4H
         cOPdLMIlaRun+kzumY+G/HWz9DMK3wMzQoncMnXRB5d13svfRsMMMBqJms7TdCkkxpID
         LRxlgpIZQUkHDVStMsD6eOiCcKeEQkHY0Xo/86qby0F/HwEnDwB9QVwij5wILkNpox4a
         mhteq0Tb70uotOP7lwA4kukN5/p8Xb0MbmhpwowgStePPVlR/qQyVNhGMGuQpAWi7Ucv
         MmaA==
X-Forwarded-Encrypted: i=1; AFNElJ8UUmgN3j2rPCJGJxwQo5+6JTeFUULsr2IOjpJy2DxMtFfBMlPVq8eY4nNsM7427OzGySHoVchKvqUQ2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4nsHSx8Oi9PrOyKZEpeOIRnhFjbduPa4qSrFg7Wui/vDOCfJ
	CveNsGNGG0+JpegL8bLgaRGJ2qf12McDITWbr9OZ1FnGKBAjwJvfQhER6LvDjFyCQZQ0qyUhG1X
	Ce5ZgFviQ+LbUELFtRRyANi3SlE/BLALqM374U4FYJLmXh+zfU/fxNEtba2bzVqfc2g==
X-Gm-Gg: Acq92OGguTzhD5zfgklEWgHiXtaOUlKDL9yHcWvkRvPAo1vzlNU4B/UzzcHdRI6qoDp
	H16nTtrU9lFgR8P3lrDS1NPIIJbEM0P5+sGBtsWpatDrMiQ2wN1SZWwHkDjTqCNQsGw6QkAY/vu
	3U7RPlFMIhXjlJN7v1vxDYRsWn42gi0kkDnM201rrbZrlDEHov52QzXdUPU+C18UZvzhZlXCdSW
	Ks5ue/7ApnegWdaugWB2NKeaeaYplP7J6LbMAF6/7E2BkzQu694kLVnM0TT86wqv3302zx6WJPD
	XvwTkNEaJtOGiZww6DB01nFGZffavsterFuqKCjIgw5I6Vqo3H8LeDmnExkLuhf+PqXrnDPjvd7
	o7eYQmkOjbQZT+Ypth0UNkuLhOzrKTB1MedhElZBp2Ox2/Q==
X-Received: by 2002:a05:622a:1a98:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517fdea8e41mr196169121cf.2.1781617429163;
        Tue, 16 Jun 2026 06:43:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1a98:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517fdea8e41mr196168641cf.2.1781617428618;
        Tue, 16 Jun 2026 06:43:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693c6d7cf3csm4133056a12.14.2026.06.16.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:43:47 -0700 (PDT)
Message-ID: <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:43:44 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
 <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QTiAyMMS7H0rVcuWCSn0VOcpsrUfczQs
X-Proofpoint-ORIG-GUID: QTiAyMMS7H0rVcuWCSn0VOcpsrUfczQs
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a315315 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=wxLWbCv9AAAA:8 a=kVRP5i783O7quJDYENkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX+j4+EtDZCj1n
 qcBWKw/TBOo4yPoIWiCllsGFNdqaM0UaJMPQAaiMCE1zBDCzMrU1cPYUHGE0G1FdNqm01sjqQZ6
 KyYljunZZpR1jrROYxyn4WynX9U2ErY7Z9jW5eVkAHwPrK0IAsn5vCFfMD8QJTDJTci0bbNTvc7
 vYrLYUYUcKw4VpJET5gu7jYCNAuVsJP/PR8OBWtT2g426CKN5BKmIdrnB68N6UdWFcYESQsoCiG
 2sijuuQeU7Cs8/BZV8RcMK5jqWIzMkqYGeX6Q0EUz1OU0ZB3pyhjhUapdNvEHmj44k9FJILAWT7
 5IX45ma1vwYQzHXbxCRMvWPNp/Gza9TJCuVgfvstD/BWvmYRTHc56twgIj27cY6wvptAb1YmT7l
 m87CFx5WJ/tB2knY817tQ0fKlj5GSEjuSmDI7FmZT4xNG9I0IEliSjJzpiGIzjv3EWfKpNLFpNL
 zCcRJuOYTcdTOWKgw5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX7xrrjTgK0jrb
 RXAN90ue3qa8dKe8Tcw1ztAECziBx+dfNwyJplz3qfTYs9JImQEIw/+z4NlpjhowBQJDGjdSZKb
 a/6wafJWjvd5hYUVvAm5bTYMnf6/MAU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140

On 6/16/26 3:04 PM, Antony Kurniawan Soemardi wrote:
> On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
>> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>>               reg = <0x12500000 0x200>,
>>>                     <0x12500200 0x200>;
>>>               interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>>> -            clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>>> -            clock-names = "core", "iface";
>>> +            clocks = <&gcc USB_HS1_H_CLK>,
>>> +                 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>>> +                 <&gcc USB_HS1_XCVR_CLK>;
>>> +            clock-names = "iface",
>>> +                      "core",
>>> +                      "fs";
>>
>> The bindings change you sent changes the expectations - "core" used
>> to be the first clock. And I would guesstimate that the
>> DAYTONA_FABRIC clock is not really "core" - does downstream do any
>> ratesetting on the other two?
> 
> Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I don't see any clk_set_rate for HS1_P though.
> 
> Would you rather the other way around? Like "core", "iface", and "fs"? My concern is that such a change would result in a large number of warnings for newer SoC device trees.

I didn't notice you're actually aligning the order with bindings. I was
under the impression this was a random change.

For the clock assignments themselves, I think the schema reflects a
full-speed (i.e. usb 1.x) core.. I dug out some ancient doc that says
that we should have:

- ahb (bus clock - perhaps daytona in this case?)
- system (core clock for the thing, >55 Mhz for compliant HS operation
  or at least 35 MHz for any sort of operation)
- ulpi_clk (60 MHz, coming from the USB PHY) (we can probably ignore this
  in our description)
- inactivity_timer since there's a BAM instance attached to this host 
  (possibly handled implicitly)

for the record, there's 4 hosts:

USB1_HS @ 0x12500000 (this one)
USB2_HSIC @ 0x12520000
USB1_FS @ 0x18000000
USB2_FS @ 0x18100000

I don't know if they are all exposed and functional though

Konrad
