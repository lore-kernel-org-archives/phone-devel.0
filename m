Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EF52BDC3F
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818036; cv=none; b=K77PIj/tzVqSBFYqLM8do7WM9MrycAXye8JYqpPo+cAwaXgXPLWtrwnHCUUyyaLyijuySdeuNM2RJMW2Vg9AtDIdGXJVplp/+E8JbkgNWjv6HpvOZYQdRaNggICXKD1ImrAoSXtEDKfAJaZetEc6Ls8MXXOCVUUZFqPNrN7lmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818036; c=relaxed/simple;
	bh=jDRr6kmHAys4oUmsNHtyBLQBUWiM63bBvhzgLklUZ3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxrZmcHAEB167D5KRmr8G7kZi7lnEqU7lwBLCurZXb5pZXx1aq2wZM3h/kOlnNap4+/vRiC9I+QBZnQtXwYpqe8kwfjmV7Q2uvQVHDenIiG9MfYof6kYPvMTq58kTAfmkWSyeVk1GcOBUS9ddGf55HWpbr6SSf01p9mktHZMDwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc7OpXMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JC32BVbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc7OpXMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JC32BVbH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91Dri1470408
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0E3blSa0Xy96fLcU3N+wYkSyzyfL00o3BG9stgU+hDw=; b=Pc7OpXMg9hd0phAT
	9HcuNYyvZi2XEfvxR+88VhV8eiy+C0iKYk1oeAgY8RsFf5Xj3FsGOSNEWh58QhK+
	5mwRsIvmH8W6fxXyoCYWr03Az3K51RKiTdcb7N65dCAXd0V4JL39myoTOYjgVm5d
	25umukQHJu1Ua+KRX2kHvcEXkoWme6RLRfM1k1lWqNOw0ImJ2iyxtevyJgs4uTRg
	qfHDKTmqdx9Goyrljp01xJWylLccOoelsdS0meyQKdXY9eREa+2gMErlfqMO0izs
	z9s2OEHSmC2EiFWZJT4w5IU3zDZH4zaepsXVsDxYLLi8nXvYvaoplfYLoqqEV+JN
	QvoNcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gums1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:20:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c522c44febso91550685a.0
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 02:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768818034; x=1769422834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0E3blSa0Xy96fLcU3N+wYkSyzyfL00o3BG9stgU+hDw=;
        b=JC32BVbHwGujuFX2gCMUIPG6U5FtlrtSH2ghI1mUqmXViXB17nknPuPWqCWZLqJ8V1
         MIqEEeU+Tz8shZCQaoLS59GEd9krLa9svx4THyzPWDtWuYoPBlTHSVXD2Rc9jJqOvdYh
         srvAl1qNzFUxvo29kXH+HyYSl6bsq/84h8iWIK26nSW7fqPqR5ZLKd8pqxgdGZ8Cl3GA
         NJyTi59jMk75tuI5pwpFkAzq7kLWAxMlHW1Fcd/90nepBtYB0KS96AE3hYOrIi57MvY4
         Zx2oT8IIFT/qp4+XtvIGFqgx7gGET2CUJMvfJ4rFqihsDcZ1uqVdiuYfUrQQ+Ww19SOF
         AM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818034; x=1769422834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0E3blSa0Xy96fLcU3N+wYkSyzyfL00o3BG9stgU+hDw=;
        b=QSYyHC9XKyAPWDn7zM4M1QgYLL/uE7FEfGpvdd85bRTgPN6HLTDKI1xvblamwLIjBW
         rVBxF4xbY0rCx/zKZfkXCNNibyGdlpzo621Vv9aft1TM49PzgVaRBuG2q0GRlHnTqf+X
         0y3RzSJ9dps8gW0lgoreOimJXfFevIrl1J7x1U85dAH71+z4kq+iSSl/bLF9I+EhAFQT
         FGIfetCAVtno1Bf4AXgvVU2pj8L+EALqOKSe4VCDDijha/8epgrUEokwzcEsLjEBdHHu
         wxYAxnWY1Bngs+zdB0NPY3Wd32JrNL7548qY6g6l8JX/y2QRudgpWfKuBioY/WqjbbM8
         WiuA==
X-Forwarded-Encrypted: i=1; AJvYcCWIAIZMUrYQxrLW44qsvB/QkZy/viJvVYgwD4Uj8SQ0GVGtrOVqoQkSy2EJ8eHocm808jNnBayUCsLxdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybov1y+kHTX2as1JTJcE1bEu6/0F0oKx27fNBx3u/jF8UMvAom
	31umUQ0p0JHW53zD8XJcZVJMGQFXAiC2mPd57c0IYTp9b1H1CJ2wxkV6VJM7qOEYeZN/lOA6eOR
	Qis0UAtgLq7Km1ZeZn/ii4inUCpkpCWkAfrb/zdVKTSrWfDTR2AdFCS0Yi5o+ubiWCQ==
X-Gm-Gg: AY/fxX5LeOuIhwmFZxY0JVRFRE/b1co5b19djYgRBC/4xlHXUtl1wTkSVK1JGC5Vayk
	iFCIdkQz49JmSKmtdXQ1aPmHuuGeeBFj0VyrYFzEavmj6SVSMhTHXOhUfZ2stbT/NrmGzfsm03E
	tFe6FYtpXZI2QoGh76ocTk1q6Y5Lui+oCFIEEIiI7MtEX3eS9KKGHnp+NgYz8LOIQIbHy5HOCXq
	iNPvD4afgamh5oda6lCBMtsHKlegM8qO10+Q0LpsR+tGhBaj9mPNp8fpbQEVXQp6SgnBW6TEFlF
	WnTKPPnU8VaWZN6FhKEhG6TR+4yn7LeZ072gq6Tr7vT+q2fCf+jwt1PHi+vscyk+VWtv5p6IJpP
	bSXmA5jvh4sG9UNAEDaH3vBTbkxgXqA==
X-Received: by 2002:a05:622a:508:b0:502:9ed4:eea3 with SMTP id d75a77b69052e-502a1676d4fmr126141031cf.9.1768818033725;
        Mon, 19 Jan 2026 02:20:33 -0800 (PST)
X-Received: by 2002:a05:622a:508:b0:502:9ed4:eea3 with SMTP id d75a77b69052e-502a1676d4fmr126140791cf.9.1768818033291;
        Mon, 19 Jan 2026 02:20:33 -0800 (PST)
Received: from [192.168.119.254] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce433sm9961316a12.3.2026.01.19.02.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:20:32 -0800 (PST)
Message-ID: <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:20:26 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117-efficient-fractal-sloth-aaf7c2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfXx8iSt9q74sgc
 rJOR1GnwCAcnF409coRZWxZgT+6IGETbK3sgAMTt/gTlVezhJXbLoKWqMySoZtsHIgjkZjC/sTS
 88OkFJPMq4hUhCd6389HGm4DqPJ6mP0vjulgjrbz/qGghkp/sb8kcD2LrccBrRDbqL3icKwcyQS
 SNZ1zRpPbStAyqUbCKmDJ5iTZFCxPaNTG9hFupTT/q9Uk3Hr9VQzLd3bKwOq4Fmpiv0veMS4cTk
 hw+5XhKXHzrumyXSVrgVyIfIzudQm6r7l0P7Oju41aDNKvZ/n0MOugXqT+KNk4+KsPiN7zkvnKo
 mNu76Ve68YxPaHenW8iX+LSwqB61QGfkwzAyjh59mHEZNPaFnR7+w21w9LylQsuK3EE2+ZOKvaH
 meUzcptWBrIMO4+WV1m0kBjr/if61yFkKYvwnP2UczHjSDLgmxja+f2GOOnzjb9ogeoEHCjHcx0
 1KNzKn1TiMmWMPQSdRA==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696e0572 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WxS9-qz5E8wbYe8Hv_wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -CZEoW9waWrnAWvvECGQWHnbpHc5-dXr
X-Proofpoint-ORIG-GUID: -CZEoW9waWrnAWvvECGQWHnbpHc5-dXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190084

On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>> Document an interconnect path for camcc that's required to enable
>> the CAMSS_TOP_GDSC power domain.
> 
> I find it confusing. Enabling GDSC power domains is done via power
> domains, not via interconnects. Do not represent power domains as
> interconnects, it's something completely different.

The name of the power domains is CAMSS_TOP_GDSC (seems you misread)

For the power domain to successfully turn on, the MNoC needs to be
turned on (empirical evidence). The way to do it is to request a
nonzero vote on this interconnect path

(presumably because the GDSC or its invisible providers require
something connected over that bus to carry out their enable sequences).

Taniya should be able to explain in more detail

Konrad
