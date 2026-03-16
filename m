Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E87F382362
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654958; cv=none; b=uhKLC6ICRqrGmD8cAM66cC2jfVELzy6GwnQCwTbtQJE+4hQwblC85c84tpGibavtiXfOaRQqxG/+gVkEfspmmqnblyLQxhZ9ktRAB4meCjRgnX/vpNdYoMmvw+njP0Go0nDX5Ge3OadeQmm7+T31rviAaTqW9HxKMES17KOonFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654958; c=relaxed/simple;
	bh=Gf8cTz/JaSBae0mytl09kCX1yq9bDbUU0n66a8dk+MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaOpjrT6MOdU7hzIQQ4cUfzCLRUVbkQU/BcXcozP7yCvJpsXjWEOAk1NAQrQ2ie2e4FuNHO8jVr1djn0ZL0BgoZxuzqQc37D1Sy4cvLhvos0rBjREFmVVt3xVsS55nz2BDmgQusLGxMJ75F0bz6FzeJS1csah88PL5wbNmvDZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX89veG9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JiLouKrp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX89veG9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JiLouKrp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64iWR2128576
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55cg4HDCtSRLfOxRpTKvmxGEe7yis8rCbIe2Y5bMwZc=; b=jX89veG9z80FCiUC
	i4oy50jbhRe3HrLWzUAtcbjUw31oUPdD4IBQRtcDMKzGAVwiujVJ43lAcLm/D6Ur
	ZwjLivfMUcqFGaSY4eoXTUHnVVv1AU2ATDGGwrHvD7hdyGNOLioCFcDP+U3pRCa4
	9Yd/pOo+IXnC4oukOBr7Tnx0vpX1/JwXOcYiwCDMdgGga9QoxDUQFD52Ds64VoqA
	wfF3i68RaXhNp3ubyPAGhRMsZ1RMfavi88TjNcY3teL48d3AJMnQiDvQZVWqDx+l
	Kv38HKLQ9uzK/qJrc+WoTIFyeNI+JS52XIi1vT/GrfWqcj3E+Sl1dzHxntxAfMcO
	YESfmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00an6m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:55:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8dc8b434so362603685a.3
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654956; x=1774259756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55cg4HDCtSRLfOxRpTKvmxGEe7yis8rCbIe2Y5bMwZc=;
        b=JiLouKrpZ2FDh9ce/VTz/yuLW4qHc2oULekp07Ni7iKsmWZOPI+v+sxyQ+uYHLae1M
         3JXGp9X7do5Y9GBI88t00bOb84uq294c/BCtlJG/eXe/6rzakR7KO8IN4LwZlIufS89D
         4b5psKGNGd4o6zdStw89IrU140UmWzfQaXpl6cdHPaQdy09uXsxlGkeBt9KGlxTAsO3Z
         /04cqOHIWWZJhsQ3cWb7XU+GYe5qxTfr1LuH+IxYnNZ2Ao9tKxVXd3jAKo+dLm8jfEMA
         OryfhbvK2WRliK9n7dEHahprlHEDhlgXJdRyzDRcBEpyCiLKqhekw3xDNVaoXztIyX6r
         lu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654956; x=1774259756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55cg4HDCtSRLfOxRpTKvmxGEe7yis8rCbIe2Y5bMwZc=;
        b=ZWQyELlBn/j7FDOs3BdT6M2dKDVBjWm3JxtTPik3WKWKSvSsNsZZ44DAzY+3gwsaJ5
         fKrIPusJN7PUKhkwwxLKBHM21arhwwz52nfTSRs6aEI1Gr80IbJIjW0N7ZNtauKB5xEY
         U0bB4hjN6N0hjNDRgBVKUGWyKc8YdS04+eiWGowt0rQrYQinU95TNpaZTW4zUJwyHC4v
         rVce5VNrBhnpe2+fw9qslpA5bFqJy1bV3a6mUeNABdnDfk03lBYTU+X/mSvO5BGW19fW
         eFAjvb8asOla75giJFQ8js+Nz5MjpJ4dQG3GWoKQbPwwsvvOAHMT2LqwD5VCbE8dCpsv
         zXmA==
X-Forwarded-Encrypted: i=1; AJvYcCUASzvfHWItRvyZy3BerkDWIOtym3Q1QuMHyD2S77V3KMWYfvzb4sGraF+p2uWp7+wRVemKdvlJvd64ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU/yGSxvX91QTHm6Hhvq80rW8FadedvL//CihwGnUeRDwF52Do
	zgilB8Utg+7CaLPP8TGiWCBd/yty59J8T0r2CSOg7uM8IJzDIvvewNdWmte+pOESGusNfTr7I7I
	44qf1Xgf7q6q00xD2wC8NBF9n467DxH6rjcZbXA6OZ8P8HoLtzzCb1LsNeqbx1JdWhQ==
X-Gm-Gg: ATEYQzwq+cbXYnfwxPfwH94kE1D5bNKX6YXMyI6azoO0s77rwFkjlowJKgonNCOWkZ1
	3CycVyaxs3XHYShko5WM7hcQRSd1crsY26HshbqwQKubhBT8xRi1Ly9WlhStyJd8df2CBrIuNUo
	04IuIZfbi2wfd6Kvk57tiecPYVMF0OIOGVRMLSjTo1OA5Ozq+N9JjgA7iNnc9yTif+Y7/X939bC
	04YuuXsOBSLmRJ36vRy44fywojNpabrwwXUBpue+gXL+vC0XP2ZDLEkXW/VxhFBogRXIXG6mhf2
	3y9xpj0OooPKZ9VxTRFuqdfNsBZyFcbPDxlaK1TsveDM70NX3aoadsjyLzxGkofg5cINpOIsIWg
	JfSByXZ+vDH22N8zllxCZEX5I0DEa1wfuql/UX1dzD96AqmEVFc7v6Z3zhGbRNl3VxibCzWVubh
	bCyxQ=
X-Received: by 2002:a05:620a:4625:b0:8cd:949e:5e3e with SMTP id af79cd13be357-8cdb5a55522mr1213083585a.1.1773654956131;
        Mon, 16 Mar 2026 02:55:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:8cd:949e:5e3e with SMTP id af79cd13be357-8cdb5a55522mr1213081185a.1.1773654955678;
        Mon, 16 Mar 2026 02:55:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-665180ddaeasm1706505a12.19.2026.03.16.02.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:55:54 -0700 (PDT)
Message-ID: <0fa30adf-c168-4444-8f74-681b46ef7229@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:55:52 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: Add Redmi Go
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-6-897f130786ed@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-riva-common-v3-6-897f130786ed@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2WNO09XOmwXFAnwaZoTRBQhK_it5bMVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NiBTYWx0ZWRfX6tRoZZq5INuf
 MCe5P92VzcYXJG8gtAIuTMjho/V2Qsimm+UEJRIqPm1l4Gq9Au6aTJwZOp0aveySRN/e+pEQpvK
 YOeYRdivsJzjEuqhC+Rt2CvXr2cupvDiSPLsBLVlj3EFYT4tADOLc1WI6mpgG9cLDZheQvl0qiO
 NxkhTDd6xfQDIZbqx6e+79ChFPGIlS9GBwj1Z0RJU2w3V7rTxxjFZeMj2VQ9Eeo6Y8xD5sSt0YS
 18OPYMaAO3Qiap9OA1XtT6hUfqI5tUvkz+Z3+2i4Q5Zi2mH6xQbSJqZg8INLXpazUBAnkjAftSy
 VOwJfvYx1RDi5vcQSnVILIrvmvic7L6kcvRvQomrtw72MKbavFyjOvq67hbVNXQMJmTGQC8HihN
 C008b33mi/vOUQZTRnMei3nMllcWI0U8FCYnU2MBnWvZ2/F+N7B9V7F6Dyso85H9ktB9I0tTpxX
 6fTbReP8NqrwV+/eh1A==
X-Proofpoint-ORIG-GUID: 2WNO09XOmwXFAnwaZoTRBQhK_it5bMVr
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7d3ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=HB7t7QzaEc8PXXkhbgAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YF3nxe-81eYA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160076

On 3/15/26 5:26 PM, Barnabás Czémán wrote:
> Redmi Go (tiare) is like Redmi 5A with small differences like charging,
> fuel gauge and different speaker codec.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
