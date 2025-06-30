Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3810F24466E
	for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279835; cv=none; b=Qtcv++aOLlCbmpeMS1I8rlj9WiAIcSyuRZwCcwT5xAkSL4cKMvGOYKvY4bbuVDIMx0MB2PVZkaIZuZMC6iXMpGghupp0Nkac+dyMqaFSIxB6MFxE7CkFh1rebgMF6iSby6t6mOK2/BsSPmDxLghQnvRtnPT7E5sbLZqO5I3bN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279835; c=relaxed/simple;
	bh=0f52qohZfhQFKtLyzx2hd9c5RiVAiaxNXfQ12Lv3IAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYNfAfb5xrYs6KrRjy0ynvbAbO27Osa2R7aYqO9Nhd9gaGPHbR9/5Zu3/MUL4HqebIIEkmuYCSsplpC4mKzxlxA3IfB+DoHQ3HX5LfJ2ymvvEG4MXhGs0jvEyketUhEQ9phGws3WAeYeFjyp0G4hSqwkNsULKX2rL+sSO0m9Nrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myknMIRL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myknMIRL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DDrT018588
	for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chQsJ4qdSF7F+EHHfxbJYAztwZBfL+CDuaIhJc5vZW8=; b=myknMIRLEcQ7/yes
	WtpXZ3URf2iLaegN/xE0HfVhnGxNdbya1BgJlfsCC0go4GO7wst+AbE/XFK0MYvy
	GnujcTKh/iXj/vR2TCQZQDrJSPKpjeMPk0iPBJuy60D+kieAH44yQwMAWyIi4gee
	50BiWHNkNKVHv8FwXPav97Wu7H29YdQb04mA71Gm0DoOEr0rYU5d9uBs7GJjPw7c
	pPji9iyKfv97e/bLNOCeJsyrYdUjX2VL8RAiMeZVPL98Caf8RKL+g+AzFD0tn+ro
	y80qjkwwpv+276VusWCEjEyu6E3V/wgb6+Xe9ihpCw+3A1038A/HoJEdbkaKfQl3
	BTsRXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxccp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 10:37:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so35641885a.3
        for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 03:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279831; x=1751884631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chQsJ4qdSF7F+EHHfxbJYAztwZBfL+CDuaIhJc5vZW8=;
        b=XNUVCsodvpnlFdxml6fpf54MbOIWG7uDXUtrvfIfVlzFhCc/ICWH9GC1TdTqK63s9v
         ECTE3w13gYS8p+Pr2Av2yB2PVnD+mMcl+5Y44r8jikb3HpWntznHDSMcDSbip827+n3m
         GMzpf3Gtvt9PR7eEU4MQ1S59aTIwNsTXKROEVZQ43nfp0Fi5/9IaPNUkXVoZUTIBfbwF
         0UwmMoQ3BVqx0cZqTBE45D/O3VP20di5ObmOC59q6jwMA3y6PKFPG54LLceYXMttBrXo
         rMylMZsu7u0u6c045CbaTz1HSiY3J7XuXYcZIn66YMIR7yF943g1tYV/K4sA/R3kfbrF
         KErA==
X-Forwarded-Encrypted: i=1; AJvYcCWWtJqQU0es93/ZgMbA6QEYD3I57Mgxy3IIKPM4CknISlTrxcd4BXzwzmYcJenKVIYNioMq2/V/Yt54Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPo+ZZuhv8tkHo5RNt1XsyZJ487/d+x184UPnsrxCrGOyD/Jx
	H+TI2rC+Nw7C1QxA4Z2rJB3XJD0MhbFcvhLUhUgvgAHnegH5mSPuRmw6RdZqlEV2RcEbyeKjstu
	FJ38Z+OkUYsmeCIhcQ9+kQZx6OQgHPIB8iP/AAJ1ms4NaYz3L1LWPP1guJr2sRXQvxw==
X-Gm-Gg: ASbGnctPGUpU6vhixcod9xSk3o5B9ppH/YMer8xwK9Yfso9OoRDQ1un0HGmmb2PYvgZ
	l66A1ZhI6rI80+AmMxMYLT4KR78cxMMqz42ZhpUWjUDgj1/mmLnzt6OIqbhlTHh6IPhBI8O+zQ2
	CPmi9fixd6Wv72/2RLVB7e9G+ogSR48twbZF65Gr1kVF26tfGy/k5dXcjHOn/7rEzqxlXtNzRw9
	d5nup/KsiypWl73AsV2pJeQXS+FH7hxpL2eimsAcia3GcAcKF2HkKrPrJEepU+XU2BqR64O0wZ6
	lHEutBOtnoIavCEDzJLHlpVLKpznQHUSM9UvYQFkHrNKmP2Cz1grWMXHHYwk734PBTCZyU8gupw
	l9GD8Nuxp
X-Received: by 2002:a05:622a:8e0c:b0:4a8:83c:3fd0 with SMTP id d75a77b69052e-4a8083c4046mr31804941cf.8.1751279831176;
        Mon, 30 Jun 2025 03:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTE4gfc2xS7ZFMYXNiDjrAAjdrlg3gSjjHLpNFckqEJ2em8WfYVERrLqJ1eKY9ndnkmrDCw==
X-Received: by 2002:a05:622a:8e0c:b0:4a8:83c:3fd0 with SMTP id d75a77b69052e-4a8083c4046mr31804761cf.8.1751279830634;
        Mon, 30 Jun 2025 03:37:10 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ccc90sm5470940a12.56.2025.06.30.03.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:37:10 -0700 (PDT)
Message-ID: <cb863e23-79c9-444d-8511-033dd75c02e6@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:37:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add initial device tree for Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4OCBTYWx0ZWRfX/dNSjznREdq6
 g91l1QooaWaH91Zl9Pv6a8AnUfwYmn+vsr7cVmJH694cV8wq8+Anp2BvyFZFHmRnxCeZcFfkr4k
 OwDdNchXMWQY7jrR3AsI4iltePwoX9cLhTwKZd/lp2bZdJy6S1OX/VE8oKEduhzTH0hknzMWxRo
 6tuLg+rD/XQYGIDc3KIL8il37+ZSHECPCGAa+pyAgOj04Gn2O9oLGDY0gBl+m/JrCFrCOYkZ0pO
 dFX4ggLpZ21GSbARWNJcNDCpGkkE44zQMfM33/LFnrzeZH/xlGj9+BCO5OjzfN2KAXxGgxNAXZw
 TYKpj0bd7/3ibOsta5nxSHQGVUc/DweluC3+zv29cHG6NEzMhQHQ41tLMf8EWVlviWnSpgpRBBj
 L80bRILpT10ASk87tBIUbbFk+MM4/qpo59cmO3Ger7rFjoxf9UVd+xS9LEzsxap5VTNzDsz4
X-Proofpoint-GUID: DcCQhecJnZUMePqI1leMBag8WIP_0Ya3
X-Proofpoint-ORIG-GUID: DcCQhecJnZUMePqI1leMBag8WIP_0Ya3
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686268d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8
 a=ezlFQH_qwS-UVO2EMFMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=812 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300088



On 29-Jun-25 08:44, Cristian Cozzolino via B4 Relay wrote:
> Billion Capture+ is a handset using the MSM8953 SoC released in 2017
> and sold by Flipkart.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
> Changes in v4:
> - pick up tags (Rob);
> - Link to v3: https://lore.kernel.org/r/20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com
> 
> Changes in v3:
> - (patch 3/3): pick up tag (Konrad);
> - Link to v2: https://lore.kernel.org/r/20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com

Resending just to pick up tags is not necessary, maintainer scripts
take care of grabbing them

Konrad
