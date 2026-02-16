Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74430596D
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242770; cv=none; b=Mlc/xG1TA2biFUIa/H4LR/Ngg3py6sfDXhdqOZBqVvClkTXt4coH98k1mQEtrLgTdxLcKvFsZyuI2fVqwkvA44ecaXF/0ED5YxBviZXXnv54UgEaTBQM0RGTZ9HmEIYPhtYw5aGhoTYXY3kCUmaV32pj7PmqA4FnGlhASaIoM78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242770; c=relaxed/simple;
	bh=ykMl0sciRzqz/Jhb9q1WlnzOX/TpjzDXC9IGiRz8K0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsMWvaz7vAKvP13u8l4TefstAAYx+R2/M0U63rfj04KVe2JQFUJ1+QUwlVUMdXb502hjWPYZN8AwhWsOIVS36PMbblNkWMPVKHiyB7SkLSt5hRjw8xXmbgQPrIqS26W5wqtM+R2NHb8KA3DV2dWq+zXzWYa7sG+1euxGVQs9000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0UEOMl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L28QY/9g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0UEOMl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L28QY/9g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8uB7P2536432
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKkzol3RpQUR/FhREM6X+TLy3Vg3dKc0rriSyD8MFAY=; b=X0UEOMl+d9plVB5z
	/CJ+Lskug9cEPG4xl0P+Q5Ze4HSHF7wwpyOTdVPCZaGDGJb5lh+RgMk/P1ZEjWeW
	IoxyGubCDunoaX0F+SgYJRVf+KLCLR7yNHMKDzFsguouTuaGV86p1bA8leo3Nj4R
	0d3MkRqsuCSWeyb6lDVBXhUqDWLSBTzJjIzZWF0+0ykyzF6cVPtGtQgT84d4Zfho
	44dYxbcrVZkeWg39J6RXkG/uYsQQYLne0CZum+vB4Jim7wD308O+BZ/aMH/foMvU
	7qPJ3UayUQQ38auqwFkidz5NPPJ3TfuwhQD9ODVe7xGwjtrKLo0w5Dpn6phMQkKX
	1eGxjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24cfmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:52:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso214944885a.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771242766; x=1771847566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKkzol3RpQUR/FhREM6X+TLy3Vg3dKc0rriSyD8MFAY=;
        b=L28QY/9g4m5x8Qq00p10NbiorNZUWQQVqX66wuBZ/7usn31XLNDAYlTuNu/x+/wMgB
         BKnejgDMCftd58RPZz6fYTYPk0+ThlSALOfrG7qR4DCf0+SX1vy4jZEx8bT3jtNrPI6B
         EddmCbpb4dwK9UVDOEq2T1FXIKhSgOmQqF/lntIHRuNsZMI/sCJo7tAO8iKc6yLQCnVS
         gm4QsBwM5buFNsARsFTa1w5HxGkoAbMxeq44OzuhWoKLMEsMoJaPuisk6NlhgDb700rU
         0bts2mYmuscYe4UNyncKABBpIRazy9A35BUe5sOKILA515QfOBDc1TH0AyT0W/lJb4ei
         zn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771242766; x=1771847566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKkzol3RpQUR/FhREM6X+TLy3Vg3dKc0rriSyD8MFAY=;
        b=NLM10qNcy3wui4NKsMC4hb8SbqfPS4zLdgszlh4HoOze2Fx9hoAFmLLLAOYXtPA/JZ
         arFjVpC+PrpDkZ/XQcn3ewl/KrKOLCxPldkRuyNAOsSyYj195wcx6JGPfCcX6gOqJO22
         h5/cW1HxzJyK4QSYb/LiBrAlICOwWK0/UX1NrpSx9NvYOer2mJ9Wg6DP/D0d1ANi40gg
         +Vh54tzL9VraR23RQfswpgcv91qg4a9J1gMa35uldbk4LrvJlRw0VB76Ax+glI2A7/jT
         Wtj6ouD3eTB8mQ8ou6fyOUWo/psH3+cayOQSjkEv03bbUYhS98DVYkfLvFMfN8ELnXMe
         3z0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx2NzsLBjfPVhSMHj/fS//++Z3QX8u/wWAvqOai++NKz8BhxIwpSFFHX+x2Aj7Q55BQEXlk6zr1UCyZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXTRq9FPEFVsoAehSjf+NXl3fJ2aks+pwzpQufDs6KZTRT968+
	klSzlMlP6tP/+Z3XXY+3jPDmc7L+NWMLjDrYWVnLJ26fQR6KiTn/7Az6PArMkMU3WqjlbnHZ5aw
	4pmb38wMXXAwVABPJ+YgeyaJNaMMtB80JZPNTEmZAxuHSwcThNc+HpG5cJwe/uFHcDg==
X-Gm-Gg: AZuq6aKKGHd8+NSxu98gtdJtkjUiISUfnw8q7hJrFR3kY0Jm08rvrVG3G846DgIGzi6
	kLleGLa68rLXR5jVbI1t9LyeB0FX83vpveOe0hKPcXcJeOjcqGB241goN6zOeth1Kd7nHQIXv+i
	7jeTfHtosJPFFkjK7HDrTR7idGxi9U7nrbYxsVnwhnNApYod8fah81lRjA2+zB5XKseCahkrsFt
	xeqfuZCTLZtfEQ/VUm5Nq0HeMgCllbsxW7on4Yzmfcl1QAd2JPDMXeTwkEgJwk0kSD/ljjcSAEW
	HrcPE0iiKqc1JZEa2JasS9Mh7tLjh2Izkw3v+VutOswuc7g4Vn6izKIkfhtAinkXWj2oi/0REtY
	w7JCt+MzXpEcNVpuGnYL0zK+H4zcOVTvP/54OqxgXT2X7XYkLqQm0QmPy5lDuKP3G2s5Vdv229D
	2rYSY=
X-Received: by 2002:a05:620a:1a22:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb40849cddmr1006112985a.3.1771242766067;
        Mon, 16 Feb 2026 03:52:46 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb40849cddmr1006110885a.3.1771242765568;
        Mon, 16 Feb 2026 03:52:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385f5dsm253333366b.20.2026.02.16.03.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:52:45 -0800 (PST)
Message-ID: <56158038-2ab2-4243-8ef7-b5d54014e4ff@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:52:43 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KRn2QYMzcF-zDLCc28EYzthY791VAk_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwMCBTYWx0ZWRfX6pMn3h5YldW1
 n+ePAODJJ9Z4RuztXOjQu3E8G3FLNKOL/dmjOn6ynmB1hfN1Ck6XKkFUzo+Ylec4B375eH8iUyt
 ZpaZZ/kyTfLMeAxA7co5Fp3TTsmhhwlBahEOWIwPxgSkPm632FApuWIm5Z9r7RxJJ4YNsLwPAeE
 fFiUmON4rvcWeFg3Qm7Fzevr6q/6qOPrH1AYfQ1ItKdzhb0tWzQ6wXoU8pZlyy6vMDG51OQIyJr
 Axssqw+CA3e3OOoAyT+PHwQnKGgjYBZwcLojosKQtyXJH6Uwsc7m/oN/Yq3YQHcYP1sA4NqJ8Nd
 ytxOA6U1iCwAczs7E2NvrJuyCAg/4EUI2kHcmxUTy0Pono2/S6yI1w9RWrRh5bEJg3DJpoeugQU
 RnRxaI0XPdUwIj8Mr2ieFU9DXV81A+5PE9TgAE4yWB5jolqINK5u/+10vWdlLZpQGA5nuA8Gwtd
 su0+Jvo/xNoRZua3Y4Q==
X-Proofpoint-ORIG-GUID: KRn2QYMzcF-zDLCc28EYzthY791VAk_W
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=6993050e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=IT9ScGb9VJkqv4s7YT8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160100

On 2/13/26 3:03 PM, Luca Weiss wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> milos.dtsi so that future additions can be added at the right places.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
