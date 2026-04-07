Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6FF3A9601
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558304; cv=none; b=FC2CcfGXatd/9C8tUnwKvV7H+LnPlKzPjegctc1stbIZcoYHoXtEh4iaHKqm4ZRdRPsXkSqjKsT5iVbCIcABkrpRceeMCf8aObBqnkb/LPdJPoyjsYUA2M2JT5Get6/WoB2MKHncG/NCWTRaiMcfdwEBcGNB++Z2R8+5tZaFDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558304; c=relaxed/simple;
	bh=pG/8VuhPAHUopEyOrDM0yRnbbv6CUyYjLv9n4BTdsLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8xlhWb+DwGMDHX2RoL72st10RjMq93HyH/B+dYHzqeIrcp9nqjyBGqKjZ3fR8MsgBgc9PuhQUPowxqMS2tvvnMVP2dRVg56oNsrPetVUKixiMU0RAj1LDYdyrIU3oEpoA7rhHdIdaxe+KEEY3XPsHPcpbJFErYCu/xAt68BVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMy5Iguu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8CzWIxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMy5Iguu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8CzWIxL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376HLl11407039
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=; b=RMy5IguugJnpzQcg
	6o4jFwvz/jof/LMb+A55OA39sxPk5pXFxj9Fh5Qmo7aLp6Nsa26/8gYDmhnskaji
	6YLsdjnWowtMYHv11fASCJYU0C6tgbpnHM6qAK3W971O7700m6QqLOh0TiBt1Vau
	zO/jCxtoF+8cNJQXLjEtLPqmF6+S/xFA7dAR/gE2X5wEeCy3o8C1MLsV8kIZENWX
	I6yApgT/jmP7ZVJ6KGMSRR2yEPkFWq+tBOR/Oe5RpW3CtzGBGNod4BI3t2ZbymFi
	zNwdsxqwzZ+skdNosmSVewIE5MCf8iNNPK5PT+hYEZAL3mekPuTplXkMAsz/uVhS
	ucLxRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrataaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:38:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd541c0edso27485596d6.1
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558300; x=1776163100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=;
        b=J8CzWIxLDuu02BO+ivJlbnjDFCqSVyx/e6altj7vDtl7lMEjEa3o/+rYFYhWEKRuwo
         oXpzpwfNmgz3NAmWQ8Im5VeMaEo1z+Ujur6/Kkn5gWjaVYdRZE2ZzULdqRj5o2keffsC
         fIxEs7guE/WC8Pn4tXNAhX4VQsDhqR8x1AG27PAFbE+UXw8zYVtA4b4bEU8QSOJDaTaH
         iKb9psXzo/CNyTe/MLC9IyAXmmwaWw+Z97QtiQmQeCe17JG4uat9J+EI2VNFQ/VlK7mu
         eQ/oLJfcroO/IsnD4aDLViwf/P7fsO4M3WEe5lUpF+x+Sb/t2vcDoDuEtB3hN1xsvrJW
         PIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558300; x=1776163100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=;
        b=Nl+n/RS4nCMOmLkJKQWlgI7TCbODpdk9utGiKI90JfcnjUWfXL82V2FObMhIQLI2Xx
         E0AoxC4Xc0pOS1U0YMizOkjin2OxqjllgrMtJ61xlwHaGut30Q+nCz1Zs2IMLggrsiFx
         7EFeYBm+DaIiZatQwo5LNJPXCHt7hVCg4nI7QK6UZpIcZHrBzYIj/ky1ptCmmN4t6GPU
         wf3+ATrXSvdzuyhH6RrteYcFNA/wlltdsIof1ws+2GMJo5uyoxLtZ+1rVbS+ik+IAJGM
         0Ymrp5iNx7aDrXatSrJSyTJff54AAaOFyogYEx2pvLBhPWiseB5wM7GWcxnZi47nmOu5
         K7NA==
X-Forwarded-Encrypted: i=1; AJvYcCUViTibDQUvB3X93v862BKpF4bi5X0x+LVqZmQTlBCxg2Ga+9DuKggh1vAvBgw+zFe7rnez5vdQUcXRJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8LedR83Y3edp50JIbeWijVyPs4lO/O3sVUc+nbOJlWyJI0Mx
	WhEyxokfEj9pa3bX5RbAq0/9jVjF+jKUTOfbsGtirT3lx2hgn2nFly3BhzfoarimCJDeol/MRPu
	wvleUm3KNBDPA9Mfk6mdyuj/zAL/DNFulQn5SbyO//j1+KRmYu8DzW5FZozZAgzhjV3XUdPk4ZQ
	==
X-Gm-Gg: AeBDieu46qvGqFywxor4F5JHqZSOTjcKc9f/XjHxwrvhrx/3D2gYArZrSlmlAZKIoK1
	2zhUT465eAlGdFwDzsInuu6nBTb5MtSciJDYQycUgHwsRSa6ffDEQVq5Siib/qkNV359i85vzbH
	pgDruJ+jnJdIl58+qmZM+QdmMfs2M+Q9IpEeWb19blohC3kE1VmTJQiS/qdMlGrtPt/fTcNBZsS
	6L8t1iBMLLidTgkMt8KNgPlR3xO80EmlqTLLN88l94AKo+FTXujItxuJpJ0MsHymZH0x/K/kNnW
	0b4OYx61lP9W5gmiwk0jGMDUoDmyvXmTVjJBWgVE7LI247HvoaXk1pFMFUaIfJcO9obuJQrApsV
	Z2TIcFR6Oaaa53M/sAvlHlj2gQvR5p/kQo8m3RiKcQYOx65Ms/+bLt+ConL1KoKUfO5CnwmwSV7
	383LE=
X-Received: by 2002:a05:6214:c8b:b0:89e:9fd6:f78 with SMTP id 6a1803df08f44-8a704ea5d59mr210870296d6.6.1775558300355;
        Tue, 07 Apr 2026 03:38:20 -0700 (PDT)
X-Received: by 2002:a05:6214:c8b:b0:89e:9fd6:f78 with SMTP id 6a1803df08f44-8a704ea5d59mr210869966d6.6.1775558299965;
        Tue, 07 Apr 2026 03:38:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm539698866b.48.2026.04.07.03.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:38:18 -0700 (PDT)
Message-ID: <588004fe-6ede-4065-afbf-eed620caf380@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:38:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403054417.167917-1-val@packett.cool>
 <20260403054417.167917-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403054417.167917-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lJQsiM_shZy6-LyE668-WSZKS62c6XGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OCBTYWx0ZWRfXxkufixOeRbeJ
 pC7cGMizax2S6X0mML4lD5hH7/vU39Ocmkvg5puldMEuzSf1b4YTcIeSdu5fDSvXn/mQLQ9eCf9
 kXY+7AidfYFzzIR+ewD9EhSNSHGt32UeR+QEF7ANTyN8O9N/h1Cg3XceIiaNnkL70z3abUx1PHS
 xLSt1C1mDQ+OCsjODeNfNZEqR7YgPv2YcdlR+rjyyfSjz7VP+Me/MpN/95qWKh1awTlIsLdRylF
 n81hf4tIVm/0n82iyaE8ImX2Kl7tqX9XOACcaVNGdvvUeATSIE90CteFOiaz09xVwx0raTJJNnm
 W7zAvymYxFdWaf86LBQXbC0wkITBpFVnh/cRN7OmMTms8CR3kO/Hdm1zCWEDgeRlXR6IDdfihxX
 8yGqlXwvZerdMuzDrU6fwidXlFmB1/rmtDr7h10CEFTm83YsnJtm1VDRSLgE+gcZwDV8PrGlxfb
 xC2yIzjWRkcZXcujrrA==
X-Proofpoint-GUID: lJQsiM_shZy6-LyE668-WSZKS62c6XGW
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4de9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ePosGYAZjQQ63RukehsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070098

On 4/3/26 7:33 AM, Val Packett wrote:
> The Motorola Edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: Apply suggestions from Konrad

"fix bug" :P

> v1: https://lore.kernel.org/all/20260329103055.96649-2-val@packett.cool/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
