Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815D3CEB85
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438750; cv=none; b=SxTy8ADm17hou3bHR71wpE14DkifyDNmRO+PblOIfrUfu+D7jVRADyCxHLiUxnK3HK2x9u1sybRJCqojhMEHi8vgfUKQJlsVogwRgBjCuNPZUnXFsYjyquk+LJpXw6AAeiFhPhYv4JJaXdIuQZ9HDVc0ekVgcjkVtuUNKwYctwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438750; c=relaxed/simple;
	bh=HwbldYifOI1syh9jQF57vFS6uLXgc2AWeYBYJY+QJuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhUbx/rGevso8uRaZb+Zop5lUglMGCNDUjc3xYlgdKN/hmyVZqCWU+wOvvgUPj2JicL3WITuoa88xmVzhPgdx38FHETdLqNXCPZiUnLOUKnIEBNztXdHlWVsy6HEwgCI+F9b/p9YrQI4kMOXZB83mkP/vHCo3I/OM2aFbTKdCms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8h8iA06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrPWfT6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8h8iA06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrPWfT6q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGoN4244759
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=; b=P8h8iA06d7Emd6TZ
	jaZbGOSeTprb8l7ZI4vBahVvzjyOWeP5c+QTb3BuD2+7VDhVWLlDMlvBrBaOYUPi
	UgU/WRY/OsW8uiAZB5AnlE3rEtF4jhpoFQ6O8wo4pdhC/rhKVdS9UCg6YknxyqBc
	lwBExw4g6Jcy+pV+C7rsuZ57cYkh/YQbMdzVxXZwCkm2cUvUY4jXBfuAGl9AGaig
	kPtnZJ8E4T+62TdK5yGPiwbON0LAtuCcYKkKJWEWaWRfOLDvsnSSqL5nFOGaDopj
	5DCsJoywmHFk60K1o2hzadprWg2xJxQ+FQjSNznt5C1aPOhcv2tbLESa1WH10Rdr
	yN9vCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp0hk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:39:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2d15c360so45192841cf.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438747; x=1775043547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=;
        b=KrPWfT6qaFVBKUfAWxutkzbEYdllU8U+rquAJXazgXjj0bzfAprTd21q3QuJfipi/f
         N780OZ2GRWAB7vGOx9WkDv61kS7V58XFLJ5dsI9vxRor701gU2tx3aielJYtrDaWvUge
         6bBPFNG8KAMAFOhC41YK/YfbKyUR+NAowE/Jm0+pnpA1M7UZ8c3WPW4sMeIbtwA04gaG
         lSsbCXkPtMfbw+ROIrhc/n6CVSxYimib/Al1hDr+qmzfI0Aa89/7LPd/pxHIYPIR+cou
         Ofwl3Accu8GGgku9cmGQmXpvZfCLafT7vYSW/RwlFyqLu8DsVn7t6vWgM3Lr+EKKuhqZ
         xfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438747; x=1775043547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=;
        b=DZMdgfEhZYNMHlVSVVlu6dlGmyIGyz8qQvlOynGAbK5h/KBIjB+aGD1+0nEmujtg5Y
         249oZMbYDX3AsdXL+lrbTztRuzfxe1TO5fxNW5B+FXUn2yWkI1I8SD/qLNshl7ShVM04
         HsIO5TWp1D6tK+xKMTAPpofOUpRRmdQC3OrM6mhaaAVCW/rMyFHEY3XbBd/rAJiRGlii
         FZzyteQH2xbYwczIFScpxRfJjzIBI5ANCc85BmwZiEO2VZpMN7EJOnraGXEQ0q6Mb/qJ
         /1rITYwsJnzwqNv66GhQoWsKVDQV++dBZ61i9tOBPeWFw7qUtCReos79AciKfvLYa6dU
         7awQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGx2Rh0S2c6TCpzQTQgzJ88clwBRqlR/ZdhQthe9vs0da73Qe41ypJTGpPDeH32ROXH7A0HCcKu9G+Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHTFC/HNasVA5CaOseMrtrBY+pCHjR8rVVY0Yqpdx1C/6ph9y
	szUxWdP1aHCab5Gw5eTvrgnrkEb6DofXL/MkUObWXhVysiGj9SxwxuM+Pl4p4CWZWBY+w+t055/
	kcuFh/hkDw9N+DSJTHV4ZWS/saPmq8O8dBCHe4R5ROITjbaL6jrt5ZTbkxTkjKAfu9g==
X-Gm-Gg: ATEYQzz5aUsVVHq9HIu1CuBRAMJVz53tWz/rM35jwUqAY7rv1GUqLq7iF5751030tml
	mMKwgrCZlaSrNRBGlAQmbURYWlTW3Av/BVRyX43ggoSEnquog0BZ563mwTkrWSDoAQ/cbOH6T0q
	RE/iaPLxKa7S8wXk+EAgMy4skMRCLBQTLahEeX0k7ScOLmWqy8Pem7DYc4T09Qwdv77Qf06a+Vs
	1DXEWrM422PgX5hNMO3w4bCKYc6gJWFlya329A4zAL7paHyZ1hmKWH42J87HstaoVZtjF492zJR
	eN63bEuY8ebtCMI+aTe1pU00xAFKwf2uI1JPEimaSqTNUIJ5tiQev2iv12ccNim5uGkd3G94kUe
	EH2NmoPR/zYaGLkx1GJ+NtfcSm06Ldxme52ug2ajvbfFHcZ92MyNXKPddry4fsmo4DI3USBXzo2
	TbjqA=
X-Received: by 2002:a05:622a:4086:b0:509:39b1:d4be with SMTP id d75a77b69052e-50b80e802e3mr33657651cf.5.1774438746757;
        Wed, 25 Mar 2026 04:39:06 -0700 (PDT)
X-Received: by 2002:a05:622a:4086:b0:509:39b1:d4be with SMTP id d75a77b69052e-50b80e802e3mr33657271cf.5.1774438746210;
        Wed, 25 Mar 2026 04:39:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387103asm779356066b.57.2026.03.25.04.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:39:05 -0700 (PDT)
Message-ID: <39da1661-bad5-47a0-b50a-52678e1766f9@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:39:02 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        oe-linux-nfc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
 <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
 <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
 <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
 <c607e5e9-2e2c-450d-9ca2-5727ba99578c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c607e5e9-2e2c-450d-9ca2-5727ba99578c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d9ge-kLxRqbDApP8-FETfmG7dzRBQvJV
X-Proofpoint-GUID: d9ge-kLxRqbDApP8-FETfmG7dzRBQvJV
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c3c95b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=nP0QM_pW1fVPP_CoLIUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX5xqjbvA9KfUy
 nViYe9LoL7DIX/irGHw3z39Sehui3NxP6jYFcXOICgK7kKe/ycDXmq16yggNsSGvKMflouElqtz
 EZ/wxJMmqamb7RU1jR2WnThjBm+Ud1Jk2W7LrcFQJZ7qfHbZYlQN2VupAxrJOPMjIL1qm0WuSLB
 OoP10qi2jhawARnBwkanqXYL3/O7XjfC2K3hDK8xOJKK94yrlUCQXBCaHknoIeQrxM8f973xI2N
 DJcgF0YIgu77q5UpOD6q9kp15Z+o5FZTUWRmcryVkecMRDl9kCXphvgJlMdvaoNXxIlCBkjLMsU
 XXkJSjc0JimVMHrVp8uER+RP8UM/9tTxmZqUn4KDntIj2xTpwZbmu0vNuJSY9ZKE5FHpAyDXtVA
 Zr1nMkp+/lYbKB33dwlS8S/xBz7ZKq4JqYTCJEZ6VHx57ImIYOSVrzZHIXomMFIKn4HG7mlW78T
 H49I/sSmKXBi0ENIO5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082

On 3/25/26 12:31 PM, Krzysztof Kozlowski wrote:
> On 25/03/2026 12:20, Konrad Dybcio wrote:
>>>
>>>>
>>>> FWIW TLMM subnodes are best sorted by pin index (although the file
>>>> currently doesn't really do that) as per dts coding style
>>>
>>> I assume when I group the -pins into -state it doesn't apply anymore? As I don't feel having pins relevant to one device / subsystem all over the place is extra clean.
>>
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio12", "gpio62";
> 	};
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> Let's imagine future possible implementation of DTS coding style
> linter/checkpatch. How it would sort the nodes? Either by node name or
> the first value in "pins", this this would be:
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio12", "gpio62";
> 	};
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> So that's how you code. Less work for future linter/checkpatch.
> 
> The trouble is that "pins" property sorting can result in nodes being
> spread all over, imagine:
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio5", "gpio62";
> 			// ^^^^^ DIFFERENCE!
> 	};
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> That's why I would propose to keep everything sorted by node name, but I
> am fine with both choices. Qualcomm maintainers decide about such
> detailed style they want to impose.

At LPC we agreed that the last sentence should not be the case ;)

I think I'm fine with "children by name" then..

Konrad
