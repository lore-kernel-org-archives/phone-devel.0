Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4BC3054DB
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763158150; cv=none; b=LTgyLdEMY5BQUp2fL+BUDjKctHfbJPpIF+NzpE9eDwAwjp7Gjnb+lwtBPIt7JsdapMb/guoOj1iKRl/kzs0HZZhvgZEbl/Z03YTd4+wic2ZSFQ+a8vAT51rLKU07uLflOwpwxfpDY8QNj70Bg44X99qHEJgPPG5bKfjjk25SxTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763158150; c=relaxed/simple;
	bh=iPSh74YU5xiboqFUfUJ0apAdLhJxZLeLZX1ZnN1flkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jga+iCqBICqqN9UcopB5xP6iIID5WYFp0pdtZfkRqOddSNyo5ZgL/sP2W91dJ0BN3HzPJiZgAyCt8uKY0XS0MwcINb+GDigm/naix7FrAAn+PUS4/K5smXz9SKZug2zjX/9M+4d7JTDFnqO/8YeVPDlUZQDV5+NPe2X8LC7ovlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GU4vT8DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYqCZNcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GU4vT8DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYqCZNcG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEKrlYP295691
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 22:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=; b=GU4vT8DHyVKRpqp4
	QjZvVFP4a4/k6E0xA/+fKIvziTwyVf/gGIwfLbGUvAIERvWvjKUXqYGEayA2//TN
	M4uVvYEyEUPJUweSBnmy56B7Vd8E5dYWETlhJhEfMX319eLG0rhK7KP3mhBPGfzZ
	l1WVLSXxhJLd14bqGHTX5yEs3CFTsndfMUz8pqwXtSW1+OOMqDudLyqSKx4GejXH
	h268tXjRT/3Dfi7TZRE5SV56KGMnBiRn58kq1BFqwfhw6ghGLGuwdiovbXtXg7Ct
	e5HZNF9N3LRilWhCG8N16cQkAbCfAmEHzZzWcZbLoR/3ctk0dvSqfqjGm/5LyDfM
	iw/u9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aebuyr7mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 22:09:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so7949781cf.2
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 14:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158147; x=1763762947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=;
        b=OYqCZNcGw2hKGTkndYW93G+EkrFsc/tJazBtDW903brWn2L37vbSa+ErdtAemYXHNG
         kgeLKVAcak2XKT8Rp7gr8lBLSLUDJNiLiQGDoD7zhzyzz0IivPKJ15Fb1w3nwv1ioWHT
         sKlz9yzInf+Nb3n3rzdNs/4Qut254rsVvf+5pPHNOFVjou2vx9BvDXGXBNTMGVT6pPrj
         ZgoV/osNVC3lmxcIRw5+ZfxKHKPKdVHzUU6SB4O9i+ALB4jf+l4xhICFAnOfuCYvzXTA
         usQ3wq4ia2OzHCaAzUWFFtdxY1QKdZDyz8YENTxnFYwHyyncACSKthtgN0DWLIWtKKIA
         QMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158147; x=1763762947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=;
        b=M8IpytPpFug4f96Rk+w/pmmIuP0ycqMp6PQ/hDN7zBpfaLM+8FB8KutHAcxDjNSYUO
         +3DwbSYLePWcaPjKU63RWdQimTocpOGR+OzPPUuSt3RrHxW9XTnRN/vHo8OVlpfhqPC5
         y5VI9M+Im2S6X4mnVhQVaXs+yvxFjXm8ij82v5Zdl0LWQ3VIXN+5/tHmc4agvZz6qI/o
         /xtCgeI6iBPJjBk932VCcRCTfXhg7OianI/cjMX5CsGc3dTmFXgICUNy2tsAFxgpgVlJ
         XrrnCR4XgWBfMIkwWkFYebwixOfM0XrcFHXUWDC1DUY6B1WGDmvAi5ov2t5dtTKzd/rI
         qx+g==
X-Forwarded-Encrypted: i=1; AJvYcCUjPRbe4rcQqe5llKmHyXKjWM0nCuqRVD5Rb6fTYMXORny4Qi9TCHqJghs6z0ODwMvoJfwGqTNxkDCY2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0dcMgSrLUg4UekctoDqBDm/sHLz1WUOaXtmWB5SvI4UstYmBV
	tJEdvd9P2LW3jfiZtWjvIL46jp13731WSuMcDhHV7OsEu0hW1Wj9R4ZoDlCMgjWRVo1CgxM4AeR
	KP8O7nO1FfgdqgGHzMUO0bJUuR92ixwKnY4dD29udKb4FoP/BCtO40uAj+kfIDqTpgQ==
X-Gm-Gg: ASbGncsnQYes7wcXJ/I9KmPDRUcH26Y+DtJ/20WZjidpsOrBVeSh5tKf/NlrMzxuswr
	COBu6ohrcJujbDAo7g6EbCg35qc4p/pNTz9i6+SbVkI91AiCSErW6jSxxr0aXiO7YwOIxEaqez7
	B8QeleJdwv02LjCge2E05AAltCYsE43fZ6GLSMHiGBAZ+Fw7rWdJy7f0cTeXL0eIJ0+6wbeVz2f
	xnf7xh2iGNiDnxyLddcmGQv4f+KH8mF/oynSlic+FwbB0a7JkmNRkN5zleDRS+RMmWkqShRQm+w
	oUPJxdicRiO4Co+O/yivA8s8AnKbTyIoocs9TQJivvpIEbSXZoLvNWE2N/SGVS341wfHmS6/THA
	XQvshd/Hnzl7I1LUIo2qCG3UszRzcgK0s5Bee/pYC07NSKvgNAb2LbxGM
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr43928311cf.8.1763158147115;
        Fri, 14 Nov 2025 14:09:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3lhrzuy4JyzwvIwqTZ6/6GXL03D2BYdDOgndLmL+2Dwt9jORtRlqVlvPuSyThbnEBKHiqA==
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr43927941cf.8.1763158146676;
        Fri, 14 Nov 2025 14:09:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa811e2sm475740066b.5.2025.11.14.14.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:09:06 -0800 (PST)
Message-ID: <bb5ea31e-8748-46a5-8072-8f0484e72536@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:09:02 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-2-d1ff67da33b6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-sm6350-camss-v2-2-d1ff67da33b6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MKltWcZl c=1 sm=1 tr=0 ts=6917a884 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=Cvb5ON7qhB3BCWpPquEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MCBTYWx0ZWRfX52r0hEP2f27b
 kekdLQ38/NO+RCQX4lx83sP1FSTGeHl0hl/4Z5LP8H0oMSOo23xmwIvqaZSImm5hVM12ud/0cy2
 VBBAy0fZXB//YpEZyhB45p42QDur0Qfz6MMEsqTMToS8KXSoo/wsXFP+AMyMIVlSdupktw7Smoq
 4LWEC8/C92dnHLEX9vrbjysYzJzEDoJX90bMtDmNSrSRiK5tOtOkRNdaGXiYvFOI7kEdhtrms7S
 qZFmSbAc2ghwZNTQgLwhclJxDy6gyh+J4Pm3GLrFHs1WyGSuOxn3R+zx/Cu+EsOiXTiIq5b12Dz
 Kf8Xba84cHaNZCG1nHkBBjp95z4Xt3KtL0BEJshFFeK1FO4RA26XNfaO4s/Oqu79383RUBUz+bS
 Fgzj+eA+TA4vsrm1dbHj8BhuDS8EAw==
X-Proofpoint-ORIG-GUID: XH9HLDcb8xMBu5AD03_zL4XLJcL0HnuM
X-Proofpoint-GUID: XH9HLDcb8xMBu5AD03_zL4XLJcL0HnuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140180

On 11/14/25 12:15 PM, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +		.regulators = {},
> +		.clock = { "slow_ahb_src", "cpas_ahb",

Drop the _src clock, we do ratesetting on it through its dear
child who you have described right next to it

Konrad
