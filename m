Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069202E92C5
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150592; cv=none; b=nWRgduQ0iX7hAdbpbUyRPCWlHieGCRfYxd/bKk+yFd7QjS1IpwW/poIARLtHfcOoMwb0WzBeClouvTqqWeSvEG+Lw5g8JTFdmnKki1civ3txod+dvhw2uYlXBIor37nB6EGdDlp8PI5we2R1/nN7iz6hdSnRonZEkruOcX+HOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150592; c=relaxed/simple;
	bh=aL3HjbrXqAD6L7Xc0fFY03lrdZxa+2iBQMhBs5Ndh+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gawKvpvhBYaUZz9MMzwsjJcQ6Wzi2YVfyXmUpD1QJKisEXhnmX4qB611c5dkcuG0JdyYxpyI9/MM3gUflLzfF+Mg0sQ3SA850X/EoVnLCD+gw4x5eUUyM5fTzw/3q2VAGc4fL/VrcG97POg74zB/zEwzxHbUaf7phZtKvcK7qxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJvsZi1q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJvsZi1q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9HRnI032001
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 12:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YMeQ302waQ/lVXch317TVOxg9bPEhO9O7NnF203imC0=; b=CJvsZi1q2495tCk9
	46Vx/lRJaGBGBSBROIyzMx+d79OA5D5UDuImKmIxj8N1mnV0JnLcCew72NyQkMrr
	SW8S+1Re4Xx45SpgGh3ysN9pN4WUZSARzaVfmlAY8rfifFl2U1+sj0oxEs7AgOJe
	+s1u2tRcBtvtfclseXQMyUF7RsgNg//DW3Ae+qXRKIEc6dHG4NLlKLo2IG+qQ34r
	OCBQFB14A7Cu2Rt0WVmrWPLsXat8FilyQKDZh9FgW/ySmthJrITPnyMAWVIGSFXM
	psxM0OH+e7CPLz3WKumov50EYpClIWZ+T2SprOBbJOQ9LcCE9iwvFG5vBV746lnT
	KIA5RA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qyhf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 12:29:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ba561898so8932085a.3
        for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 05:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150589; x=1752755389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMeQ302waQ/lVXch317TVOxg9bPEhO9O7NnF203imC0=;
        b=r8l9G5H0ypErV/TO6w/yfM581A5TjQshEvjJiWLJu7I5m22HFLG5I9fQABN29NubDf
         j9sNTrj7yO2/We1cuW1X2+/aQQyfCeUj8NVim6LHLkSNga2l1pr58adyOLyqwxjTWWdW
         DLoTNwsg4cAC4n6QHAk2E3FwWtyRPzL/precHPpSsPKzWgX0579/OwB0qDmpIMQEf8M4
         Nr0hR8aZAF86F6t4z7ErrM+3KNWpT0isaQBT0rDisXs4b3KKBWQY9w8AXCfGwiQlP7y5
         2BVo2DneAEzMLM4kjcBUPCELpN/SRo6yjwsl5jI0gOz1lCq8gjdJ6ZF0/gf32FcEqHjR
         rZMg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Z2qDHZM7R/JR3tJtSg6NN1onJpmLgrlbpLaGYUCUZQUlVOWLm/sftvxMKq+biAlu3V9p0d1gYQFgJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfGHuTtENU5T2SL0OHUgT9fo27b6BX2/fhFbdVzGgbPl3GtIcA
	xsYvHQtXdYEeODdTFiMyNgO3IfkUcha7QJoezEfJXRaZjznhv7VyjajQkzdSmEo4Gh5vWl5vc0F
	E7r82ZCzlBoB+r3OYDa0Wf/RVRQYLjityzDk0YAWsyPWXevKwc0KbSaVB6zE8oyLA3w==
X-Gm-Gg: ASbGncsNcIEAx7RyBLiN2MkmpU1+Qzrt4uV7TKuLRCVNiKWA/M1MogW5qGo7tXbxWIS
	UO+4r0A2gIAizWBOf847runip6TvqYHgA9xSJ6TF+xxDE6HQwBGGwUgSpSP7wpqyB9+Sl+s1ec/
	DN3crlUniqBI9CPjocgY3QtdR3TJ+jizYGI4FTF9gRvq/MFG7fnBmPInRrXw3erABg8n8FQv2y8
	XeGGGEenOATwiwgBJKiWth3oiIWUVCGI0QZm1LRvpPgZerxcVZVhIJuWkJLQPCJGWt4aGUtqhzh
	YiXubfM2CFJnkpK9w2k4kFMuWvO1qoeTxORz2xT2k8E4KeoYEGL9+j+Taf2tK47f6oHVvsE6t5A
	JyoY=
X-Received: by 2002:a05:620a:192a:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7db7d3ad273mr306326585a.10.1752150588603;
        Thu, 10 Jul 2025 05:29:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoLijVe8n8HkS++sYfgSY4jCehRjGuNzgRewdZVKw6l0oW8rg4uJs1mwTv59gejgnKmNBoVQ==
X-Received: by 2002:a05:620a:192a:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7db7d3ad273mr306323585a.10.1752150587891;
        Thu, 10 Jul 2025 05:29:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976f333sm803699a12.64.2025.07.10.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:29:47 -0700 (PDT)
Message-ID: <a2567891-1dd4-44ff-9853-6f9a451f0a74@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:29:44 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
 <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
 <DB8DGDEN23D2.1GFB8XI0P3YLR@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB8DGDEN23D2.1GFB8XI0P3YLR@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX4wEhuewaK6Ow
 bydRndS8tj7Fu4klSjZv+7ApgwKe6f6lh2Z6vRZcaS9GmqlWMSxMIgQeLhjKDmDm6ZkZGmTbmgY
 /1OvYBrUMiZ8CTTiHDRmY/TzLZa+yXrlNxPredvIb4I8YHSYvhqGu5wh0PRT8+TAdvLpb2uFnh3
 CO4sa8e+448zonZ/E35h+nsdaEy48IWGD2WHxPRJUjIW6DCRUWaWGowo0XCErf5RRe1ECDnqvI6
 T1/HJjkfzx3qi3q9gxmWb0daMGo/hbRFDtoJ3NuYQz2x11BjZN9FMkQOvfFAIBxZZFb2VPWxe3B
 6hpixqGPKE32sAX0J2W0fgnsT1XqGkXQASNThHJq46Rfnr7ORfuUj+QHj1AYIFEdrOM46bayXgo
 qWS+lMx4/vYDVtvqdGEnZTJmGhXizQtn/D7Ufwpn7a6JnuFRyQPZjZz/CD5LX/uq52DnLkrp
X-Proofpoint-GUID: kLNBarj5w7cpz29Z41fnG9xUWOzaZIYU
X-Proofpoint-ORIG-GUID: kLNBarj5w7cpz29Z41fnG9xUWOzaZIYU
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686fb23e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=RC4AtmPg6BGSdlR6CyEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100106

On 7/10/25 2:25 PM, Luca Weiss wrote:
> On Thu Jul 10, 2025 at 2:10 PM CEST, Konrad Dybcio wrote:
>> On 7/9/25 11:18 AM, Luca Weiss wrote:
>>> As per the downstream devicetree for Milos, add a register write for
>>> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> The downstream driver supports an arbitrary extra init sequence via
>>> qcom,param-override-seq.
>>>
>>> volcano-usb.dtsi has the following which is implemented in this patch:
>>>
>>>     /* eUSB2 HPG version 1.0.2 update */
>>>     qcom,param-override-seq =
>>>             <0x00 0x58>;
>>> ---
>>>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>>> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870aa7f7971a51d4a567 100644
>>> --- a/drivers/phy/phy-snps-eusb2.c
>>> +++ b/drivers/phy/phy-snps-eusb2.c
>>> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
>>>  	/* set default parameters */
>>>  	qcom_eusb2_default_parameters(phy);
>>>  
>>> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy")) {
>>> +		/* eUSB2 HPG version 1.0.2 update */
>>> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>>> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>>
>> Said HPG asks to clear bits [7:1] on all targets
> 
> Okay, so make this unconditional and only update those bits instead of
> writing the full register?

Yes

> 
> Keep the write at this location, or move the code somewhere else in the
> function?
Let's simply do this instead:

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 87f323e758d6..6c44d0366f34 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -392,7 +392,7 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 
        snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
                                    PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
-                                   FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
+                                   FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x0));
 
        snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
                                    PHY_CFG_PLL_INT_CNTRL_MASK


Konrad
