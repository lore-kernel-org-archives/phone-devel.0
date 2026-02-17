Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EEC303CA0
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320130; cv=none; b=sF9nas+XbW84b2lXQeyGVUcMo+XxrpTfPWDpDV3WdADbriHx3nqPSzSxMRkOSgMn6d5XDYwz/HqUfcpflgXZytDnvSuIHLdygaa/S700JCyLYQMEg8uEqnYfGbU7QK6qK5Rr2IsK8L2g/7N4LubC7mOrbrmlwr77c2vxpfau/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320130; c=relaxed/simple;
	bh=m4ggI6ejvTcz3a8YsVqjQPSeAbVZ6LlBtCqDVqfMan0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dbht/E4E0rF95YP9FeTV7dCT9f7+XU4//7zEInRbFocXFj7pmUFGciXOPDGPVnCF5NBLHk9mOzX5JYFaCpmU1/lGLBkqSj0tddAhypkhFJomoDsGoQJgdOLj4PMD2wczh5PcLd3p0fK9OVqx8OUfdc4E2HrxCEehUjLGsZ+8qKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHjWYrsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/wYx8F9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHjWYrsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/wYx8F9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GKDSVV597248
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=; b=PHjWYrsjbGeqBGmW
	4jedSJXEO0ePXFGHWbhutdImKiD2fjYgjC9gcR005ypcYR828Qz75DueP2LNeQqM
	qiDbr/Kpi6et782Ggl4fVPzocmnwzmFznawIjxtKqZAXDX1SfiyNy08/xoxQ6YWR
	0Mm9s8HxplTwvHwywqyhZBL8L1J+fOtSoDY5f1VqXtgK4K56LSabpNPe8l4V8Y1U
	gSg3Fo0QmR9lVYYH0cpiSBoHufJ93ZG6o9HtNqs3JfUYo4TugLU37s3VmnPraaal
	bIvZS+sq7vYu1Yd0BT3vcMUAvBkvuVIJSwSmJOKNv1XYPn5EnwKlT5p0fIdly340
	lM48mQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca36194b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50698374e33so38653581cf.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 01:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320127; x=1771924927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=;
        b=c/wYx8F9bKod8RRnN1RLBX/MwNXghaufQccdiGBFGJkGuZknK8kv/Bss0zKpp4th7t
         mz3dncdPLrsQRZX/7u5cX3+fjMzAxDCHxbyqqMAbDlmP/6flvfXHOqr8ALFd6hGXrWlL
         E8WtgSXQNSrwDo2CzQxnhSaU6eyWHh8CKeK+VBRkSKQomKxHd/GqhmntqUBVovrUV3wI
         qhMB+hpPTEl4IPZWT8CJ4PdqkRd3PZXUJfAdJiXkAre2IyZB/Bm47IHZLtVdqOUYYVx+
         unpsp76DDxMFzmgTf+c2H08YJc9IzlVJsYjOQNJSM6TPF6vdhqP2P5xUojvbSnP5ezZV
         0SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320127; x=1771924927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=;
        b=cBih9UXCtVYLfmrhGOI+Cx6v3iT4//ehaNPf21FieiYtY6VyE4wfRerjfGD2Bj2rUW
         dhVk+irRp+bsDJaVcwHcQy5S1qv279QwIsaTqF0cniKDc0oODdbVJrXRxQ1H9RfYUbUo
         ne+lyfdzs3lN+31eESOJAMr5+hSUziOEAKDCRpYUmaFD+HTlhkGH+09ydZ2FcMPQBd3y
         ajBuAyMFGPsUR+VakzXgDNThmwHmX2+H2SSk+iFgkAOrOw/qJ0kyYlcsq/e8Hm09XZqX
         uqNkDqMUMAT1ZsebKds2a8X418sfa/U/40Nhrw7IKnuVrKMxlVhjziQkUj8zG3b26bti
         oqZg==
X-Forwarded-Encrypted: i=1; AJvYcCWTn/Wt1GAbzDyKayFCCgejZ/b+XwvZzYxWJ+AIeLag1lHmnFyZrgaVbZQ0yTcM2m5Frx4r/r86DRii6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHeGrqxo0hc09ONwxShqM77khVs7A07DtCVrqYm9CT5K0L61aO
	CV4a4EmkvcGGXSpp8od38eHcm4DZioth54O+ujm2+TTvREyg4fQckQ2+mJ+VTEdaI9wZXRrd6eG
	vixGIL0SQghxGXcyXml02LO0pHKEx4waq3xx08JtQrwt2gR0pOScUgWK1gSDP/LKZCAfgIoRNlA
	==
X-Gm-Gg: AZuq6aLZnEXjDR8IGHzE8yfuZtnLnL1hNrgRQZdMLGSk1w8j8d9ImJTZG+3T2WLFkb5
	PGj4COCNUujArzhgk1Rm2Mdk2YmR8Oj4jRHl+y9/hjaY5B1JY4dNZJvPO3Ew84F6tFoYY/JQZx1
	Vg1dakkeYWeHl9znD19Sutz3of9fE2dCw0vPKP4W9tnLOMyTHLc7iywYn1hXA3AMAiz/gDvz33a
	ucGwyjzZ7IQmTdWsRNTiCrVUItBCVnFuMb6xBNjLtVWgFuQm4ntSwoB4Lb9k0XLI9HyGXuaSjvZ
	FcMwEHD6w8tDI5/zdGxjlZn1ivrYMCBIj+LRrb4m5y8Ou3sYf6cSyWOBiNsLh9fq7KmYzqudtNg
	Uamfd+rx3vdZvLxwC9WhLBN8ZAaUsXEdZVILqiFmlp6h3izpitIalASnRPS6eRg7dtkE55GuTZm
	u+9I0=
X-Received: by 2002:a05:622a:1182:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-506a6b40c62mr138408521cf.11.1771320127232;
        Tue, 17 Feb 2026 01:22:07 -0800 (PST)
X-Received: by 2002:a05:622a:1182:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-506a6b40c62mr138408401cf.11.1771320126776;
        Tue, 17 Feb 2026 01:22:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfd3sm2346040a12.2.2026.02.17.01.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:05 -0800 (PST)
Message-ID: <5cd6ad4e-d494-4dfb-96c8-ae6507edcb57@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:04 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-5-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfX1/awqe8U/hj1
 2PBgofzFqPO4kcIi25iIuv9xgxSiGTsQfGeB6gXyuB1Mj7eM3uBV9INXiykFvvlNp/ezTjfDEMt
 T23v5hqZPlWL1bvxB/UQllOg6fJjjvY8bo2cKNitGziarX2e9EUY3Z/TqZog4IGX6Mer3s3BTKN
 EwDVbYDIz+FzUZ6fouEi65pwPW67YZvZsvBo0oOz9JBACIcWgwEBzKrpftzv+MEJTXUeVx9Le9H
 fSYB0zHrWr8QXDoFpXma9lDDyhtnFXgrcZkPRMasQ7mR/EtEZJLQN1uMFq/+GODYn5PcM4AuBFn
 9s9RkQIflVl/ujxYK3H8tATZJSMC1H8Rx/0iBCtNYCHP3/i8ANqdeX1yyiK3Ulw45NBYvv8fx0N
 xtXZSsDpvkvX2QeLMO+AW68FDEbuTZPO/nhn0z/VqHZC4R4nCGdRNtUrhsUMSTbFQauQARy2ai6
 fdhDKNMVUO+oWbp4MGA==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69943340 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=GY9tGbHfO7DmpnXFqVcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VKTSEMhW4YwYQFHjjgMnNQF__YwgXigh
X-Proofpoint-ORIG-GUID: VKTSEMhW4YwYQFHjjgMnNQF__YwgXigh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170077

On 2/17/26 12:25 AM, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
