Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DE134D909
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517998; cv=none; b=AGVxbZeWTDFP16jqDQxn+cnkW1bWyE7yL+SA/PkRUNQ7Y7RhrO63RyuepJ85s/aUNYteEAHuY6UyTfdAeqRbwqrrCBnr9q66RyCMaHqOhvAWTTFxaj9nX+OtS/za8PlONbJqxeCZOJkmg2f12Pgjc0LUgSV+/tkS4Ae5+803OZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517998; c=relaxed/simple;
	bh=X0urmZHdfzvXbY8NoOrHIuzCFP2iZaoFZvgdfLjlu1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eN8NKHhhHm7cyREK1ZFVs83WjwlhNr8TaRjU9Tt130n6jooRRSRFP0K1ZE+Hfa+3WmC4rTfSJRb3H35/vCmY4FsYHANiO8CowCeVGpcHCc0YNJQkI0Ra9MaPU8AIrc61XFQCtRA3rPAxWUGPYBLW682/P0RfsQ6Ss4vh+pcjVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBtpIHcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/Y5cSgz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBtpIHcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/Y5cSgz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8TrRb1811861
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=; b=PBtpIHczdyrevmQl
	BeL9I8yTP0fa/ArJfwHQ+AnONo4FydKH1//vkEq2e4qY4CrJWTKcLPFrbZwVr07K
	9vhvDgZZd/Ol4u+H/bbv3irdDXyLbrpMnPuGJDJblSqZpY1Z7Hto0pPlj2S/Wo1x
	4Sh6WiQJtnIsd9j7aNuUWFTMIEZt7Um6T6vhwclUfDWZG2xrAcT8LBVg57MuKUsg
	XrfO2Wjasn4xR8GgSLo+EH1xFRD+4q50LStqGMRKrApnkNo4vn+We6wgZInY2I2X
	gifpAueI/+YHKpslK6QX/QZaU1Mo5TMPQfz4+AJ9hxpBU97rs5uYA/fq4tYnOdmS
	S/knZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn1mdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb456d53a5so28344885a.2
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517995; x=1775122795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=V/Y5cSgz1b+arjKTut5rr41OZ/XYglUY3XymGErlrWyg5B5gIYYsVLetXOrrFHiMGZ
         7yw1KTibAnhnJI4juhswn4A0HOHItYRVs+ckx8aeK+NL9IMBcvEeWnAa75S/pPp73v+z
         ElgJX6/fOB/HJBbRkkvicnaWLENu8wFoNlLl3LRIYmtVklwdzqKOUzvM6atN2l8CY+Lx
         DnIlVGRB3bHbIW5IEn66QVnjWwipyUiI4wTytG9K8hLPys5dl02uD01URBiECRl51qvT
         UCuaEOuftr07H4gOfd5T8xI5KdhlBIp4rviafJmSl9HHUsLQTyJBMasc1lNS3EDZghrO
         5QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517995; x=1775122795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=FDLIgR3r48I2oO5sTi+evcjwhajADekfE7/yF0wx4KuKOY5ber5/e4t/On2/in7AEA
         JJo9mVc8UdzSltTZ3sjOMB5t8zlnx9LWV+EONZMpSfuuRBJKtcCh3o/Xxb3NZyZyg27F
         imNB3PzFGlMRhboP0ifjHhSFTjfCLNpdTv71Cle6ofZyp4KBYfTk25r+UwbKnthDLscP
         Hj44iES1sj6IAv4xnOUEIr0i4jR5m4xDJB1PhwtCEPQCqep6kpYLk0Omro3w95gjHpPa
         pocty8HZnACEuRcoqUE6v91SSJoHyk2XcuQMkQEi8WxlewLdh/rX/FIkmVqmX35xI/QK
         I3FA==
X-Forwarded-Encrypted: i=1; AJvYcCXMSFz6h8bSunkfyKMXO95dBKSg5kew59JS5Bqg9wXNdHbpHuNKzNJpsZWeKpQiCHBSCevdaANuFYIzmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzLBcNjGwHSZS5vwK7u7WyRVlwC3MNbN1dL5wSDr0WenqBFIg
	f+4MMKyXySwQeMf4nLuHrRqiUjvk6R6LEXxZvQ6+NGGT3dvEjrrHZwrvG0WugGRBRqnXFo9fhsw
	MWbaY7jUt1p3Q/jYK23ueJgdFCc4F5DypZBpt7nNBH0EZxAUzPh9HPultJxai1w6Ihg6qsYiMKw
	==
X-Gm-Gg: ATEYQzw2kPt2k1UNvqM/eKmqGYJMVaYU1vDv0kJLvCu619yO1CJA0BTICO9PFqLO7jh
	72TK28nakxSbIPKIC/tuITAyHQ/3YN69bexAvNyQRnKKGXCtAIpGnULDwHrfGA0rgbKZif/sf6f
	5tfT1GYtEdY5XJpQgvQMUAVKoze//0ocQvS4gYThtPb/3NGHBwu6Q8AR/Ukbfuk1XdH5jDY4mCT
	Ge+HkgtXx/hzwb4EGHbd3zj1J7jWo/dqc+CW6InUMf27YLnslFlCoSo1dFxLxPROkdqU33RuCHo
	8PFW2vdx4UHPW7pVfE9zSwcPpSZoyXnlgy6JB04TsvQkPyIu7V8KpUBx8stTmknn6XsuExKBk+e
	TDvp07gcGGUo4TKB+EaR2uSrVVOKmFcQBAHIN8sSvE4sYoIJmZ6aF/vl+KD6GBjGaHneXv/KpKy
	mmTv0=
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648082185a.3.1774517994899;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648080285a.3.1774517994404;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a6041esm837284a12.28.2026.03.26.02.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:53 -0700 (PDT)
Message-ID: <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:50 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
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
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX3fZT7wzH+aGn
 N+3XcWnRNlKJ0MwMYAsof7etKIPjMwMmr1/D/mj7DpsQGJ9gOEe2/olNVpnYh4VjJR2x8JugTu2
 Z+nsnKvKc6zTL35i8RjxJZLxeTrSNQq2/Tcq5IXai8fSYptHDyqs6To8ZOhsrX9z3dK5MXxIkrR
 PzNWp/Qnn6zPQ3JG9BSbrCFFn9UYXCjpcD7O5/GpOFsWRRnp7bm3KCh00Xix0rOGNPDYbwPHc4Q
 Ja7swCb1EThdZwKWiuDJnb+n2+K+CMOnu69OQ9S+yMUopMUOiRkc68kyv8mxuub81tESwu6koRE
 pl3YoeG+NDqr9xzQr37oy+lS3hHC+nNLaYsLyolP0Kb+8t+RptKgHN7Z4lV4YU3rKe23klmUo0g
 FuBP4iI5teV1dH8FF8z9qBKwdb75KPJT0XOskq3u71HNM+HpDxHfjswz/r/MBIHqcNQBJyl1ERe
 B3Lf4zGNP6gK0lTKtFw==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4feec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=2_2y1rQ6RNr2V2Z6SLcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gLSCI23yO4eFNm2TbpP4wFujlEBkRtF-
X-Proofpoint-ORIG-GUID: gLSCI23yO4eFNm2TbpP4wFujlEBkRtF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> Also, fix some bindings warning as reported due to previous commits.
> These are tested with linux-next tag next-20260320.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
> Biswapriyo Nath (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++

I'm assuming all of these changes apply to both ginkgo and willow,
which both include ginkgo-common?

Konrad
